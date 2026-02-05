import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_organizer_app/data/models/schedule.dart';
import 'package:life_organizer_app/presentation/providers/schedule_provider.dart';

class DebugSchedulesScreen extends ConsumerWidget {
  const DebugSchedulesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedules = ref.watch(realTimeSchedulesProvider);
    final isLoading = ref.watch(schedulesLoadingProvider);
    final error = ref.watch(schedulesErrorProvider);
    final scheduleCount = schedules.length;

    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (error != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(
          child: Text('Error: $error'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Schedules ($scheduleCount)'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(scheduleNotifierOperationsProvider).refresh();
            },
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: schedules.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.event_note, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No schedules found',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: schedules.length,
              itemBuilder: (context, index) {
                final schedule = schedules[index];
                return _buildScheduleCard(context, schedule, ref);
              },
            ),
    );
  }

  Widget _buildScheduleCard(
      BuildContext context, Schedule schedule, WidgetRef ref) {
    final isUnscheduled = schedule.isUnscheduled;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          width: 12,
          height: 40,
          decoration: BoxDecoration(
            color: schedule.colorValue,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        title: Text(
          schedule.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Safe Date Formatting
            if (schedule.startDate != null)
              Text('Date: ${_formatDate(schedule.startDate!)}')
            else if (isUnscheduled && schedule.unscheduledYear != null)
              Text(
                  'Unscheduled: ${schedule.unscheduledMonth ?? "All"}/${schedule.unscheduledYear}')
            else
              const Text('No date set'),

            Text('ID: ${schedule.id ?? "Pending..."}'), // Safe ID access
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            // SAFE: Check if ID exists before calling delete
            final scheduleId = schedule.id;
            if (scheduleId != null) {
              _showDeleteDialog(context, ref, scheduleId);
            } else {
              print("Debug: Cannot delete an item with no ID.");
            }
          },
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  void _showDeleteDialog(BuildContext context, WidgetRef ref, int scheduleId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Schedule'),
          content: const Text('Are you sure you want to delete this schedule?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                try {
                  await ref
                      .read(scheduleNotifierOperationsProvider)
                      .deleteSchedule(scheduleId);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Schedule deleted'),
                      backgroundColor: Colors.green,
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Failed to delete: $e'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
