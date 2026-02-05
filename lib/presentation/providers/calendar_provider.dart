import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:life_organizer_app/data/models/calendar.dart';
import 'package:life_organizer_app/data/models/schedule.dart';
import 'package:life_organizer_app/data/notifiers/calendar_notifier.dart';
import 'package:life_organizer_app/presentation/providers/schedule_provider.dart';

// Calendar view types
enum CalendarView {
  month,
  year,
  decade,
}

// Calendar state
class CalendarState {
  final CalendarView view;
  final DateTime selectedDate;
  final DateTime viewingDate;

  const CalendarState({
    required this.view,
    required this.selectedDate,
    required this.viewingDate,
  });

  CalendarState copyWith({
    CalendarView? view,
    DateTime? selectedDate,
    DateTime? viewingDate,
  }) {
    return CalendarState(
      view: view ?? this.view,
      selectedDate: selectedDate ?? this.selectedDate,
      viewingDate: viewingDate ?? this.viewingDate,
    );
  }
}

// Calendar notifier provider
final calendarNotifierProvider =
    StateNotifierProvider<CalendarNotifier, CalendarState>(
  (ref) => CalendarNotifier(),
);

// Helper providers
final calendarSelectedDateProvider = Provider<DateTime>((ref) {
  return ref
      .watch(calendarNotifierProvider.select((state) => state.selectedDate));
});

final calendarViewingDateProvider = Provider<DateTime>((ref) {
  return ref
      .watch(calendarNotifierProvider.select((state) => state.viewingDate));
});

// Calendar month data provider (using real-time schedules)
final calendarMonthProvider = FutureProvider.autoDispose
    .family<CalendarMonth, DateTime>((ref, viewingDate) async {
  final schedules = ref.watch(realTimeSchedulesProvider);
  final selectedDate = ref.watch(calendarSelectedDateProvider);

  return _buildCalendarMonth(
    year: viewingDate.year,
    month: viewingDate.month,
    schedules: schedules,
    selectedDate: selectedDate,
  );
});

// YEAR CALENDAR PROVIDER
final calendarYearProvider =
    FutureProvider.autoDispose.family<List<int>, int>((ref, year) async {
  final schedules = ref.watch(realTimeSchedulesProvider);

  final monthScheduleCounts = <int>[];
  for (int month = 1; month <= 12; month++) {
    final count = schedules
        .where((schedule) =>
            schedule.startDate != null &&
            schedule.startDate!.year == year &&
            schedule.startDate!.month == month)
        .length;
    monthScheduleCounts.add(count);
  }

  return monthScheduleCounts;
});

// Selected day schedule count provider (real-time)
final selectedDayScheduleCountProvider = Provider.autoDispose<int>((ref) {
  final selectedDate = ref.watch(calendarSelectedDateProvider);
  final schedules = ref.watch(realTimeSchedulesProvider);

  return schedules
      .where((schedule) =>
          schedule.startDate != null &&
          _isSameDay(schedule.startDate!, selectedDate))
      .length;
});

// Helper functions
CalendarMonth _buildCalendarMonth({
  required int year,
  required int month,
  required List<Schedule> schedules,
  required DateTime selectedDate,
}) {
  final days = <CalendarDay>[];
  final firstDayOfMonth = DateTime(year, month, 1);
  final lastDayOfMonth = _getLastDayOfMonth(year, month);
  final today = DateTime.now();

  // Get weekday of first day (1 = Monday, 7 = Sunday)
  final firstWeekday = firstDayOfMonth.weekday;

  // Add days from previous month
  if (firstWeekday > 1) {
    final previousMonth = month == 1 ? 12 : month - 1;
    final previousYear = month == 1 ? year - 1 : year;
    final lastDayOfPreviousMonth =
        _getLastDayOfMonth(previousYear, previousMonth);

    for (int i = firstWeekday - 1; i >= 1; i--) {
      final day = lastDayOfPreviousMonth.day - (i - 1);
      final date = DateTime(previousYear, previousMonth, day);
      final daySchedules = _getSchedulesForDate(date, schedules);
      days.add(CalendarDay(
        date: date,
        isCurrentMonth: false,
        isToday: _isSameDay(date, today),
        isSelected: _isSameDay(date, selectedDate),
        scheduleCount: daySchedules.length,
        schedules: daySchedules,
      ));
    }
  }

  // Add days of current month
  for (int day = 1; day <= lastDayOfMonth.day; day++) {
    final date = DateTime(year, month, day);
    final daySchedules = _getSchedulesForDate(date, schedules);
    days.add(CalendarDay(
      date: date,
      isCurrentMonth: true,
      isToday: _isSameDay(date, today),
      isSelected: _isSameDay(date, selectedDate),
      scheduleCount: daySchedules.length,
      schedules: daySchedules,
    ));
  }

  // Add days from next month to complete the grid (6 weeks × 7 days = 42 days)
  final totalDays = days.length;
  if (totalDays < 42) {
    final nextMonth = month == 12 ? 1 : month + 1;
    final nextYear = month == 12 ? year + 1 : year;

    for (int i = 1; i <= 42 - totalDays; i++) {
      final date = DateTime(nextYear, nextMonth, i);
      final daySchedules = _getSchedulesForDate(date, schedules);
      days.add(CalendarDay(
        date: date,
        isCurrentMonth: false,
        isToday: _isSameDay(date, today),
        isSelected: _isSameDay(date, selectedDate),
        scheduleCount: daySchedules.length,
        schedules: daySchedules,
      ));
    }
  }

  return CalendarMonth(
    year: year,
    month: month,
    days: days,
  );
}

List<Schedule> _getSchedulesForDate(DateTime date, List<Schedule> schedules) {
  return schedules
      .where((schedule) =>
          schedule.startDate != null && _isSameDay(schedule.startDate!, date))
      .toList();
}

DateTime _getLastDayOfMonth(int year, int month) {
  if (month < 12) {
    return DateTime(year, month + 1, 0);
  } else {
    return DateTime(year + 1, 1, 0);
  }
}

bool _isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}
