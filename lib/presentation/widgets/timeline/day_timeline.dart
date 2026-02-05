import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_organizer_app/data/models/schedule.dart';
import 'package:life_organizer_app/presentation/providers/schedule_provider.dart';

class DayTimeline extends ConsumerWidget {
  final DateTime date;

  const DayTimeline({super.key, required this.date});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // realTimeSchedulesForDateProvider returns List<Schedule> directly
    final schedules = ref.watch(realTimeSchedulesForDateProvider(date));
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    // Debug info
    print('📅 DayTimeline: ${schedules.length} schedules for $date');

    if (schedules.isEmpty) {
      return _buildEmptyState();
    }

    // Separate scheduled and unscheduled events
    final scheduledEvents =
        schedules.where((s) => s.startDate != null).toList();
    final unscheduledEvents =
        schedules.where((s) => s.startDate == null).toList();

    // Sort only scheduled events by time
    scheduledEvents.sort((a, b) => a.startDate!.compareTo(b.startDate!));

    final allDayEvents = scheduledEvents.where((s) => s.isAllDay).toList();
    final timedEvents = scheduledEvents.where((s) => !s.isAllDay).toList();

    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Unscheduled events at top
          if (unscheduledEvents.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: _buildUnscheduledSection(
                  unscheduledEvents, context, isSmallScreen),
            ),

          // All day events
          if (allDayEvents.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: _buildAllDaySection(allDayEvents, context, isSmallScreen),
            ),

          // Timed events
          if (timedEvents.isNotEmpty)
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 8 : 16,
              ),
              child: Column(
                children: List.generate(timedEvents.length, (index) {
                  final event = timedEvents[index];
                  final isLast = index == timedEvents.length - 1;
                  return _buildTimelineEvent(
                    event,
                    context,
                    isLast,
                    isSmallScreen,
                  );
                }),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildUnscheduledSection(
    List<Schedule> events,
    BuildContext context,
    bool isSmallScreen,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12, left: 4),
          child: Text(
            'UNSCHEDULED',
            style: TextStyle(
              fontSize: isSmallScreen ? 10 : 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade500,
              letterSpacing: 1,
            ),
          ),
        ),
        ...events.map(
            (event) => _buildUnscheduledEvent(event, context, isSmallScreen)),
      ],
    );
  }

  Widget _buildUnscheduledEvent(
    Schedule event,
    BuildContext context,
    bool isSmallScreen,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
        child: Row(
          children: [
            Icon(
              Icons.event_busy,
              color: event.colorValue,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: TextStyle(
                      fontSize: isSmallScreen ? 14 : 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (event.description != null)
                    Text(
                      event.description!,
                      style: TextStyle(
                        fontSize: isSmallScreen ? 12 : 13,
                        color: Colors.grey.shade600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: event.colorValue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'Unscheduled',
                style: TextStyle(
                  fontSize: isSmallScreen ? 10 : 12,
                  color: event.colorValue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineEvent(
    Schedule event,
    BuildContext context,
    bool isLast,
    bool isSmallScreen,
  ) {
    // event.startDate is guaranteed not null here because we filtered
    final startTime = event.startDate!;
    final endTime = event.endDate ?? startTime.add(const Duration(hours: 1));
    final duration = endTime.difference(startTime);
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: isSmallScreen ? 50 : 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 12 : 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (duration.inMinutes > 0 && !isSmallScreen)
                  Text(
                    '${hours > 0 ? '${hours}h ' : ''}${minutes > 0 ? '${minutes}m' : ''}'
                        .trim(),
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade500,
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 8 : 12),
            child: Column(
              children: [
                Container(
                  width: isSmallScreen ? 10 : 12,
                  height: isSmallScreen ? 10 : 12,
                  decoration: BoxDecoration(
                    color: event.colorValue,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                ),
                Container(
                  width: 2,
                  height: isLast ? 0 : 100,
                  color: event.colorValue.withOpacity(0.3),
                  margin: EdgeInsets.only(
                    top: 4,
                    bottom: isLast ? 0 : 4,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => _showEventDetails(event, context),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: isSmallScreen ? 6 : 8,
                              vertical: isSmallScreen ? 3 : 4,
                            ),
                            decoration: BoxDecoration(
                              color: event.colorValue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              _getShortType(event.scheduleType),
                              style: TextStyle(
                                fontSize: isSmallScreen ? 8 : 10,
                                fontWeight: FontWeight.w600,
                                color: event.colorValue,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          const Spacer(),
                          if (event.endDate != null && !isSmallScreen)
                            Text(
                              '${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}',
                              style: TextStyle(
                                fontSize: isSmallScreen ? 10 : 12,
                                color: Colors.grey.shade500,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        event.title,
                        style: TextStyle(
                          fontSize: isSmallScreen ? 14 : 16,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (event.description != null && !isSmallScreen)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            event.description!,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      if (!isSmallScreen)
                        Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            _getScheduleIcon(event.scheduleType),
                            color: event.colorValue.withOpacity(0.7),
                            size: 20,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showEventDetails(Schedule event, BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      controller: scrollController,
                      padding: const EdgeInsets.all(20),
                      children: [
                        Container(
                          height: 4,
                          width: 60,
                          decoration: BoxDecoration(
                            color: event.colorValue,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          margin: const EdgeInsets.only(bottom: 20),
                        ),
                        Row(
                          children: [
                            Icon(
                              _getScheduleIcon(event.scheduleType),
                              color: event.colorValue,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              event.scheduleType.toUpperCase(),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: event.colorValue,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          event.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Time detail - handle null startDate
                        _buildDetailItem(
                          icon: Icons.access_time,
                          title: 'Time',
                          value: event.startDate == null
                              ? 'Unscheduled'
                              : event.isAllDay
                                  ? 'All day'
                                  : '${event.startDate!.hour.toString().padLeft(2, '0')}:${event.startDate!.minute.toString().padLeft(2, '0')} - ${event.endDate?.hour.toString().padLeft(2, '0')}:${event.endDate?.minute.toString().padLeft(2, '0')}',
                          color: event.colorValue,
                        ),

                        // Date detail - handle null startDate
                        _buildDetailItem(
                          icon: Icons.calendar_today,
                          title: 'Date',
                          value: event.startDate == null
                              ? event.isMonthlyUnscheduled
                                  ? '${event.unscheduledMonth}/${event.unscheduledYear}'
                                  : event.isYearlyUnscheduled
                                      ? 'Year: ${event.unscheduledYear}'
                                      : 'No date set'
                              : '${event.startDate!.day} ${_getMonthName(event.startDate!)} ${event.startDate!.year}',
                          color: event.colorValue,
                        ),

                        if (event.description != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Text(
                                'Description',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                event.description!,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(
                          color: Colors.grey.shade200,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text('Close'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: event.colorValue,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text('Edit'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
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

  IconData _getScheduleIcon(String type) {
    switch (type) {
      case 'meeting':
        return Icons.people;
      case 'workout':
        return Icons.fitness_center;
      case 'shopping':
        return Icons.shopping_cart;
      case 'meal':
        return Icons.restaurant;
      case 'personal':
        return Icons.person;
      case 'lecture':
        return Icons.school;
      case 'entertainment':
        return Icons.movie;
      case 'travel':
        return Icons.flight;
      default:
        return Icons.event;
    }
  }

  Widget _buildAllDayEvent(
    Schedule event,
    BuildContext context,
    bool isSmallScreen,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: event.colorValue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: event.colorValue.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: isSmallScreen ? 12 : 16,
          vertical: 8,
        ),
        leading: Container(
          width: 4,
          decoration: BoxDecoration(
            color: event.colorValue,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        title: Text(
          event.title,
          style: TextStyle(
            fontSize: isSmallScreen ? 14 : 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: event.description != null
            ? Text(
                event.description!,
                style: TextStyle(
                  fontSize: isSmallScreen ? 12 : 13,
                  color: Colors.grey.shade600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            : null,
        trailing: Icon(
          _getScheduleIcon(event.scheduleType),
          color: event.colorValue,
          size: isSmallScreen ? 18 : 20,
        ),
        onTap: () => _showEventDetails(event, context),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_note,
              size: 80,
              color: Colors.grey.shade300,
            ),
            const SizedBox(height: 20),
            Text(
              'No events scheduled',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tap + to add an event',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAllDaySection(
    List<Schedule> events,
    BuildContext context,
    bool isSmallScreen,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12, left: 4),
          child: Text(
            'ALL DAY',
            style: TextStyle(
              fontSize: isSmallScreen ? 10 : 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade500,
              letterSpacing: 1,
            ),
          ),
        ),
        ...events
            .map((event) => _buildAllDayEvent(event, context, isSmallScreen)),
      ],
    );
  }

  Widget _buildDetailItem({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: color,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
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
