import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_organizer_app/data/database/app_database.dart';
import 'package:life_organizer_app/presentation/screens/calendar_screen.dart';
import 'dart:developer' as developer;
import 'dart:ui'; // Required for PlatformDispatcher

// Database reset utility - UPDATED VERSION
Future<void> resetDatabase() async {
  print('🗑️ ========== RESETTING DATABASE ==========');
  try {
    // Use the separate function to create fresh database
    final db = await createFreshDatabase();
    await db.debugDatabaseStructure();
    await db.close();
    print('✅ Database reset complete');
  } catch (e) {
    print('❌ Error resetting database: $e');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Catch Synchronous Widget Errors
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details); // Still prints to console
    developer.log('WIDGET_ERROR',
        error: details.exception, stackTrace: details.stack);
  };

  // 2. Catch Asynchronous Errors (Riverpod, Database, etc.)
  PlatformDispatcher.instance.onError = (error, stack) {
    developer.log('ASYNC_ERROR', error: error, stackTrace: stack);
    return true; // Prevents the app from crashing visually
  };

  // 3. OPTIONAL: Reset database for development
  // Uncomment the next line if you want to reset the database on every start
  //await resetDatabase();

  print('🚀 Starting Calendar App...');

  runApp(const ProviderScope(child: CalendarApp()));
}

class CalendarApp extends StatelessWidget {
  const CalendarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar Plus',
      builder: (context, widget) {
        // 3. The Ultimate Shield: Replace the red screen with an empty box
        ErrorWidget.builder = (details) {
          developer.log('UI_CRASH_PREVENTED', error: details.exception);
          return Container(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, color: Colors.grey, size: 64),
                  SizedBox(height: 16),
                  Text(
                    'Something went wrong',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        };
        return widget!;
      },
      home: const CalendarScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
