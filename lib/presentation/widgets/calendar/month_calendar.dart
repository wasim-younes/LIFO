import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_organizer_app/data/models/calendar.dart';
import 'package:life_organizer_app/presentation/providers/calendar_provider.dart';

class MonthCalendar extends ConsumerWidget {
  const MonthCalendar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewingDate = ref.watch(calendarViewingDateProvider);
    final calendarAsync = ref.watch(calendarMonthProvider(viewingDate));

    return calendarAsync.when(
      data: (calendar) => _buildCalendar(calendar, ref, context),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text('Error: $error'),
      ),
    );
  }

  Widget _buildCalendar(
      CalendarMonth calendar, WidgetRef ref, BuildContext context) {
    return Column(
      children: [
        // Header
        _buildHeader(context, ref, calendar),

        // Week days
        _buildWeekDays(),

        // Calendar grid - TAKES ALL SPACE
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(4),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
            ),
            itemCount: calendar.days.length,
            itemBuilder: (context, index) {
              final day = calendar.days[index];
              return _buildDayCell(day, ref, context);
            },
          ),
        ),

        // Unscheduled events section (if any)
        if (calendar.unscheduledEvents.isNotEmpty)
          Container(
            height: 120,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              border: Border(top: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.event_busy, size: 16, color: Colors.blue),
                    const SizedBox(width: 4),
                    Text(
                      'Monthly Events (${calendar.unscheduledEvents.length})',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: calendar.unscheduledEvents.length,
                    itemBuilder: (context, index) {
                      final event = calendar.unscheduledEvents[index];
                      return Container(
                        width: 120,
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: event.colorValue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: event.colorValue.withOpacity(0.3)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event.title,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: event.colorValue,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (event.description != null)
                              Text(
                                event.description!,
                                style: const TextStyle(fontSize: 10),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildDayCell(CalendarDay day, WidgetRef ref, BuildContext context) {
    final isToday = day.isToday;
    final isSelected = day.isSelected;
    final isCurrentMonth = day.isCurrentMonth;
    final hasSchedules = day.schedules.isNotEmpty; // Now has schedules property

    return GestureDetector(
      onTap: () {
        ref.read(calendarNotifierProvider.notifier).selectDate(day.date);
        // TODO: Navigate to day schedule screen
      },
      child: Container(
        margin: const EdgeInsets.all(0.5),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.blue
              : isToday
                  ? Colors.blue.withOpacity(0.1)
                  : Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: isToday ? Colors.blue : Colors.grey.shade200,
            width: isToday ? 1.5 : 0.5,
          ),
        ),
        child: Stack(
          children: [
            // Day number
            Positioned(
              top: 4,
              left: 4,
              child: Text(
                day.date.day.toString(),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isSelected
                      ? Colors.white
                      : isCurrentMonth
                          ? Colors.black
                          : Colors.grey,
                ),
              ),
            ),

            // Event indicators
            if (hasSchedules)
              Positioned(
                top: 4,
                right: 4,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
              ),

            // Event list (for current month days)
            if (isCurrentMonth && day.schedules.isNotEmpty)
              Positioned(
                bottom: 2,
                left: 2,
                right: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: day.schedules.take(2).map((event) {
                    return Container(
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 1),
                      decoration: BoxDecoration(
                        color: event.colorValue,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    );
                  }).toList(),
                ),
              ),

            // More indicator
            if (isCurrentMonth && day.schedules.length > 2)
              Positioned(
                bottom: 2,
                right: 4,
                child: Text(
                  '+${day.schedules.length - 2}',
                  style: TextStyle(
                    fontSize: 8,
                    color: isSelected ? Colors.white : Colors.grey,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(
      BuildContext context, WidgetRef ref, CalendarMonth calendar) {
    final monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              ref
                  .read(calendarNotifierProvider.notifier)
                  .navigateToPreviousMonth();
            },
          ),
          GestureDetector(
            onTap: () => _showMonthYearPicker(context, ref),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Text(
                    '${monthNames[calendar.month - 1]} ${calendar.year}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_drop_down, size: 20),
                ],
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () {
              ref.read(calendarNotifierProvider.notifier).navigateToNextMonth();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildWeekDays() {
    final weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.2)),
      ),
      child: Row(
        children: weekDays.map((day) {
          return Expanded(
            child: Center(
              child: Text(
                day,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  void _showMonthYearPicker(BuildContext context, WidgetRef ref) {
    final currentViewingDate = ref.read(calendarViewingDateProvider);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Month and Year'),
          content: SizedBox(
            width: 300,
            height: 400,
            child: YearMonthPicker(
              initialDate: currentViewingDate,
              onDateChanged: (date) {
                ref.read(calendarNotifierProvider.notifier).setMonthYear(date);
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }
}

// Keep YearMonthPicker class...
class YearMonthPicker extends StatefulWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime> onDateChanged;

  const YearMonthPicker({
    super.key,
    required this.initialDate,
    required this.onDateChanged,
  });

  @override
  State<YearMonthPicker> createState() => _YearMonthPickerState();
}

class _YearMonthPickerState extends State<YearMonthPicker> {
  late DateTime _selectedDate;
  late int _selectedYear;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _selectedYear = widget.initialDate.year;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () {
                  setState(() {
                    _selectedYear--;
                  });
                },
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Text(
                  _selectedYear.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () {
                  setState(() {
                    _selectedYear++;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1.5,
            ),
            itemCount: 12,
            itemBuilder: (context, index) {
              final month = index + 1;
              final monthNames = [
                'Jan',
                'Feb',
                'Mar',
                'Apr',
                'May',
                'Jun',
                'Jul',
                'Aug',
                'Sep',
                'Oct',
                'Nov',
                'Dec'
              ];
              final isSelected = _selectedDate.year == _selectedYear &&
                  _selectedDate.month == month;

              return GestureDetector(
                onTap: () {
                  final newDate = DateTime(_selectedYear, month, 1);
                  setState(() {
                    _selectedDate = newDate;
                  });
                  widget.onDateChanged(newDate);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected ? Colors.blue : Colors.transparent,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      monthNames[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              widget.onDateChanged(_selectedDate);
              Navigator.pop(context);
            },
            child: const Text('Select'),
          ),
        ],
      ),
    );
  }
}
