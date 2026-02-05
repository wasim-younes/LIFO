import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:life_organizer_app/data/database/app_database.dart';
import 'package:life_organizer_app/data/repositories/schedule_repository.dart';
import 'package:life_organizer_app/data/repositories/shopping_repository.dart';

// Database Provider
final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

// Repository Providers
final scheduleRepositoryProvider = Provider<ScheduleRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return ScheduleRepository(db);
});

final shoppingRepositoryProvider = Provider<ShoppingRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return ShoppingRepository(db);
});

// Date Provider
final selectedDateProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});
