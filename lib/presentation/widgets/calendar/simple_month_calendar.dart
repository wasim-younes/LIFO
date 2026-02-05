import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_organizer_app/data/models/calendar.dart';
import 'package:life_organizer_app/presentation/providers/calendar_provider.dart';
import 'package:life_organizer_app/presentation/screens/day_schedule_screen.dart';

class SimpleMonthCalendar extends ConsumerWidget {
  const SimpleMonthCalendar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewingDate = ref.watch(calendarViewingDateProvider);
    final calendarAsync = ref.watch(calendarMonthProvider(viewingDate));

    return calendarAsync.when(
      data: (calendar) => _buildGoogleStyleCalendar(calendar, ref, context),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stack) => Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Error loading calendar\n$error',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ),
      ),
    );
  }

  Widget _buildGoogleStyleCalendar(
    CalendarMonth calendar,
    WidgetRef ref,
    BuildContext context,
  ) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          // Weekday headers (Google Calendar style)
          _buildGoogleWeekDays(),

          // Calendar grid - takes remaining space
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Calculate cell height dynamically based on available space
                // 6 rows (5 weeks + 1 buffer)
                final cellHeight = constraints.maxHeight / 6;

                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    mainAxisExtent: cellHeight,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                  ),
                  itemCount: calendar.days.length,
                  itemBuilder: (context, index) {
                    final day = calendar.days[index];
                    return _buildGoogleDayCell(day, ref, context, cellHeight);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoogleWeekDays() {
    final weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: Row(
        children: weekDays.map((day) {
          return Expanded(
            child: Center(
              child: Text(
                day,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildGoogleDayCell(
    CalendarDay day,
    WidgetRef ref,
    BuildContext context,
    double cellHeight,
  ) {
    final isToday = day.isToday;
    final isSelected = day.isSelected;
    final isCurrentMonth = day.isCurrentMonth;
    final hasSchedules = day.schedules.isNotEmpty;

    return GestureDetector(
      onTap: () {
        ref.read(calendarNotifierProvider.notifier).selectDate(day.date);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DayScheduleScreen(date: day.date),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.blue.withOpacity(0.1)
              : isToday
                  ? Colors.blue.withOpacity(0.05)
                  : Colors.white,
          border: Border.all(
            color: Colors.grey.shade200,
            width: 0.5,
          ),
        ),
        child: Stack(
          children: [
            // Day number
            Positioned(
              top: 6,
              right: 6,
              child: Container(
                width: 28,
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isToday ? Colors.blue : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  day.date.day.toString(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: isToday
                        ? Colors.white
                        : isCurrentMonth
                            ? Colors.black
                            : Colors.grey.shade400,
                  ),
                ),
              ),
            ),

            // Event indicators - only show if cell is tall enough
            if (hasSchedules && cellHeight > 50)
              Positioned(
                bottom: 6,
                left: 4,
                right: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Show first event title if there's space
                    if (day.schedules.isNotEmpty && cellHeight > 60)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          _truncateEventTitle(day.schedules.first.title),
                          style: TextStyle(
                            fontSize: 10,
                            color: day.schedules.first.colorValue,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                    // Colored dots for events
                    Wrap(
                      spacing: 4,
                      children: day.schedules.take(5).map((event) {
                        return Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: event.colorValue,
                            shape: BoxShape.circle,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

            // More events indicator
            if (day.schedules.length > 5)
              Positioned(
                bottom: 4,
                right: 4,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '+${day.schedules.length - 5}',
                    style: const TextStyle(
                      fontSize: 9,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _truncateEventTitle(String title) {
    if (title.length <= 15) return title;
    return '${title.substring(0, 15)}...';
  }
}
