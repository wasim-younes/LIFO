import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_organizer_app/presentation/providers/calendar_provider.dart';
import 'package:life_organizer_app/presentation/screens/debug_schedules_screen.dart';
import 'package:life_organizer_app/presentation/widgets/calendar/simple_month_calendar.dart';
import 'package:life_organizer_app/presentation/screens/add_schedule_screen.dart';

class CalendarScreen extends ConsumerWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewingDate = ref.watch(calendarViewingDateProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _getMonthYearTitle(viewingDate),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          // Add debug button (remove in production)
          IconButton(
            icon: const Icon(Icons.bug_report),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DebugSchedulesScreen(),
                ),
              );
            },
            tooltip: 'Debug View',
          ),
          // Today button
          IconButton(
            icon: const Icon(Icons.today),
            onPressed: () {
              ref.read(calendarNotifierProvider.notifier).goToToday();
            },
            tooltip: 'Go to Today',
          ),
          // Month/year picker
          IconButton(
            icon: const Icon(Icons.calendar_month),
            onPressed: () => _showMonthYearPicker(context, ref),
            tooltip: 'Select Month/Year',
          ),
        ],
      ),
      body: const SimpleMonthCalendar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddSchedule(context, ref);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  String _getMonthYearTitle(DateTime date) {
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
    return '${monthNames[date.month - 1]} ${date.year}';
  }

  void _showMonthYearPicker(BuildContext context, WidgetRef ref) {
    final currentViewingDate = ref.read(calendarViewingDateProvider);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: YearMonthPicker(
            initialDate: currentViewingDate,
            onDateChanged: (date) {
              ref.read(calendarNotifierProvider.notifier).setMonthYear(date);
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  void _navigateToAddSchedule(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.read(calendarSelectedDateProvider);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddScheduleScreen(
          initialDate: selectedDate,
        ),
        fullscreenDialog: true,
      ),
    );
  }
}

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
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Title
          const Text(
            'Select Month and Year',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),

          // Year selection
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
                  borderRadius: BorderRadius.circular(12),
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

          // Month selection
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1.2,
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
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected ? Colors.blue : Colors.transparent,
                      width: 2,
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

          const SizedBox(height: 20),

          // Action buttons
          Row(
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
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    widget.onDateChanged(_selectedDate);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Select'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
