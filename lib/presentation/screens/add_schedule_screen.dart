import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_organizer_app/data/models/schedule.dart';
import 'package:life_organizer_app/presentation/providers/schedule_provider.dart';

class AddScheduleScreen extends ConsumerStatefulWidget {
  final DateTime initialDate;

  const AddScheduleScreen({
    super.key,
    required this.initialDate,
  });

  @override
  ConsumerState<AddScheduleScreen> createState() => _AddScheduleScreenState();
}

class _AddScheduleScreenState extends ConsumerState<AddScheduleScreen> {
  // Common fields
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _startDate;
  TimeOfDay? _startTime;
  DateTime? _endDate;
  TimeOfDay? _endTime;
  bool _isAllDay = false;
  bool _isUnscheduled = false;
  String _selectedType = 'meeting';

  // Type-specific controllers
  final Map<String, TextEditingController> _typeControllers = {};

  @override
  void initState() {
    super.initState();
    _startDate = widget.initialDate;
    _endDate = widget.initialDate;

    // Initialize type controllers
    _initializeTypeControllers();
  }

  void _initializeTypeControllers() {
    // Initialize controllers for all types
    _typeControllers['meeting_location'] = TextEditingController();
    _typeControllers['meeting_attendees'] = TextEditingController();
    _typeControllers['workout_type'] = TextEditingController();
    _typeControllers['workout_duration'] = TextEditingController();
    _typeControllers['shopping_store'] = TextEditingController();
    _typeControllers['shopping_list'] = TextEditingController();
    _typeControllers['meal_type'] = TextEditingController();
    _typeControllers['meal_location'] = TextEditingController();
    _typeControllers['personal_provider'] = TextEditingController();
    _typeControllers['lecture_subject'] = TextEditingController();
    _typeControllers['entertainment_type'] = TextEditingController();
    _typeControllers['travel_destination'] = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Event'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveEvent,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title *',
                border: OutlineInputBorder(),
                hintText: 'Enter event title',
              ),
            ),
            const SizedBox(height: 16),

            // Schedule type
            _buildTypeSelector(),
            const SizedBox(height: 16),

            // Type-specific fields
            _buildTypeSpecificFields(),
            const SizedBox(height: 16),

            // Date & Time
            _buildDateTimeSection(),
            const SizedBox(height: 16),

            // Description
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
                hintText: 'Optional description',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24),

            // Save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveEvent,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'Save Event',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeSelector() {
    final types = [
      {
        'value': 'meeting',
        'label': 'Meeting',
        'icon': Icons.people,
        'color': Colors.blue
      },
      {
        'value': 'workout',
        'label': 'Workout',
        'icon': Icons.fitness_center,
        'color': Colors.green
      },
      {
        'value': 'shopping',
        'label': 'Shopping',
        'icon': Icons.shopping_cart,
        'color': Colors.orange
      },
      {
        'value': 'meal',
        'label': 'Meal',
        'icon': Icons.restaurant,
        'color': Colors.red
      },
      {
        'value': 'personal',
        'label': 'Personal',
        'icon': Icons.person,
        'color': Colors.purple
      },
      {
        'value': 'lecture',
        'label': 'Lecture',
        'icon': Icons.school,
        'color': Colors.teal
      },
      {
        'value': 'entertainment',
        'label': 'Entertainment',
        'icon': Icons.movie,
        'color': Colors.pink
      },
      {
        'value': 'travel',
        'label': 'Travel',
        'icon': Icons.flight,
        'color': Colors.cyan
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Event Type *',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: types.map((type) {
            final isSelected = _selectedType == type['value'];
            final iconColor =
                isSelected ? Colors.white : type['color'] as Color;

            return ChoiceChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(type['icon'] as IconData, size: 18, color: iconColor),
                  const SizedBox(width: 4),
                  Text(
                    type['label'] as String,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  setState(() {
                    _selectedType = type['value'] as String;
                  });
                }
              },
              selectedColor: type['color'] as Color,
              backgroundColor: (type['color'] as Color).withOpacity(0.1),
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected
                      ? type['color'] as Color
                      : Colors.grey.shade300,
                  width: isSelected ? 2 : 1,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildTypeSpecificFields() {
    switch (_selectedType) {
      case 'meeting':
        return _buildMeetingFields();
      case 'workout':
        return _buildWorkoutFields();
      case 'shopping':
        return _buildShoppingFields();
      case 'meal':
        return _buildMealFields();
      case 'personal':
        return _buildPersonalFields();
      case 'lecture':
        return _buildLectureFields();
      case 'entertainment':
        return _buildEntertainmentFields();
      case 'travel':
        return _buildTravelFields();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildMeetingFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Meeting Details',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _typeControllers['meeting_location'],
          decoration: const InputDecoration(
            labelText: 'Location',
            border: OutlineInputBorder(),
            hintText: 'e.g., Conference Room A',
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _typeControllers['meeting_attendees'],
          decoration: const InputDecoration(
            labelText: 'Attendees',
            border: OutlineInputBorder(),
            hintText: 'e.g., John, Sarah, Mike',
          ),
        ),
      ],
    );
  }

  Widget _buildWorkoutFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Workout Details',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _typeControllers['workout_type'],
          decoration: const InputDecoration(
            labelText: 'Workout Type',
            border: OutlineInputBorder(),
            hintText: 'e.g., Running, Gym, Yoga',
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _typeControllers['workout_duration'],
          decoration: const InputDecoration(
            labelText: 'Duration (minutes)',
            border: OutlineInputBorder(),
            hintText: 'e.g., 60',
            suffixText: 'min',
          ),
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  Widget _buildShoppingFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Shopping Details',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _typeControllers['shopping_store'],
          decoration: const InputDecoration(
            labelText: 'Store Name',
            border: OutlineInputBorder(),
            hintText: 'e.g., Walmart, Amazon',
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _typeControllers['shopping_list'],
          decoration: const InputDecoration(
            labelText: 'Shopping List',
            border: OutlineInputBorder(),
            hintText: 'e.g., Milk, Eggs, Bread',
            alignLabelWithHint: true,
          ),
          maxLines: 3,
        ),
      ],
    );
  }

  Widget _buildMealFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Meal Details',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _typeControllers['meal_type'],
          decoration: const InputDecoration(
            labelText: 'Meal Type',
            border: OutlineInputBorder(),
            hintText: 'e.g., Breakfast, Lunch, Dinner',
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _typeControllers['meal_location'],
          decoration: const InputDecoration(
            labelText: 'Location/Restaurant',
            border: OutlineInputBorder(),
            hintText: 'e.g., Home, McDonald\'s, Italian Restaurant',
          ),
        ),
      ],
    );
  }

  Widget _buildPersonalFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Personal Appointment',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _typeControllers['personal_provider'],
          decoration: const InputDecoration(
            labelText: 'Provider/Service',
            border: OutlineInputBorder(),
            hintText: 'e.g., Dr. Smith, Hair Salon, Car Service',
          ),
        ),
      ],
    );
  }

  Widget _buildLectureFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Lecture Details',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _typeControllers['lecture_subject'],
          decoration: const InputDecoration(
            labelText: 'Subject/Course',
            border: OutlineInputBorder(),
            hintText: 'e.g., Mathematics, Physics, History',
          ),
        ),
      ],
    );
  }

  Widget _buildEntertainmentFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Entertainment Details',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _typeControllers['entertainment_type'],
          decoration: const InputDecoration(
            labelText: 'Type of Entertainment',
            border: OutlineInputBorder(),
            hintText: 'e.g., Movie, Concert, Theater',
          ),
        ),
      ],
    );
  }

  Widget _buildTravelFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Travel Details',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _typeControllers['travel_destination'],
          decoration: const InputDecoration(
            labelText: 'Destination',
            border: OutlineInputBorder(),
            hintText: 'e.g., New York, London, Tokyo',
          ),
        ),
      ],
    );
  }

  Widget _buildDateTimeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Date & Time',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 12),

        // All day and unscheduled toggles
        Row(
          children: [
            Checkbox(
              value: _isAllDay,
              onChanged: (value) {
                setState(() {
                  _isAllDay = value!;
                  if (_isAllDay) {
                    _startTime = null;
                    _endTime = null;
                  }
                });
              },
            ),
            const Text('All day'),
            const SizedBox(width: 20),
            Checkbox(
              value: _isUnscheduled,
              onChanged: (value) {
                setState(() {
                  _isUnscheduled = value!;
                  if (_isUnscheduled) {
                    _isAllDay = false;
                    _startTime = null;
                    _endTime = null;
                  }
                });
              },
            ),
            const Text('Unscheduled'),
          ],
        ),

        if (!_isUnscheduled) ...[
          const SizedBox(height: 12),

          // Start date
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Start Date *'),
            subtitle: Text(
              _startDate != null
                  ? '${_startDate!.day}/${_startDate!.month}/${_startDate!.year}'
                  : 'Select date',
              style: TextStyle(
                color: _startDate != null ? Colors.black : Colors.grey,
              ),
            ),
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: _startDate ?? DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (date != null) {
                setState(() {
                  _startDate = date;
                  if (_endDate != null && _endDate!.isBefore(date)) {
                    _endDate = date;
                  }
                });
              }
            },
            tileColor: Colors.grey.shade50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),

          if (!_isAllDay) ...[
            const SizedBox(height: 8),

            // Start time
            ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text('Start Time *'),
              subtitle: Text(
                _startTime != null
                    ? '${_startTime!.hour}:${_startTime!.minute.toString().padLeft(2, '0')}'
                    : 'Select time',
                style: TextStyle(
                  color: _startTime != null ? Colors.black : Colors.grey,
                ),
              ),
              onTap: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: _startTime ?? TimeOfDay.now(),
                );
                if (time != null) {
                  setState(() {
                    _startTime = time;
                  });
                }
              },
              tileColor: Colors.grey.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),

            const SizedBox(height: 8),

            // End date
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('End Date'),
              subtitle: Text(
                _endDate != null
                    ? '${_endDate!.day}/${_endDate!.month}/${_endDate!.year}'
                    : 'Select end date (optional)',
                style: TextStyle(
                  color: _endDate != null ? Colors.black : Colors.grey,
                ),
              ),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: _endDate ?? _startDate ?? DateTime.now(),
                  firstDate: _startDate ?? DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (date != null) {
                  setState(() {
                    _endDate = date;
                  });
                }
              },
              tileColor: Colors.grey.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),

            const SizedBox(height: 8),

            // End time
            ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text('End Time'),
              subtitle: Text(
                _endTime != null
                    ? '${_endTime!.hour}:${_endTime!.minute.toString().padLeft(2, '0')}'
                    : 'Select end time (optional)',
                style: TextStyle(
                  color: _endTime != null ? Colors.black : Colors.grey,
                ),
              ),
              onTap: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: _endTime ?? TimeOfDay.now(),
                );
                if (time != null) {
                  setState(() {
                    _endTime = time;
                  });
                }
              },
              tileColor: Colors.grey.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ],
      ],
    );
  }

  void _saveEvent() async {
    // Validate required fields
    if (_titleController.text.isEmpty) {
      _showError('Title is required');
      return;
    }

    if (!_isUnscheduled && _startDate == null) {
      _showError('Start date is required for scheduled events');
      return;
    }

    if (!_isUnscheduled && !_isAllDay && _startTime == null) {
      _showError('Start time is required for timed events');
      return;
    }

    // Combine date and time if provided
    DateTime? combinedStartDate;
    DateTime? combinedEndDate;

    if (!_isUnscheduled && _startDate != null) {
      if (_isAllDay) {
        combinedStartDate =
            DateTime(_startDate!.year, _startDate!.month, _startDate!.day);
        combinedEndDate = _endDate != null
            ? DateTime(
                _endDate!.year, _endDate!.month, _endDate!.day, 23, 59, 59)
            : null;
      } else if (_startTime != null) {
        combinedStartDate = DateTime(
          _startDate!.year,
          _startDate!.month,
          _startDate!.day,
          _startTime!.hour,
          _startTime!.minute,
        );

        if (_endDate != null && _endTime != null) {
          combinedEndDate = DateTime(
            _endDate!.year,
            _endDate!.month,
            _endDate!.day,
            _endTime!.hour,
            _endTime!.minute,
          );
        } else if (_endDate != null && _endTime == null) {
          combinedEndDate = DateTime(
            _endDate!.year,
            _endDate!.month,
            _endDate!.day,
            combinedStartDate.hour,
            combinedStartDate.minute,
          ).add(const Duration(hours: 1));
        } else if (_endDate == null && _endTime != null) {
          combinedEndDate = DateTime(
            _startDate!.year,
            _startDate!.month,
            _startDate!.day,
            _endTime!.hour,
            _endTime!.minute,
          );
        } else {
          combinedEndDate = combinedStartDate.add(const Duration(hours: 1));
        }
      }
    }

    // Get color based on type
    final color = _getColorForType(_selectedType);

    // Create the schedule object
    final schedule = Schedule(
      title: _titleController.text,
      startDate: combinedStartDate,
      endDate: combinedEndDate,
      scheduleType: _selectedType,
      description: _descriptionController.text.isNotEmpty
          ? _descriptionController.text
          : null,
      color: color,
      isUnscheduled: _isUnscheduled,
      unscheduledYear: _isUnscheduled ? _startDate?.year : null,
      unscheduledMonth: _isUnscheduled ? _startDate?.month : null,
    );

    print('=== SAVING EVENT ===');
    print('Title: ${schedule.title}');
    print('Type: ${schedule.scheduleType}');
    print('Start Date: ${schedule.startDate}');
    print('End Date: ${schedule.endDate}');
    print('All Day: $_isAllDay');
    print('Unscheduled: $_isUnscheduled');
    print('Color: ${schedule.color}');
    print('Description: ${schedule.description}');
    print('===================');

    // SAVE USING SCHEDULE NOTIFIER
    try {
      // Get the notifier
      final notifier = ref.read(scheduleNotifierProvider.notifier);

      // Add the schedule
      await notifier.addSchedule(schedule);

      _showSuccess('✅ Event "${schedule.title}" saved successfully!');

      // IMPORTANT: Trigger a refresh of the providers
      // This will make the UI update immediately
      ref.invalidate(scheduleNotifierProvider);
      ref.invalidate(allSchedulesProvider);

      // If we're in a specific date context, refresh that too
      if (schedule.startDate != null) {
        ref.invalidate(schedulesForDateProvider(schedule.startDate!));
        ref.invalidate(realTimeSchedulesForDateProvider(schedule.startDate!));
      }

      // Close the screen after successful save and return true to indicate success
      if (mounted) {
        Navigator.pop(context, true);
      }
    } catch (e) {
      _showError('❌ Failed to save event: $e');
    }
  }

  String _getColorForType(String type) {
    final colors = {
      'meeting': '4280391411', // Blue
      'workout': '4283215696', // Green
      'shopping': '4294940672', // Orange
      'meal': '4294198070', // Red
      'personal': '4288423856', // Purple
      'lecture': '4278228616', // Teal
      'entertainment': '4294902015', // Pink
      'travel': '4278238426', // Cyan
    };
    return colors[type] ?? '4280391411'; // Default blue
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _showEventLocationInfo(Schedule schedule) {
    String locationInfo;

    if (schedule.isUnscheduled) {
      if (schedule.unscheduledMonth != null) {
        locationInfo = 'This event is saved as a monthly unscheduled event. '
            'It will appear in the "Monthly Events" section for ${schedule.unscheduledMonth}/${schedule.unscheduledYear}';
      } else {
        locationInfo = 'This event is saved as a yearly unscheduled event. '
            'It will appear in the "Yearly Events" section for ${schedule.unscheduledYear}';
      }
    } else if (schedule.startDate != null) {
      locationInfo =
          'This event is saved for ${schedule.startDate!.day}/${schedule.startDate!.month}/${schedule.startDate!.year}. '
          'You will see it in the calendar as a ${_getColorName(schedule.color)} dot on that day.';
    } else {
      locationInfo = 'Event saved successfully!';
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Event Saved!'),
          content: Text(locationInfo),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  String _getColorName(String colorCode) {
    final colors = {
      '4280391411': 'blue',
      '4283215696': 'green',
      '4294940672': 'orange',
      '4294198070': 'red',
      '4288423856': 'purple',
      '4278228616': 'teal',
      '4294902015': 'pink',
      '4278238426': 'cyan',
    };
    return colors[colorCode] ?? 'colored';
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();

    // Dispose all type controllers
    for (var controller in _typeControllers.values) {
      controller.dispose();
    }

    super.dispose();
  }
}
