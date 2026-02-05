// lib/data/database/tables/workout_schedule.dart
import 'package:drift/drift.dart';
import 'base_schedule.dart';

class WorkoutSchedule extends Table {
  // FOREIGN KEY to BaseSchedule
  IntColumn get id => integer().references(BaseSchedule, #id)();

  // WORKOUT-SPECIFIC FIELDS
  TextColumn get workoutType =>
      text()(); // 'running', 'gym', 'yoga', 'swimming'
  TextColumn get locationType => text()(); // 'indoor', 'outdoor', 'home', 'gym'
  RealColumn get durationMinutes => real()(); // Duration in minutes
  TextColumn get intensity => text()(); // 'low', 'medium', 'high'
  TextColumn get exercises => text().nullable()(); // JSON array of exercises
  RealColumn get distanceKm =>
      real().nullable()(); // Distance for running/cycling
  RealColumn get caloriesBurned => real().nullable()();
  TextColumn get equipment => text().nullable()(); // JSON array of equipment
  TextColumn get notes => text().nullable()();
}
