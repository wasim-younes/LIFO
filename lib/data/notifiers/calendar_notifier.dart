import 'package:flutter_riverpod/legacy.dart';
import 'package:life_organizer_app/presentation/providers/calendar_provider.dart';

class CalendarNotifier extends StateNotifier<CalendarState> {
  CalendarNotifier()
      : super(
          CalendarState(
            view: CalendarView.month,
            selectedDate: DateTime.now(),
            viewingDate: DateTime.now(),
          ),
        );

  // Set selected date
  void selectDate(DateTime date) {
    state = state.copyWith(selectedDate: date);
  }

  // Set viewing date (for month/year)
  void setMonthYear(DateTime date) {
    state = state.copyWith(viewingDate: date);
  }

  // Set view type
  void setView(CalendarView view) {
    state = state.copyWith(view: view);
  }

  // Navigate to previous month
  void navigateToPreviousMonth() {
    final current = state.viewingDate;
    final previousMonth = current.month == 1 ? 12 : current.month - 1;
    final previousYear = current.month == 1 ? current.year - 1 : current.year;

    state = state.copyWith(
      viewingDate: DateTime(previousYear, previousMonth, 1),
    );
  }

  // Navigate to next month
  void navigateToNextMonth() {
    final current = state.viewingDate;
    final nextMonth = current.month == 12 ? 1 : current.month + 1;
    final nextYear = current.month == 12 ? current.year + 1 : current.year;

    state = state.copyWith(
      viewingDate: DateTime(nextYear, nextMonth, 1),
    );
  }

  // Navigate to previous year
  void navigateToPreviousYear() {
    final current = state.viewingDate;
    state = state.copyWith(
      viewingDate: DateTime(current.year - 1, current.month, 1),
    );
  }

  // Navigate to next year
  void navigateToNextYear() {
    final current = state.viewingDate;
    state = state.copyWith(
      viewingDate: DateTime(current.year + 1, current.month, 1),
    );
  }

  // Go to today
  void goToToday() {
    final now = DateTime.now();
    state = state.copyWith(
      selectedDate: now,
      viewingDate: now,
    );
  }
}
