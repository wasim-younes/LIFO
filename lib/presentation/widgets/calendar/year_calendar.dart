import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_organizer_app/presentation/providers/calendar_provider.dart';

class YearCalendar extends ConsumerWidget {
  const YearCalendar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewingDate = ref.watch(calendarViewingDateProvider);
    final yearScheduleCountsAsync = ref.watch(
      calendarYearProvider(viewingDate.year),
    );

    return yearScheduleCountsAsync.when(
      data: (monthCounts) => _buildYearCalendar(
        viewingDate.year,
        monthCounts,
        ref,
        context,
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text('Error: $error'),
      ),
    );
  }

  Widget _buildYearCalendar(
    int year,
    List<int> monthCounts,
    WidgetRef ref,
    BuildContext context,
  ) {
    final monthNames = [
      'JAN',
      'FEB',
      'MAR',
      'APR',
      'MAY',
      'JUN',
      'JUL',
      'AUG',
      'SEP',
      'OCT',
      'NOV',
      'DEC'
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Year header
          _buildYearHeader(context, ref, year),

          const SizedBox(height: 20),

          // Year grid
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.2,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                final month = index + 1;
                final scheduleCount = monthCounts[index];

                return _buildMonthTile(
                  month: month,
                  monthName: monthNames[index],
                  scheduleCount: scheduleCount,
                  year: year,
                  ref: ref,
                  context: context,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildYearHeader(BuildContext context, WidgetRef ref, int year) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            ref
                .read(calendarNotifierProvider.notifier)
                .navigateToPreviousYear();
          },
        ),
        Text(
          year.toString(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: () {
            ref.read(calendarNotifierProvider.notifier).navigateToNextYear();
          },
        ),
      ],
    );
  }

  Widget _buildMonthTile({
    required int month,
    required String monthName,
    required int scheduleCount,
    required int year,
    required WidgetRef ref,
    required BuildContext context,
  }) {
    final isCurrentMonth =
        month == DateTime.now().month && year == DateTime.now().year;

    return GestureDetector(
      onTap: () {
        final newDate = DateTime(year, month, 1);
        ref.read(calendarNotifierProvider.notifier)
          ..setMonthYear(newDate)
          ..setView(CalendarView.month);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
          border: Border.all(
            color: isCurrentMonth ? Colors.blue : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              monthName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isCurrentMonth ? Colors.blue : Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 8),
            if (scheduleCount > 0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  scheduleCount.toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
