import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:life_organizer_app/data/models/schedule.dart';
import 'package:life_organizer_app/data/repositories/schedule_repository.dart';
import 'package:life_organizer_app/presentation/providers/app_providers.dart';

// The state for our schedules
class ScheduleState {
  final List<Schedule> schedules;
  final bool isLoading;
  final String? error;

  const ScheduleState({
    required this.schedules,
    this.isLoading = false,
    this.error,
  });

  ScheduleState copyWith({
    List<Schedule>? schedules,
    bool? isLoading,
    String? error,
  }) {
    return ScheduleState(
      schedules: schedules ?? this.schedules,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

// StateNotifier to manage the list of schedules
class ScheduleNotifier extends StateNotifier<ScheduleState> {
  final ScheduleRepository _repository;

  ScheduleNotifier(this._repository)
      : super(
          const ScheduleState(schedules: []),
        ) {
    // Load initial data
    _loadSchedules();
  }

  Future<void> _loadSchedules() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final schedules = await _repository.getAllSchedules();
      state = state.copyWith(
        schedules: schedules,
        isLoading: false,
      );
      print('📅 Loaded ${schedules.length} schedules');
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to load schedules: $e',
      );
      print('❌ Error loading schedules: $e');
    }
  }

  Future<void> addSchedule(Schedule schedule) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final id = await _repository.createSchedule(schedule);
      final newSchedule = schedule.copyWith(id: id);

      final updatedSchedules = [...state.schedules, newSchedule];
      state = state.copyWith(
        schedules: updatedSchedules,
        isLoading: false,
      );

      print('✅ Schedule added: ${newSchedule.title} (ID: $id)');
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to add schedule: $e',
      );
      print('❌ Error adding schedule: $e');
      rethrow;
    }
  }

  Future<void> updateSchedule(Schedule schedule) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      await _repository.updateSchedule(schedule);

      final updatedSchedules = state.schedules.map((s) {
        if (s.id == schedule.id) {
          return schedule;
        }
        return s;
      }).toList();

      state = state.copyWith(
        schedules: updatedSchedules,
        isLoading: false,
      );

      print('✅ Schedule updated: ${schedule.title}');
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to update schedule: $e',
      );
      print('❌ Error updating schedule: $e');
      rethrow;
    }
  }

  Future<void> deleteSchedule(int scheduleId) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      await _repository.deleteSchedule(scheduleId);

      final updatedSchedules =
          state.schedules.where((s) => s.id != scheduleId).toList();

      state = state.copyWith(
        schedules: updatedSchedules,
        isLoading: false,
      );

      print('✅ Schedule deleted: ID $scheduleId');
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to delete schedule: $e',
      );
      print('❌ Error deleting schedule: $e');
      rethrow;
    }
  }

  // Refresh schedules from database
  Future<void> refresh() async {
    print('🔄 Refreshing schedules...');
    await _loadSchedules();
  }

  // Get schedules for specific date
  List<Schedule> getSchedulesForDate(DateTime date) {
    return state.schedules.where((schedule) {
      return schedule.startDate != null &&
          schedule.startDate!.year == date.year &&
          schedule.startDate!.month == date.month &&
          schedule.startDate!.day == date.day;
    }).toList();
  }

  // Get monthly unscheduled events
  List<Schedule> getMonthlyUnscheduled(int year, int month) {
    return state.schedules.where((schedule) {
      return schedule.isUnscheduled &&
          schedule.unscheduledYear == year &&
          schedule.unscheduledMonth == month;
    }).toList();
  }

  // Get yearly unscheduled events
  List<Schedule> getYearlyUnscheduled(int year) {
    return state.schedules.where((schedule) {
      return schedule.isUnscheduled &&
          schedule.unscheduledYear == year &&
          schedule.unscheduledMonth == null;
    }).toList();
  }
}

// Helper provider for schedule notifier operations
final scheduleNotifierOperationsProvider =
    Provider<ScheduleNotifierOperations>((ref) {
  final notifier = ref.read(scheduleNotifierProvider.notifier);
  return ScheduleNotifierOperations(notifier);
});

class ScheduleNotifierOperations {
  final ScheduleNotifier _notifier;

  ScheduleNotifierOperations(this._notifier);

  Future<void> addSchedule(Schedule schedule) =>
      _notifier.addSchedule(schedule);
  Future<void> updateSchedule(Schedule schedule) =>
      _notifier.updateSchedule(schedule);
  Future<void> deleteSchedule(int scheduleId) =>
      _notifier.deleteSchedule(scheduleId);
  Future<void> refresh() => _notifier.refresh();
}

// Loading state provider
final schedulesLoadingProvider = Provider<bool>((ref) {
  return ref.watch(scheduleNotifierProvider.select((state) => state.isLoading));
});

// Error state provider
final schedulesErrorProvider = Provider<String?>((ref) {
  return ref.watch(scheduleNotifierProvider.select((state) => state.error));
});

// Real-time schedules provider (for UI)
final realTimeSchedulesProvider = Provider<List<Schedule>>((ref) {
  return ref.watch(scheduleNotifierProvider.select((state) => state.schedules));
});

// Real-time schedules for date
final realTimeSchedulesForDateProvider =
    Provider.autoDispose.family<List<Schedule>, DateTime>((ref, date) {
  final schedules = ref.watch(realTimeSchedulesProvider);

  return schedules.where((schedule) {
    final start = schedule.startDate;
    if (start == null) return false;

    return start.year == date.year &&
        start.month == date.month &&
        start.day == date.day;
  }).toList();
});

// Schedule repository provider
final scheduleRepositoryProvider = Provider<ScheduleRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return ScheduleRepository(db);
});

// Schedule notifier provider
final scheduleNotifierProvider =
    StateNotifierProvider<ScheduleNotifier, ScheduleState>(
  (ref) => ScheduleNotifier(ref.read(scheduleRepositoryProvider)),
);

// All schedules provider (auto-dispose)
final allSchedulesProvider =
    FutureProvider.autoDispose<List<Schedule>>((ref) async {
  final repository = ref.watch(scheduleRepositoryProvider);
  try {
    return await repository.getAllSchedules();
  } catch (e) {
    print('❌ Error loading all schedules: $e');
    rethrow;
  }
});

// Schedules for specific date provider (auto-dispose)
final schedulesForDateProvider = FutureProvider.autoDispose
    .family<List<Schedule>, DateTime>((ref, date) async {
  final repository = ref.watch(scheduleRepositoryProvider);
  try {
    return await repository.getSchedulesByDate(date);
  } catch (e) {
    print('❌ Error loading schedules for date $date: $e');
    return [];
  }
});

// Monthly unscheduled events provider
final monthlyUnscheduledProvider = FutureProvider.autoDispose
    .family<List<Schedule>, DateTime>((ref, date) async {
  final repository = ref.watch(scheduleRepositoryProvider);
  try {
    return await repository.getMonthlyUnscheduled(date.year, date.month);
  } catch (e) {
    print('❌ Error loading monthly unscheduled: $e');
    return [];
  }
});

// Yearly unscheduled events provider
final yearlyUnscheduledProvider =
    FutureProvider.autoDispose.family<List<Schedule>, int>((ref, year) async {
  final repository = ref.watch(scheduleRepositoryProvider);
  try {
    return await repository.getYearlyUnscheduled(year);
  } catch (e) {
    print('❌ Error loading yearly unscheduled: $e');
    return [];
  }
});

// Schedule types
final scheduleTypesProvider = Provider<List<String>>((ref) {
  return [
    'meeting',
    'workout',
    'shopping',
    'meal',
    'personal',
    'lecture',
    'entertainment',
    'travel',
  ];
});

// Schedule operations
final scheduleOperationsProvider = Provider<ScheduleOperations>((ref) {
  final repository = ref.watch(scheduleRepositoryProvider);
  return ScheduleOperations(repository);
});

class ScheduleOperations {
  final ScheduleRepository _repository;

  ScheduleOperations(this._repository);

  Future<int> createSchedule(Schedule schedule) async {
    try {
      final id = await _repository.createSchedule(schedule);
      print('✅ Schedule created with ID: $id');
      return id;
    } catch (e) {
      print('❌ Error creating schedule: $e');
      rethrow;
    }
  }

  Future<void> updateSchedule(Schedule schedule) async {
    try {
      await _repository.updateSchedule(schedule);
      print('✅ Schedule updated: ${schedule.id}');
    } catch (e) {
      print('❌ Error updating schedule: $e');
      rethrow;
    }
  }

  Future<void> deleteSchedule(int id) async {
    try {
      await _repository.deleteSchedule(id);
      print('✅ Schedule deleted: $id');
    } catch (e) {
      print('❌ Error deleting schedule: $e');
      rethrow;
    }
  }
}
