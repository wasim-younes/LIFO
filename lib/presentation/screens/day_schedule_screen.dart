import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_organizer_app/presentation/providers/calendar_provider.dart';
import 'package:life_organizer_app/presentation/providers/schedule_provider.dart'; // ADD THIS IMPORT
import 'package:life_organizer_app/presentation/widgets/timeline/day_timeline.dart';
import 'package:life_organizer_app/presentation/screens/add_schedule_screen.dart';

class DayScheduleScreen extends ConsumerWidget {
  final DateTime date;

  const DayScheduleScreen({super.key, required this.date});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isToday = _isToday(date);
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenHeight < 700;

    // Listen for schedule changes - FIXED: Use schedulesForDateProvider instead
    final schedulesAsync = ref.watch(schedulesForDateProvider(date));

    // Debug: Show how many schedules we have
    print('📅 DayScheduleScreen: Loading schedules for $date');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(calendarNotifierProvider.notifier).selectDate(date);
    });

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isToday ? 'Today' : _getDayName(date),
              style: TextStyle(
                fontSize: isSmallScreen ? 16 : 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${date.day} ${_getMonthName(date)} ${date.year}',
              style: TextStyle(
                fontSize: isSmallScreen ? 12 : 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: schedulesAsync.when(
          data: (schedules) {
            print('📅 DayScheduleScreen: ${schedules.length} schedules loaded');
            return DayTimeline(date: date);
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddSchedule(context, ref),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _navigateToAddSchedule(BuildContext context, WidgetRef ref) async {
    // Navigate and wait for result
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddScheduleScreen(
          initialDate: date,
        ),
        fullscreenDialog: true,
      ),
    );

    // If schedule was added successfully, refresh
    if (result == true) {
      // Invalidate the provider to force refresh
      ref.invalidate(schedulesForDateProvider(date));
      ref.invalidate(allSchedulesProvider);
      ref.invalidate(scheduleNotifierProvider);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Schedule added successfully!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  String _getDayName(DateTime date) {
    switch (date.weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }

  String _getMonthName(DateTime date) {
    switch (date.month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}
