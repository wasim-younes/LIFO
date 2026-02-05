// lib/data/database/tables/lecture_schedule.dart
import 'package:drift/drift.dart';
import 'base_schedule.dart';

class LectureSchedule extends Table {
  // FOREIGN KEY to BaseSchedule
  IntColumn get id => integer().references(BaseSchedule, #id)();

  // LECTURE-SPECIFIC FIELDS
  TextColumn get subject => text()(); // 'mathematics', 'physics', 'history'
  TextColumn get instructor => text()();
  TextColumn get roomNumber => text().nullable()();
  TextColumn get building => text().nullable()();
  TextColumn get courseCode => text().nullable()();
  TextColumn get materials => text().nullable()(); // JSON array of materials
  BoolColumn get isOnline => boolean().withDefault(const Constant(false))();
  TextColumn get platform => text().nullable()();
  TextColumn get link => text().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get assignments => text().nullable()(); // JSON array
  RealColumn get durationHours => real().nullable()(); // Duration in hours
}
