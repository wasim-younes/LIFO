import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_organizer_app/data/models/schedule.dart';
import 'package:life_organizer_app/presentation/providers/app_providers.dart';

// Shopping schedules by date
final shoppingSchedulesForDateProvider = FutureProvider.autoDispose
    .family<List<ShoppingSchedule>, DateTime>((ref, date) async {
  final repository = ref.watch(scheduleRepositoryProvider);
  return await repository.getShoppingSchedulesByDate(date);
});

// Create shopping schedule
final createShoppingScheduleProvider = FutureProvider.autoDispose
    .family<int, ShoppingSchedule>((ref, schedule) async {
  final repository = ref.watch(scheduleRepositoryProvider);
  return await repository.createShoppingSchedule(schedule);
});

// Workout schedules by date
final workoutSchedulesForDateProvider = FutureProvider.autoDispose
    .family<List<WorkoutSchedule>, DateTime>((ref, date) async {
  final repository = ref.watch(scheduleRepositoryProvider);
  return await repository.getWorkoutSchedulesByDate(date);
});

// Create workout schedule
final createWorkoutScheduleProvider = FutureProvider.autoDispose
    .family<int, WorkoutSchedule>((ref, schedule) async {
  final repository = ref.watch(scheduleRepositoryProvider);
  return await repository.createWorkoutSchedule(schedule);
});

// Create meeting schedule
final createMeetingScheduleProvider = FutureProvider.autoDispose
    .family<int, MeetingSchedule>((ref, schedule) async {
  final repository = ref.watch(scheduleRepositoryProvider);
  return await repository.createMeetingSchedule(schedule);
});

// Create meal schedule
final createMealScheduleProvider =
    FutureProvider.autoDispose.family<int, MealSchedule>((ref, schedule) async {
  final repository = ref.watch(scheduleRepositoryProvider);
  return await repository.createMealSchedule(schedule);
});
