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
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        print('✅ All tables created successfully!');
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Handle database upgrades here
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'calendar_plus_full.db'));
    return NativeDatabase(file);
  });
}
