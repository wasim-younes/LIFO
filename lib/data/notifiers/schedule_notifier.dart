import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:life_organizer_app/data/models/schedule.dart';

class ScheduleState {
  final List<Schedule> schedules;
  final bool isLoading;
  final String? error;

  const ScheduleState({
    required this.schedules,
    this.isLoading = false,
    this.error,
  });

  ScheduleState copyWith({
    List<Schedule>? schedules,
    bool? isLoading,
    String? error,
  }) {
    return ScheduleState(
      schedules: schedules ?? this.schedules,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class ScheduleNotifier extends StateNotifier<ScheduleState> {
  ScheduleNotifier()
      : super(
          ScheduleState(
            schedules: TestSchedules.getTestSchedulesForMonth(
                DateTime.now().year, DateTime.now().month),
          ),
        );

  // Add a new schedule
  Future<void> addSchedule(Schedule schedule) async {
    try {
      state = state.copyWith(isLoading: true);

      // Simulate API/database delay
      await Future.delayed(const Duration(milliseconds: 300));

      // Create new schedule with ID (simulate database auto-increment)
      final newSchedule = Schedule(
        id: (state.schedules.length + 1000), // Generate unique ID
        title: schedule.title,
        startDate: schedule.startDate,
        endDate: schedule.endDate,
        scheduleType: schedule.scheduleType,
        description: schedule.description,
        color: schedule.color,
        isUnscheduled: schedule.isUnscheduled,
        unscheduledYear: schedule.unscheduledYear,
        unscheduledMonth: schedule.unscheduledMonth,
      );

      // Add to state
      final updatedSchedules = [...state.schedules, newSchedule];
      state = state.copyWith(
        schedules: updatedSchedules,
        isLoading: false,
      );

      print('✅ Schedule added: ${newSchedule.title} (ID: ${newSchedule.id})');
      print('📅 Total schedules: ${updatedSchedules.length}');
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to add schedule: $e',
      );
      print('❌ Error adding schedule: $e');
    }
  }

  // Update existing schedule
  Future<void> updateSchedule(Schedule schedule) async {
    try {
      state = state.copyWith(isLoading: true);

      await Future.delayed(const Duration(milliseconds: 300));

      final updatedSchedules = state.schedules.map((s) {
        if (s.id == schedule.id) {
          return schedule;
        }
        return s;
      }).toList();

      state = state.copyWith(
        schedules: updatedSchedules,
        isLoading: false,
      );

      print('✅ Schedule updated: ${schedule.title}');
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to update schedule: $e',
      );
    }
  }

  // Delete schedule
  Future<void> deleteSchedule(int scheduleId) async {
    try {
      state = state.copyWith(isLoading: true);

      await Future.delayed(const Duration(milliseconds: 300));

      final updatedSchedules =
          state.schedules.where((s) => s.id != scheduleId).toList();

      state = state.copyWith(
        schedules: updatedSchedules,
        isLoading: false,
      );

      print('✅ Schedule deleted: ID $scheduleId');
      print('📅 Total schedules: ${updatedSchedules.length}');
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to delete schedule: $e',
      );
    }
  }

  // Get schedules for specific date
  List<Schedule> getSchedulesForDate(DateTime date) {
    return state.schedules.where((schedule) {
      return schedule.startDate != null &&
          schedule.startDate!.year == date.year &&
          schedule.startDate!.month == date.month &&
          schedule.startDate!.day == date.day;
    }).toList();
  }

  // Get monthly unscheduled events
  List<Schedule> getMonthlyUnscheduled(int year, int month) {
    return state.schedules.where((schedule) {
      return schedule.isUnscheduled &&
          schedule.unscheduledYear == year &&
          schedule.unscheduledMonth == month;
    }).toList();
  }

  // Get yearly unscheduled events
  List<Schedule> getYearlyUnscheduled(int year) {
    return state.schedules.where((schedule) {
      return schedule.isUnscheduled &&
          schedule.unscheduledYear == year &&
          schedule.unscheduledMonth == null;
    }).toList();
  }

  // Clear all schedules (for testing)
  void clearAllSchedules() {
    state = state.copyWith(schedules: []);
    print('🧹 All schedules cleared');
  }

  // Add test data
  void addTestSchedules() {
    final testSchedules = TestSchedules.getTestSchedulesForMonth(
      DateTime.now().year,
      DateTime.now().month,
    );
    state = state.copyWith(schedules: testSchedules);
    print('🧪 Test schedules added: ${testSchedules.length} events');
  }
}
