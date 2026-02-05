// lib/data/database/tables/personal_schedule.dart
import 'package:drift/drift.dart';
import 'base_schedule.dart';

class PersonalSchedule extends Table {
  // FOREIGN KEY to BaseSchedule
  IntColumn get id => integer().references(BaseSchedule, #id)();

  // PERSONAL-SPECIFIC FIELDS
  TextColumn get personalType =>
      text()(); // 'appointment', 'doctor', 'haircut', 'spa', 'car_service'
  TextColumn get providerName => text()(); // Doctor name, salon name, etc.
  TextColumn get location => text().nullable()();
  TextColumn get contactPhone => text().nullable()();
  TextColumn get confirmationNumber => text().nullable()();
  RealColumn get estimatedCost => real().nullable()();
  TextColumn get specialInstructions => text().nullable()();
  BoolColumn get requiresPreparation =>
      boolean().withDefault(const Constant(false))();
  TextColumn get preparationNotes => text().nullable()();
  TextColumn get notes => text().nullable()();
}
