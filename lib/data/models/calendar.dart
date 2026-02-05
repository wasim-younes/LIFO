import 'package:flutter/material.dart';
import 'package:life_organizer_app/data/models/schedule.dart';

class CalendarDay {
  final DateTime date;
  final bool isCurrentMonth;
  final bool isToday;
  final bool isSelected;
  final int scheduleCount;
  final List<Schedule> schedules;

  const CalendarDay({
    required this.date,
    required this.isCurrentMonth,
    this.isToday = false,
    this.isSelected = false,
    this.scheduleCount = 0,
    this.schedules = const [],
  });

  CalendarDay copyWith({
    DateTime? date,
    bool? isCurrentMonth,
    bool? isToday,
    bool? isSelected,
    int? scheduleCount,
    List<Schedule>? schedules,
  }) {
    return CalendarDay(
      date: date ?? this.date,
      isCurrentMonth: isCurrentMonth ?? this.isCurrentMonth,
      isToday: isToday ?? this.isToday,
      isSelected: isSelected ?? this.isSelected,
      scheduleCount: scheduleCount ?? this.scheduleCount,
      schedules: schedules ?? this.schedules,
    );
  }
}

class CalendarMonth {
  final int year;
  final int month;
  final List<CalendarDay> days;
  final List<Schedule> unscheduledEvents;

  const CalendarMonth({
    required this.year,
    required this.month,
    required this.days,
    this.unscheduledEvents = const [],
  });
}

// Helper for responsive calendar cell size
class CalendarLayout {
  static double getCellSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // In portrait mode: height > width
    // In landscape mode: width > height

    if (screenHeight > screenWidth) {
      // Portrait mode - use width for square cells
      return (screenWidth - 16) / 7; // 7 days, minus padding
    } else {
      // Landscape mode - use height for square cells
      return (screenHeight - 120) / 6; // 6 rows (5 weeks + header)
    }
  }

  static double getCellHeight(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate available height for calendar (minus app bar, padding)
    final availableHeight = screenHeight - 120; // App bar + padding

    // Return 1/6 of available height for each row
    return availableHeight / 6;
  }
}
