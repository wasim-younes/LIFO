import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_organizer_app/data/models/calendar.dart';
import 'package:life_organizer_app/data/models/schedule.dart';
import 'package:life_organizer_app/presentation/providers/calendar_provider.dart';
import 'package:life_organizer_app/presentation/screens/day_schedule_screen.dart';

class SimpleMonthCalendar extends ConsumerStatefulWidget {
  const SimpleMonthCalendar({super.key});

  @override
  ConsumerState<SimpleMonthCalendar> createState() =>
      _SimpleMonthCalendarState();
}

class _SimpleMonthCalendarState extends ConsumerState<SimpleMonthCalendar> {
  final PageController _pageController = PageController(initialPage: 1000);
  late DateTime _currentViewingDate;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _currentViewingDate = ref.read(calendarViewingDateProvider);

    // Listen to page changes for swipe animations
    _pageController.addListener(() {
      if (!_isAnimating) return;

      final page = _pageController.page ?? 1000;
      final monthOffset = (page - 1000).round();

      if (monthOffset != 0) {
        final newDate = DateTime(_currentViewingDate.year,
            _currentViewingDate.month + monthOffset, 1);
        ref.read(calendarNotifierProvider.notifier).setMonthYear(newDate);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewingDate = ref.watch(calendarViewingDateProvider);

    // Update current viewing date when it changes from other sources (like arrows)
    if (_currentViewingDate != viewingDate) {
      _currentViewingDate = viewingDate;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Animate to the new page when month changes via arrows
        _animateToMonth(viewingDate);
      });
    }

    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.horizontal,
      onPageChanged: (index) {
        setState(() {
          _isAnimating = false;
        });

        final monthOffset = index - 1000;
        final newDate =
            DateTime(viewingDate.year, viewingDate.month + monthOffset, 1);

        // Update the provider with new date
        ref.read(calendarNotifierProvider.notifier).setMonthYear(newDate);
      },
      itemBuilder: (context, pageIndex) {
        final monthOffset = pageIndex - 1000;
        final displayDate =
            DateTime(viewingDate.year, viewingDate.month + monthOffset, 1);

        return _buildCalendarForMonth(displayDate, context);
      },
    );
  }

  Widget _buildCalendarForMonth(DateTime month, BuildContext context) {
    final calendarAsync = ref.watch(calendarMonthProvider(month));

    return calendarAsync.when(
      data: (calendar) => _buildGoogleStyleCalendar(calendar, context),
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
                    return _buildGoogleDayCell(day, cellHeight, context);
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
    double cellHeight,
    BuildContext context,
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

            // Google Calendar-style event titles (FIXED: No overflow)
            if (hasSchedules)
              Positioned(
                top: 36, // Below the day number
                left: 2,
                right: 2,
                child: _buildEventTitles(day.schedules, cellHeight),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventTitles(List<Schedule> schedules, double cellHeight) {
    // Calculate how many events can fit
    final maxVisibleEvents = _getMaxVisibleEvents(cellHeight);
    final eventsToShow = schedules.take(maxVisibleEvents).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: eventsToShow.asMap().entries.map((entry) {
        final schedule = entry.value;

        return Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: _buildEventTitleItem(schedule, cellHeight),
        );
      }).toList(),
    );
  }

  Widget _buildEventTitleItem(Schedule schedule, double cellHeight) {
    final eventHeight = _getEventHeight(cellHeight);
    final title = _truncateEventTitle(schedule.title, cellHeight);

    return Container(
      height: eventHeight,
      decoration: BoxDecoration(
        color: schedule.colorValue,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: _getFontSize(cellHeight),
            fontWeight: FontWeight.w500,
            color: _getTextColor(schedule.colorValue),
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // Helper methods for dynamic sizing
  int _getMaxVisibleEvents(double cellHeight) {
    if (cellHeight < 70) return 1;
    if (cellHeight < 90) return 2;
    if (cellHeight < 110) return 3;
    return 4;
  }

  double _getEventHeight(double cellHeight) {
    final maxEvents = _getMaxVisibleEvents(cellHeight);
    // Reserve space for day number (40px) and some padding
    final availableHeight =
        cellHeight - 40 - (maxEvents * 2); // 2px margin between events
    return (availableHeight / maxEvents).clamp(16, 24); // Fixed height range
  }

  double _getFontSize(double cellHeight) {
    final eventHeight = _getEventHeight(cellHeight);
    if (eventHeight < 18) return 10;
    if (eventHeight < 22) return 11;
    return 12;
  }

  Color _getTextColor(Color backgroundColor) {
    // Calculate brightness to decide text color
    final brightness = backgroundColor.computeLuminance();
    return brightness > 0.5 ? Colors.black : Colors.white;
  }

  String _truncateEventTitle(String title, double cellHeight) {
    final fontSize = _getFontSize(cellHeight);
    // Calculate max characters based on cell width and font size
    // Approx 8px per character at fontSize 12
    final maxChars = (120 / (fontSize * 0.66)).round();

    if (title.length <= maxChars) return title;
    return '${title.substring(0, maxChars - 1)}…';
  }

  void _animateToMonth(DateTime targetDate) {
    final currentDate = _currentViewingDate;
    final monthDiff = (targetDate.year - currentDate.year) * 12 +
        (targetDate.month - currentDate.month);

    final targetPage = 1000 + monthDiff;

    if (_pageController.hasClients) {
      setState(() {
        _isAnimating = true;
      });

      _pageController
          .animateToPage(
        targetPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      )
          .then((_) {
        setState(() {
          _isAnimating = false;
        });
      });
    }
  }
}
