import 'package:flutter_riverpod/legacy.dart';
import 'package:life_organizer_app/data/models/schedule.dart';
import 'package:life_organizer_app/data/repositories/schedule_repository.dart';
import 'package:life_organizer_app/presentation/providers/schedule_provider.dart';

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
