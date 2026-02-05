// lib/data/database/tables/meal_schedule.dart
import 'package:drift/drift.dart';
import 'base_schedule.dart';

class MealSchedule extends Table {
  // FOREIGN KEY to BaseSchedule
  IntColumn get id => integer().references(BaseSchedule, #id)();

  // MEAL-SPECIFIC FIELDS
  TextColumn get mealType =>
      text()(); // 'breakfast', 'lunch', 'dinner', 'snack'
  TextColumn get cuisine =>
      text().nullable()(); // 'italian', 'mexican', 'asian', 'home'
  TextColumn get location =>
      text().nullable()(); // 'home', 'restaurant', 'office', 'takeout'
  TextColumn get restaurantName => text().nullable()();
  TextColumn get dietType =>
      text().nullable()(); // 'vegetarian', 'vegan', 'gluten-free', 'keto'
  TextColumn get menuItems => text().nullable()(); // JSON array
  IntColumn get numberOfPeople => integer().withDefault(const Constant(1))();
  RealColumn get estimatedCost => real().nullable()();
  BoolColumn get isDelivery => boolean().withDefault(const Constant(false))();
  TextColumn get specialRequests => text().nullable()();
  TextColumn get notes => text().nullable()();
}
