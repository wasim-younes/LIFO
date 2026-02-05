// lib/data/database/tables/meeting_schedule.dart
import 'package:drift/drift.dart';
import 'base_schedule.dart';

class MeetingSchedule extends Table {
  // FOREIGN KEY to BaseSchedule
  IntColumn get id => integer().references(BaseSchedule, #id)();

  // MEETING-SPECIFIC FIELDS
  TextColumn get location => text()();
  TextColumn get attendees => text()(); // JSON array
  TextColumn get organizer => text()();
  TextColumn get agenda => text().nullable()();
  TextColumn get meetingType =>
      text()(); // 'business', 'team', 'client', 'personal'
  BoolColumn get isVirtual => boolean().withDefault(const Constant(false))();
  TextColumn get platform =>
      text().nullable()(); // 'Zoom', 'Teams', 'Google Meet'
  TextColumn get link => text().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get attachments => text().nullable()(); // JSON array of file paths
}
