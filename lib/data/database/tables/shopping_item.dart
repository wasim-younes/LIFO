import 'package:drift/drift.dart';

class ShoppingItem extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  RealColumn get defaultQuantity => real().withDefault(const Constant(1))();
  TextColumn get unit => text().withDefault(const Constant('pcs'))();
  TextColumn get category => text().nullable()();
  TextColumn get brand => text().nullable()();
  RealColumn get estimatedPrice => real().nullable()();
  TextColumn get size => text().nullable()();
  TextColumn get color => text().nullable()();
  TextColumn get imagePath => text().nullable()();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get lastUsed => dateTime().nullable()();
  IntColumn get usageCount => integer().withDefault(const Constant(0))();
}
