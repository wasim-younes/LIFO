import 'package:flutter/material.dart';

class MonthScheduleScreen extends StatelessWidget {
  final DateTime month;

  const MonthScheduleScreen({super.key, required this.month});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${_getMonthName(month)} ${month.year}',
        ),
      ),
      body: const Center(
        child: Text('Month Schedule Screen - Coming Soon'),
      ),
    );
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
