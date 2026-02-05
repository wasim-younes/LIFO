import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

// Import ALL your table files
import 'tables/base_schedule.dart';
import 'tables/entertainment_schedule.dart';
import 'tables/lecture_schedule.dart';
import 'tables/meal_schedule.dart';
import 'tables/meeting_schedule.dart';
import 'tables/personal_schedule.dart';
import 'tables/shopping_schedule.dart';
import 'tables/travel_schedule.dart';
import 'tables/workout_schedule.dart';
import 'tables/shopping_item.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    BaseSchedule,
    EntertainmentSchedule,
    LectureSchedule,
    MealSchedule,
    MeetingSchedule,
    PersonalSchedule,
    ShoppingSchedule,
    TravelSchedule,
    WorkoutSchedule,
    ShoppingItem,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection()) {
    print('🗄️ Database initialized with schema version: $schemaVersion');
  }

  @override
  int get schemaVersion => 2; // CHANGED FROM 1 TO 2

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        print('🛠️ Creating all tables for the first time...');
        await m.createAll();
        print('✅ All tables created!');
      },
      onUpgrade: (Migrator m, int from, int to) async {
        print('🔄 Upgrading database from version $from to $to');

        if (from < 2) {
          // Add new columns to base_schedule for version 2
          await m.addColumn(baseSchedule, baseSchedule.isUnscheduled);
          await m.addColumn(baseSchedule, baseSchedule.unscheduledYear);
          await m.addColumn(baseSchedule, baseSchedule.unscheduledMonth);
          print('✅ Added unscheduled columns to base_schedule');
        }
      },
      beforeOpen: (details) async {
        if (details.wasCreated) {
          print('🎉 New database created successfully!');
        } else if (details.hadUpgrade) {
          print('🎉 Database upgraded successfully!');
        }

        // Verify tables exist
        await customStatement('PRAGMA foreign_keys = ON');
        print('🔓 Foreign keys enabled');
      },
    );
  }

  // Debug function to check database structure
  Future<void> debugDatabaseStructure() async {
    try {
      // Check if base_schedule table exists
      final tables = await customSelect(
              'SELECT name FROM sqlite_master WHERE type="table"')
          .get();
      print('📋 Database tables:');
      for (final table in tables) {
        print('  - ${table.read<String>('name')}');
      }

      // Check base_schedule columns
      final columns =
          await customSelect('PRAGMA table_info(base_schedule)').get();
      print('📋 base_schedule columns:');
      for (final column in columns) {
        final name = column.read<String>('name');
        final type = column.read<String>('type');
        final notnull = column.read<int>('notnull');
        print('  - $name ($type) ${notnull == 1 ? "NOT NULL" : ""}');
      }
    } catch (e) {
      print('❌ Database debug error: $e');
    }
  }

  // Function to reset database (development only)
  Future<void> resetDatabase() async {
    print('🗑️ Resetting database...');

    // Close the current connection
    await close();

    // Delete the database file
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'calendar_plus_full.db'));

    if (await file.exists()) {
      await file.delete();
      print('🗑️ Old database deleted');
    }

    print('✅ Database reset complete');
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'calendar_plus_full.db'));
    print('📁 Database path: ${file.path}');
    return NativeDatabase(file);
  });
}

// SEPARATE function to create a fresh database instance
Future<AppDatabase> createFreshDatabase() async {
  // First delete existing database
  final dbFolder = await getApplicationDocumentsDirectory();
  final file = File(p.join(dbFolder.path, 'calendar_plus_full.db'));

  if (await file.exists()) {
    await file.delete();
    print('🗑️ Old database deleted');
  }

  // Create new instance
  final db = AppDatabase();

  // Force initialization by doing a simple query
  await db.customStatement('SELECT 1');

  print('✅ Fresh database created');
  return db;
}
