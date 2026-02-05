import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:life_organizer_app/data/database/app_database.dart';
import 'package:life_organizer_app/data/models/schedule.dart';
import 'package:life_organizer_app/data/repositories/schedule_repository.dart';
import 'package:life_organizer_app/data/repositories/shopping_repository.dart';

// Database Provider
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();

  // Debug database structure on first access
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    await db.debugDatabaseStructure();
  });

  return db;
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

// Test function to add a test schedule
final testScheduleProvider = FutureProvider<void>((ref) async {
  final repository = ref.watch(scheduleRepositoryProvider);
  try {
    final testSchedule = Schedule(
      title: 'Test Meeting',
      startDate: DateTime.now(),
      endDate: DateTime.now().add(Duration(hours: 1)),
      scheduleType: 'meeting',
      description: 'This is a test schedule',
    );

    final id = await repository.createSchedule(testSchedule);
    print('✅ Test schedule added with ID: $id');
  } catch (e) {
    print('❌ Failed to add test schedule: $e');
  }
});
