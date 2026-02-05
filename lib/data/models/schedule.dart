import 'package:flutter/material.dart';

class Schedule {
  final int? id;
  final String title;
  final DateTime? startDate;
  final DateTime? endDate;
  final String scheduleType;
  final String? description;
  final String color;
  final bool isUnscheduled;
  final int? unscheduledYear;
  final int? unscheduledMonth;

  Schedule({
    this.id,
    required this.title,
    this.startDate,
    this.endDate,
    required this.scheduleType,
    this.description,
    this.color = '4280391411',
    this.isUnscheduled = false,
    this.unscheduledYear,
    this.unscheduledMonth,
  });

  // Add copyWith method
  Schedule copyWith({
    int? id,
    String? title,
    DateTime? startDate,
    DateTime? endDate,
    String? scheduleType,
    String? description,
    String? color,
    bool? isUnscheduled,
    int? unscheduledYear,
    int? unscheduledMonth,
  }) {
    return Schedule(
      id: id ?? this.id,
      title: title ?? this.title,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      scheduleType: scheduleType ?? this.scheduleType,
      description: description ?? this.description,
      color: color ?? this.color,
      isUnscheduled: isUnscheduled ?? this.isUnscheduled,
      unscheduledYear: unscheduledYear ?? this.unscheduledYear,
      unscheduledMonth: unscheduledMonth ?? this.unscheduledMonth,
    );
  }

  // FIXED: Safe factory constructor with null handling
  factory Schedule.fromData(dynamic data) {
    return Schedule(
      id: data.id,
      title: data.title ?? 'Untitled Event', // Handle null title
      startDate: data.startDate,
      endDate: data.endDate,
      scheduleType: data.scheduleType ?? 'meeting', // Handle null type
      description: data.description,
      color: data.color ?? '4280391411', // Default blue
      isUnscheduled: data.isUnscheduled ?? false,
      unscheduledYear: data.unscheduledYear,
      unscheduledMonth: data.unscheduledMonth,
    );
  }

  Color get colorValue => Color(int.parse(color));
  String get timeString => startDate != null
      ? '${startDate!.hour.toString().padLeft(2, '0')}:${startDate!.minute.toString().padLeft(2, '0')}'
      : '';

  bool get isAllDay =>
      startDate != null && startDate!.hour == 0 && startDate!.minute == 0;
  bool get isMonthlyUnscheduled =>
      isUnscheduled && unscheduledYear != null && unscheduledMonth != null;
  bool get isYearlyUnscheduled =>
      isUnscheduled && unscheduledYear != null && unscheduledMonth == null;
}

class TestSchedules {
  // Get test schedules for a specific month
  static List<Schedule> getTestSchedulesForMonth(int year, int month) {
    final schedules = <Schedule>[];
    final now = DateTime.now();

    // Color codes for different event types
    final colors = {
      'meeting': '4280391411', // Blue
      'workout': '4283215696', // Green
      'shopping': '4294940672', // Orange
      'meal': '4294198070', // Red
      'personal': '4288423856', // Purple
      'lecture': '4278228616', // Teal
      'entertainment': '4294902015', // Pink
      'travel': '4278238426', // Cyan
    };

    // Generate some events for today
    if (year == now.year && month == now.month) {
      // Today
      schedules.add(Schedule(
        id: 1,
        title: 'Morning Workout',
        startDate: DateTime(year, month, now.day, 8, 0),
        endDate: DateTime(year, month, now.day, 9, 0),
        scheduleType: 'workout',
        description: 'Gym session - chest and back',
        color: colors['workout']!,
      ));

      schedules.add(Schedule(
        id: 2,
        title: 'Team Meeting',
        startDate: DateTime(year, month, now.day, 14, 0),
        endDate: DateTime(year, month, now.day, 15, 0),
        scheduleType: 'meeting',
        description: 'Weekly sprint planning',
        color: colors['meeting']!,
      ));

      // Tomorrow
      schedules.add(Schedule(
        id: 3,
        title: 'Grocery Shopping',
        startDate: DateTime(year, month, now.day + 1, 17, 0),
        endDate: DateTime(year, month, now.day + 1, 18, 0),
        scheduleType: 'shopping',
        description: 'Supermarket - buy fruits and vegetables',
        color: colors['shopping']!,
      ));

      // Day after tomorrow - multiple events
      schedules.add(Schedule(
        id: 4,
        title: 'Breakfast Meeting',
        startDate: DateTime(year, month, now.day + 2, 9, 0),
        endDate: DateTime(year, month, now.day + 2, 10, 0),
        scheduleType: 'meeting',
        description: 'Client breakfast at cafe',
        color: colors['meeting']!,
      ));

      schedules.add(Schedule(
        id: 5,
        title: 'Lunch with Friends',
        startDate: DateTime(year, month, now.day + 2, 13, 0),
        endDate: DateTime(year, month, now.day + 2, 14, 30),
        scheduleType: 'meal',
        description: 'Italian restaurant downtown',
        color: colors['meal']!,
      ));

      schedules.add(Schedule(
        id: 6,
        title: 'Doctor Appointment',
        startDate: DateTime(year, month, now.day + 2, 16, 0),
        endDate: DateTime(year, month, now.day + 2, 17, 0),
        scheduleType: 'personal',
        description: 'Annual health checkup',
        color: colors['personal']!,
      ));

      // Add 3 more events on same day to test "more" indicator
      schedules.add(Schedule(
        id: 7,
        title: 'Yoga Class',
        startDate: DateTime(year, month, now.day + 2, 18, 0),
        endDate: DateTime(year, month, now.day + 2, 19, 0),
        scheduleType: 'workout',
        description: 'Evening yoga session',
        color: colors['workout']!,
      ));

      schedules.add(Schedule(
        id: 8,
        title: 'Movie Night',
        startDate: DateTime(year, month, now.day + 2, 20, 0),
        endDate: DateTime(year, month, now.day + 2, 23, 0),
        scheduleType: 'entertainment',
        description: 'New Marvel movie premiere',
        color: colors['entertainment']!,
      ));

      schedules.add(Schedule(
        id: 9,
        title: 'Study Session',
        startDate: DateTime(year, month, now.day + 2, 19, 30),
        endDate: DateTime(year, month, now.day + 2, 21, 0),
        scheduleType: 'lecture',
        description: 'Math exam preparation',
        color: colors['lecture']!,
      ));

      // Week from now
      schedules.add(Schedule(
        id: 10,
        title: 'Business Trip',
        startDate: DateTime(year, month, now.day + 7, 10, 0),
        endDate: DateTime(year, month, now.day + 7, 18, 0),
        scheduleType: 'travel',
        description: 'Flight to conference',
        color: colors['travel']!,
      ));

      // Add events for other days in the month (spread them out)
      for (int i = 0; i < 15; i++) {
        final day = (now.day + i * 2) % DateTime(year, month + 1, 0).day;
        if (day > 0) {
          schedules.add(Schedule(
            id: 11 + i,
            title: 'Event Day ${i + 1}',
            startDate: DateTime(year, month, day, 10 + i % 8, 0),
            endDate: DateTime(year, month, day, 11 + i % 8, 0),
            scheduleType: _getRandomType(i),
            description: 'Test event ${i + 1}',
            color: colors[_getRandomType(i)]!,
          ));
        }
      }

      // Add some unscheduled events for this month
      schedules.add(Schedule(
        id: 100,
        title: 'Monthly Review',
        scheduleType: 'meeting',
        description: 'Monthly performance review',
        color: colors['meeting']!,
        isUnscheduled: true,
        unscheduledYear: year,
        unscheduledMonth: month,
      ));

      schedules.add(Schedule(
        id: 101,
        title: 'Budget Planning',
        scheduleType: 'personal',
        description: 'Plan monthly budget',
        color: colors['personal']!,
        isUnscheduled: true,
        unscheduledYear: year,
        unscheduledMonth: month,
      ));
    }

    return schedules;
  }

  static String _getRandomType(int index) {
    final types = [
      'meeting',
      'workout',
      'shopping',
      'meal',
      'personal',
      'lecture',
      'entertainment',
      'travel'
    ];
    return types[index % types.length];
  }
}

// Shopping schedule model
class ShoppingSchedule {
  final Schedule schedule;
  final bool isOnline;
  final String storeName;
  final String storeType;
  final String? location;
  final List<int>? itemIds;
  final List<double>? itemQuantities;
  final String? itemNotes;
  final double? budget;
  final String priority;
  final String? notes;

  ShoppingSchedule({
    required this.schedule,
    required this.isOnline,
    required this.storeName,
    required this.storeType,
    this.location,
    this.itemIds,
    this.itemQuantities,
    this.itemNotes,
    this.budget,
    this.priority = 'medium',
    this.notes,
  });

  // For creating new shopping schedule
  factory ShoppingSchedule.create({
    required String title,
    required DateTime startDate,
    DateTime? endDate,
    String? description,
    required bool isOnline,
    required String storeName,
    required String storeType,
    String? location,
    List<int>? itemIds,
    List<double>? itemQuantities,
    String? itemNotes,
    double? budget,
    String priority = 'medium',
    String? notes,
  }) {
    return ShoppingSchedule(
      schedule: Schedule(
        title: title,
        startDate: startDate,
        endDate: endDate,
        scheduleType: 'shopping',
        description: description,
      ),
      isOnline: isOnline,
      storeName: storeName,
      storeType: storeType,
      location: location,
      itemIds: itemIds,
      itemQuantities: itemQuantities,
      itemNotes: itemNotes,
      budget: budget,
      priority: priority,
      notes: notes,
    );
  }
}

// Workout schedule model
class WorkoutSchedule {
  final Schedule schedule;
  final String workoutType;
  final String locationType;
  final double durationMinutes;
  final String intensity;
  final String? exercises;
  final double? distanceKm;
  final double? caloriesBurned;
  final String? equipment;
  final String? notes;

  WorkoutSchedule({
    required this.schedule,
    required this.workoutType,
    required this.locationType,
    required this.durationMinutes,
    required this.intensity,
    this.exercises,
    this.distanceKm,
    this.caloriesBurned,
    this.equipment,
    this.notes,
  });

  factory WorkoutSchedule.create({
    required String title,
    required DateTime startDate,
    DateTime? endDate,
    String? description,
    required String workoutType,
    required String locationType,
    required double durationMinutes,
    required String intensity,
    String? exercises,
    double? distanceKm,
    double? caloriesBurned,
    String? equipment,
    String? notes,
  }) {
    return WorkoutSchedule(
      schedule: Schedule(
        title: title,
        startDate: startDate,
        endDate: endDate,
        scheduleType: 'workout',
        description: description,
      ),
      workoutType: workoutType,
      locationType: locationType,
      durationMinutes: durationMinutes,
      intensity: intensity,
      exercises: exercises,
      distanceKm: distanceKm,
      caloriesBurned: caloriesBurned,
      equipment: equipment,
      notes: notes,
    );
  }
}

// Meeting schedule model
class MeetingSchedule {
  final Schedule schedule;
  final String location;
  final List<String> attendees;
  final String organizer;
  final String? agenda;
  final String meetingType;
  final bool isVirtual;
  final String? platform;
  final String? link;
  final String? notes;
  final List<String>? attachments;

  MeetingSchedule({
    required this.schedule,
    required this.location,
    required this.attendees,
    required this.organizer,
    this.agenda,
    required this.meetingType,
    this.isVirtual = false,
    this.platform,
    this.link,
    this.notes,
    this.attachments,
  });

  factory MeetingSchedule.create({
    required String title,
    required DateTime startDate,
    DateTime? endDate,
    String? description,
    required String location,
    required List<String> attendees,
    required String organizer,
    String? agenda,
    required String meetingType,
    bool isVirtual = false,
    String? platform,
    String? link,
    String? notes,
    List<String>? attachments,
  }) {
    return MeetingSchedule(
      schedule: Schedule(
        title: title,
        startDate: startDate,
        endDate: endDate,
        scheduleType: 'meeting',
        description: description,
      ),
      location: location,
      attendees: attendees,
      organizer: organizer,
      agenda: agenda,
      meetingType: meetingType,
      isVirtual: isVirtual,
      platform: platform,
      link: link,
      notes: notes,
      attachments: attachments,
    );
  }
}

// Meal schedule model
class MealSchedule {
  final Schedule schedule;
  final String mealType;
  final String? cuisine;
  final String? location;
  final String? restaurantName;
  final String? dietType;
  final List<String>? menuItems;
  final int numberOfPeople;
  final double? estimatedCost;
  final bool isDelivery;
  final String? specialRequests;
  final String? notes;

  MealSchedule({
    required this.schedule,
    required this.mealType,
    this.cuisine,
    this.location,
    this.restaurantName,
    this.dietType,
    this.menuItems,
    this.numberOfPeople = 1,
    this.estimatedCost,
    this.isDelivery = false,
    this.specialRequests,
    this.notes,
  });

  factory MealSchedule.create({
    required String title,
    required DateTime startDate,
    DateTime? endDate,
    String? description,
    required String mealType,
    String? cuisine,
    String? location,
    String? restaurantName,
    String? dietType,
    List<String>? menuItems,
    int numberOfPeople = 1,
    double? estimatedCost,
    bool isDelivery = false,
    String? specialRequests,
    String? notes,
  }) {
    return MealSchedule(
      schedule: Schedule(
        title: title,
        startDate: startDate,
        endDate: endDate,
        scheduleType: 'meal',
        description: description,
      ),
      mealType: mealType,
      cuisine: cuisine,
      location: location,
      restaurantName: restaurantName,
      dietType: dietType,
      menuItems: menuItems,
      numberOfPeople: numberOfPeople,
      estimatedCost: estimatedCost,
      isDelivery: isDelivery,
      specialRequests: specialRequests,
      notes: notes,
    );
  }
}
