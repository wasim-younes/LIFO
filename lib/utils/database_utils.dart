// Utility functions for database operations

import 'package:flutter/material.dart';

class DatabaseUtils {
  static String formatDateForDisplay(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  static String formatTimeForDisplay(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  static String formatDurationForDisplay(double minutes) {
    final hours = (minutes / 60).floor();
    final remainingMinutes = minutes % 60;

    if (hours > 0) {
      return '${hours}h ${remainingMinutes.toInt()}m';
    } else {
      return '${remainingMinutes.toInt()}m';
    }
  }

  static Color getColorFromString(String colorString) {
    try {
      return Color(int.parse(colorString));
    } catch (e) {
      return Colors.blue; // Default color
    }
  }

  static String parseJsonArray(List<String> items) {
    return items.join(',');
  }

  static List<String> parseStringToArray(String? data) {
    if (data == null || data.isEmpty) return [];
    return data.split(',');
  }

  static List<int> parseStringToIntArray(String? data) {
    if (data == null || data.isEmpty) return [];
    return data.split(',').map((e) => int.tryParse(e) ?? 0).toList();
  }

  static List<double> parseStringToDoubleArray(String? data) {
    if (data == null || data.isEmpty) return [];
    return data.split(',').map((e) => double.tryParse(e) ?? 0.0).toList();
  }
}
