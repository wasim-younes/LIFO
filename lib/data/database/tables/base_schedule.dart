import 'package:drift/drift.dart';

class BaseSchedule extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  DateTimeColumn get startDate => dateTime().nullable()(); // Now nullable
  DateTimeColumn get endDate => dateTime().nullable()(); // Now nullable
  TextColumn get scheduleType => text()();
  TextColumn get description => text().nullable()();
  TextColumn get color => text().withDefault(const Constant('4280391411'))();
  BoolColumn get isUnscheduled =>
      boolean().withDefault(const Constant(false))();
  IntColumn get unscheduledYear => integer().nullable()();
  IntColumn get unscheduledMonth => integer().nullable()();
}
