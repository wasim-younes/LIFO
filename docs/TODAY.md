# TODAY'S TASK - [Date]

## GOAL
Set up Drift database with Items table.

## SPECIFIC TASKS
1. Update pubspec.yaml with Drift dependencies
2. Create database connection
3. Define Items table
4. Create Item model class
5. Test database works

## FILES TO CREATE
- lib/core/database/app_database.dart
- lib/core/database/tables/items_table.dart  
- lib/core/domain/models/item.dart
- lib/features/items/data/item_repository.dart

## SUCCESS CRITERIA
- Can run `flutter pub run build_runner build` without errors
- Can create database instance
- Can insert and read a test item