import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_organizer_app/presentation/providers/calendar_provider.dart';

class CalendarViewSwitcher extends ConsumerWidget {
  const CalendarViewSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarState = ref.watch(calendarNotifierProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Month View Button
          _buildViewButton(
            context: context,
            label: 'Month',
            isActive: calendarState.view == CalendarView.month,
            onPressed: () {
              ref
                  .read(calendarNotifierProvider.notifier)
                  .setView(CalendarView.month);
            },
          ),

          const SizedBox(width: 12),

          // Year View Button
          _buildViewButton(
            context: context,
            label: 'Year',
            isActive: calendarState.view == CalendarView.year,
            onPressed: () {
              ref
                  .read(calendarNotifierProvider.notifier)
                  .setView(CalendarView.year);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildViewButton({
    required BuildContext context,
    required String label,
    required bool isActive,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive ? Colors.blue : Colors.grey.shade200,
          foregroundColor: isActive ? Colors.white : Colors.grey.shade700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
