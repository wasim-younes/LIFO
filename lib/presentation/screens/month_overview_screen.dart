import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_organizer_app/data/models/schedule.dart';
import 'package:life_organizer_app/presentation/providers/schedule_provider.dart';
import 'package:life_organizer_app/presentation/screens/add_schedule_screen.dart';
import 'package:life_organizer_app/presentation/screens/day_schedule_screen.dart';

class MonthOverviewScreen extends ConsumerWidget {
  final DateTime month;

  const MonthOverviewScreen({super.key, required this.month});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allSchedulesAsync = ref.watch(allSchedulesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${_getMonthName(month)} ${month.year}',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MonthOverviewScreen(month: DateTime.now()),
                ),
              );
            },
            tooltip: 'This Month',
          ),
        ],
      ),
      body: allSchedulesAsync.when(
        data: (allSchedules) {
          // Get scheduled events for this month
          final monthScheduledEvents = allSchedules.where((schedule) {
            return schedule.startDate != null &&
                schedule.startDate!.year == month.year &&
                schedule.startDate!.month == month.month;
          }).toList();

          // Get unscheduled events for this month
          final monthUnscheduledEvents = allSchedules.where((schedule) {
            return schedule.isUnscheduled &&
                schedule.unscheduledYear == month.year &&
                schedule.unscheduledMonth == month.month;
          }).toList();

          final allMonthEvents = [
            ...monthScheduledEvents,
            ...monthUnscheduledEvents
          ];

          if (allMonthEvents.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_month,
                    size: 80,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'No events this month',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tap + to add an event',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            );
          }

          // Group scheduled events by day
          final schedulesByDay = <int, List<Schedule>>{};
          for (final schedule in monthScheduledEvents) {
            final day = schedule.startDate!.day;
            schedulesByDay.putIfAbsent(day, () => []);
            schedulesByDay[day]!.add(schedule);
          }

          final days = schedulesByDay.keys.toList()..sort();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Month summary
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        color: Colors.blue,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${_getMonthName(month)} ${month.year}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '${allMonthEvents.length} events • ${days.length} days with events • ${monthUnscheduledEvents.length} unscheduled',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Unscheduled events section
                if (monthUnscheduledEvents.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          'UNSCHEDULED EVENTS',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      ...monthUnscheduledEvents.map(
                          (event) => _buildUnscheduledEvent(event, context)),
                      const SizedBox(height: 20),
                    ],
                  ),

                // Daily events
                ...days.map((day) {
                  final daySchedules = schedulesByDay[day]!;
                  return _buildDaySection(
                      day, daySchedules, context, month, ref);
                }),

                const SizedBox(height: 80),
              ],
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Error loading schedule: $error',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddScheduleScreen(
                initialDate: month,
              ),
              fullscreenDialog: true,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildUnscheduledEvent(Schedule event, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: event.colorValue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: event.colorValue.withOpacity(0.3)),
      ),
      child: ListTile(
        leading: Icon(
          Icons.event_busy,
          color: event.colorValue,
        ),
        title: Text(
          event.title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: event.colorValue,
          ),
        ),
        subtitle: event.description != null
            ? Text(
                event.description!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            : null,
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: event.colorValue.withOpacity(0.2),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            'Unscheduled',
            style: TextStyle(
              fontSize: 12,
              color: event.colorValue,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDaySection(
    int day,
    List<Schedule> schedules,
    BuildContext context,
    DateTime month,
    WidgetRef ref,
  ) {
    schedules.sort((a, b) => a.startDate!.compareTo(b.startDate!));

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DayScheduleScreen(
                  date: DateTime(month.year, month.month, day),
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Day header
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          day.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _getDayName(DateTime(month.year, month.month, day)),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '${schedules.length} event${schedules.length != 1 ? 's' : ''}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.blue,
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Schedule previews
                ...schedules.take(2).map((schedule) {
                  return _buildSchedulePreview(schedule, context, ref);
                }),

                // More indicator
                if (schedules.length > 2)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '+${schedules.length - 2} more events',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSchedulePreview(
      Schedule schedule, BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade100,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 40,
            decoration: BoxDecoration(
              color: schedule.colorValue,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  schedule.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 14,
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      schedule.isAllDay
                          ? 'All day'
                          : '${schedule.startDate!.hour.toString().padLeft(2, '0')}:${schedule.startDate!.minute.toString().padLeft(2, '0')}',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: schedule.colorValue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        _getShortType(schedule.scheduleType),
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: schedule.colorValue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // DELETE BUTTON
          IconButton(
            icon: const Icon(Icons.delete, size: 18, color: Colors.red),
            onPressed: () => _showDeleteDialog(context, ref, schedule),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(
      BuildContext context, WidgetRef ref, Schedule schedule) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Event'),
        content: Text('Delete "${schedule.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              if (schedule.id != null) {
                final notifier = ref.read(scheduleNotifierProvider.notifier);
                await notifier.deleteSchedule(schedule.id!);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('"${schedule.title}" deleted'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  String _getShortType(String type) {
    switch (type) {
      case 'meeting':
        return 'MTG';
      case 'workout':
        return 'WRK';
      case 'shopping':
        return 'SHP';
      case 'meal':
        return 'ML';
      case 'personal':
        return 'PER';
      case 'lecture':
        return 'LEC';
      case 'entertainment':
        return 'ENT';
      case 'travel':
        return 'TRV';
      default:
        return type.substring(0, 3).toUpperCase();
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
}
