import 'package:drift/drift.dart';
import 'package:life_organizer_app/data/database/app_database.dart';
import 'package:life_organizer_app/data/models/schedule.dart';

class ScheduleRepository {
  final AppDatabase db;

  ScheduleRepository(this.db);

  // Create schedule (can be unscheduled)
  Future<int> createSchedule(Schedule schedule) async {
    try {
      print('📝 Creating schedule: ${schedule.title}');
      print('📝 isUnscheduled: ${schedule.isUnscheduled}');
      print('📝 unscheduledYear: ${schedule.unscheduledYear}');
      print('📝 unscheduledMonth: ${schedule.unscheduledMonth}');

      final id = await db.into(db.baseSchedule).insert(
            BaseScheduleCompanion.insert(
              title: schedule.title,
              startDate: Value(schedule.startDate),
              endDate: Value(schedule.endDate),
              scheduleType: schedule.scheduleType,
              description: Value(schedule.description),
              color: Value(schedule.color),
              isUnscheduled: Value(schedule.isUnscheduled),
              unscheduledYear: Value(schedule.unscheduledYear),
              unscheduledMonth: Value(schedule.unscheduledMonth),
            ),
          );
      print('✅ Schedule created with ID: $id');
      return id;
    } catch (e) {
      print('❌ Error creating schedule: $e');
      rethrow;
    }
  }

  // Update schedule
  Future<void> updateSchedule(Schedule schedule) async {
    try {
      if (schedule.id == null) {
        throw Exception('Cannot update schedule without ID');
      }

      await (db.update(db.baseSchedule)
            ..where((t) => t.id.equals(schedule.id!)))
          .write(BaseScheduleCompanion(
        title: Value(schedule.title),
        startDate: Value(schedule.startDate),
        endDate: Value(schedule.endDate),
        scheduleType: Value(schedule.scheduleType),
        description: Value(schedule.description),
        color: Value(schedule.color),
        isUnscheduled: Value(schedule.isUnscheduled),
        unscheduledYear: Value(schedule.unscheduledYear),
        unscheduledMonth: Value(schedule.unscheduledMonth),
      ));

      print('✅ Schedule updated: ${schedule.id}');
    } catch (e) {
      print('❌ Error updating schedule: $e');
      rethrow;
    }
  }

  // Get schedules for specific date
  Future<List<Schedule>> getSchedulesByDate(DateTime date) async {
    try {
      final startOfDay = DateTime(date.year, date.month, date.day);
      final endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59);

      final schedules = await (db.select(db.baseSchedule)
            ..where((t) => t.startDate.isBetweenValues(startOfDay, endOfDay))
            ..orderBy([(t) => OrderingTerm(expression: t.startDate)]))
          .get();

      print('📅 Found ${schedules.length} schedules for $date');
      return schedules.map(Schedule.fromData).toList();
    } catch (e) {
      print('❌ Error getting schedules: $e');
      return [];
    }
  }

  // Get monthly unscheduled events
  Future<List<Schedule>> getMonthlyUnscheduled(int year, int month) async {
    try {
      final schedules = await (db.select(db.baseSchedule)
            ..where((t) => t.isUnscheduled.equals(true))
            ..where((t) => t.unscheduledYear.equals(year))
            ..where((t) => t.unscheduledMonth.equals(month))
            ..orderBy([(t) => OrderingTerm(expression: t.title)]))
          .get();

      print(
          '📅 Found ${schedules.length} monthly unscheduled events for $month/$year');
      return schedules.map(Schedule.fromData).toList();
    } catch (e) {
      print('❌ Error getting monthly unscheduled: $e');
      return [];
    }
  }

  // Get yearly unscheduled events
  Future<List<Schedule>> getYearlyUnscheduled(int year) async {
    try {
      final schedules = await (db.select(db.baseSchedule)
            ..where((t) => t.isUnscheduled.equals(true))
            ..where((t) => t.unscheduledYear.equals(year))
            ..where((t) => t.unscheduledMonth.isNull())
            ..orderBy([(t) => OrderingTerm(expression: t.title)]))
          .get();

      print('📅 Found ${schedules.length} yearly unscheduled events for $year');
      return schedules.map(Schedule.fromData).toList();
    } catch (e) {
      print('❌ Error getting yearly unscheduled: $e');
      return [];
    }
  }

  // Get all schedules
  Future<List<Schedule>> getAllSchedules() async {
    try {
      print('📋 Fetching all schedules from database...');
      final schedules = await db.select(db.baseSchedule).get();
      print('📋 Database returned ${schedules.length} raw schedule records');

      // Filter out any null schedules
      final validSchedules = schedules.where((data) {
        // Check required fields are not null
        final isValid = data.title != null && data.scheduleType != null;

        if (!isValid) {
          print('⚠️ Skipping invalid schedule record: $data');
        }

        return isValid;
      }).toList();

      print('✅ Valid schedules: ${validSchedules.length}');
      return validSchedules.map(Schedule.fromData).toList();
    } catch (e) {
      print('❌ Error loading schedules: $e');
      return [];
    }
  }

  // Delete schedule
  Future<void> deleteSchedule(int id) async {
    try {
      await (db.delete(db.baseSchedule)..where((t) => t.id.equals(id))).go();
      print('✅ Schedule deleted: $id');
    } catch (e) {
      print('❌ Error deleting: $e');
      rethrow;
    }
  }

  // Specialized operations (Shopping, Workout, etc.)
  Future<int> createShoppingSchedule(ShoppingSchedule shoppingSchedule) async {
    return await db.transaction(() async {
      final scheduleId = await createSchedule(shoppingSchedule.schedule);
      await db.into(db.shoppingSchedule).insert(
            ShoppingScheduleCompanion.insert(
              id: scheduleId,
              isOnline: Value(shoppingSchedule.isOnline),
              storeName: shoppingSchedule.storeName,
              storeType: shoppingSchedule.storeType,
              location: Value(shoppingSchedule.location),
              itemIds: Value(shoppingSchedule.itemIds?.join(',')),
              itemQuantities: Value(shoppingSchedule.itemQuantities?.join(',')),
              itemNotes: Value(shoppingSchedule.itemNotes),
              budget: Value(shoppingSchedule.budget),
              priority: Value(shoppingSchedule.priority),
              notes: Value(shoppingSchedule.notes),
            ),
          );
      return scheduleId;
    });
  }

  Future<List<ShoppingSchedule>> getShoppingSchedulesByDate(
      DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59);

    final baseSchedules = await (db.select(db.baseSchedule)
          ..where((t) => t.scheduleType.equals('shopping'))
          ..where((t) => t.startDate.isBetweenValues(startOfDay, endOfDay)))
        .get();

    final result = <ShoppingSchedule>[];
    for (final base in baseSchedules) {
      final details = await (db.select(db.shoppingSchedule)
            ..where((t) => t.id.equals(base.id)))
          .getSingleOrNull();

      if (details != null) {
        result.add(ShoppingSchedule(
          schedule: Schedule.fromData(base),
          isOnline: details.isOnline,
          storeName: details.storeName,
          storeType: details.storeType,
          location: details.location,
          itemIds: details.itemIds?.split(',').map(int.parse).toList(),
          itemQuantities:
              details.itemQuantities?.split(',').map(double.parse).toList(),
          itemNotes: details.itemNotes,
          budget: details.budget,
          priority: details.priority,
          notes: details.notes,
        ));
      }
    }
    return result;
  }

  // Workout Operations
  Future<int> createWorkoutSchedule(WorkoutSchedule workoutSchedule) async {
    return await db.transaction(() async {
      final scheduleId = await createSchedule(workoutSchedule.schedule);
      await db.into(db.workoutSchedule).insert(
            WorkoutScheduleCompanion.insert(
              id: scheduleId,
              workoutType: workoutSchedule.workoutType,
              locationType: workoutSchedule.locationType,
              durationMinutes: workoutSchedule.durationMinutes,
              intensity: workoutSchedule.intensity,
              exercises: Value(workoutSchedule.exercises),
              distanceKm: Value(workoutSchedule.distanceKm),
              caloriesBurned: Value(workoutSchedule.caloriesBurned),
              equipment: Value(workoutSchedule.equipment),
              notes: Value(workoutSchedule.notes),
            ),
          );
      return scheduleId;
    });
  }

  Future<List<WorkoutSchedule>> getWorkoutSchedulesByDate(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59);

    final baseSchedules = await (db.select(db.baseSchedule)
          ..where((t) => t.scheduleType.equals('workout'))
          ..where((t) => t.startDate.isBetweenValues(startOfDay, endOfDay)))
        .get();

    final result = <WorkoutSchedule>[];
    for (final base in baseSchedules) {
      final details = await (db.select(db.workoutSchedule)
            ..where((t) => t.id.equals(base.id)))
          .getSingleOrNull();

      if (details != null) {
        result.add(WorkoutSchedule(
          schedule: Schedule.fromData(base),
          workoutType: details.workoutType,
          locationType: details.locationType,
          durationMinutes: details.durationMinutes,
          intensity: details.intensity,
          exercises: details.exercises,
          distanceKm: details.distanceKm,
          caloriesBurned: details.caloriesBurned,
          equipment: details.equipment,
          notes: details.notes,
        ));
      }
    }
    return result;
  }

  // Create Meeting
  Future<int> createMeetingSchedule(MeetingSchedule meetingSchedule) async {
    return await db.transaction(() async {
      final scheduleId = await createSchedule(meetingSchedule.schedule);
      await db.into(db.meetingSchedule).insert(
            MeetingScheduleCompanion.insert(
              id: scheduleId,
              location: meetingSchedule.location,
              attendees: meetingSchedule.attendees.join(','),
              organizer: meetingSchedule.organizer,
              agenda: Value(meetingSchedule.agenda),
              meetingType: meetingSchedule.meetingType,
              isVirtual: Value(meetingSchedule.isVirtual),
              platform: Value(meetingSchedule.platform),
              link: Value(meetingSchedule.link),
              notes: Value(meetingSchedule.notes),
              attachments: Value(meetingSchedule.attachments?.join(',')),
            ),
          );
      return scheduleId;
    });
  }

  // Create Meal
  Future<int> createMealSchedule(MealSchedule mealSchedule) async {
    return await db.transaction(() async {
      final scheduleId = await createSchedule(mealSchedule.schedule);
      await db.into(db.mealSchedule).insert(
            MealScheduleCompanion.insert(
              id: scheduleId,
              mealType: mealSchedule.mealType,
              cuisine: Value(mealSchedule.cuisine),
              location: Value(mealSchedule.location),
              restaurantName: Value(mealSchedule.restaurantName),
              dietType: Value(mealSchedule.dietType),
              menuItems: Value(mealSchedule.menuItems?.join(',')),
              numberOfPeople: Value(mealSchedule.numberOfPeople),
              estimatedCost: Value(mealSchedule.estimatedCost),
              isDelivery: Value(mealSchedule.isDelivery),
              specialRequests: Value(mealSchedule.specialRequests),
              notes: Value(mealSchedule.notes),
            ),
          );
      return scheduleId;
    });
  }
}
