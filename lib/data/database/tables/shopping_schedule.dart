import 'package:drift/drift.dart';
import 'base_schedule.dart';

class ShoppingSchedule extends Table {
  IntColumn get id => integer().references(BaseSchedule, #id)();
  BoolColumn get isOnline => boolean().withDefault(const Constant(false))();
  TextColumn get storeName => text()();
  TextColumn get storeType => text()();
  TextColumn get location => text().nullable()();
  TextColumn get itemIds => text().nullable()();
  TextColumn get itemQuantities => text().nullable()();
  TextColumn get itemNotes => text().nullable()();
  RealColumn get budget => real().nullable()();
  TextColumn get priority => text().withDefault(const Constant('medium'))();
  TextColumn get notes => text().nullable()();
}
