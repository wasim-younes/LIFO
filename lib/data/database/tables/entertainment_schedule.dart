// lib/data/database/tables/entertainment_schedule.dart
import 'package:drift/drift.dart';
import 'base_schedule.dart';

class EntertainmentSchedule extends Table {
  // FOREIGN KEY to BaseSchedule
  IntColumn get id => integer().references(BaseSchedule, #id)();

  // ENTERTAINMENT-SPECIFIC FIELDS
  TextColumn get entertainmentType =>
      text()(); // 'movie', 'concert', 'theater', 'sports', 'museum'
  TextColumn get venue => text()();
  TextColumn get performer =>
      text().nullable()(); // Band name, movie title, team names
  TextColumn get genre =>
      text().nullable()(); // 'action', 'comedy', 'rock', 'classical'
  TextColumn get seatInfo => text().nullable()();
  RealColumn get ticketPrice => real().nullable()();
  TextColumn get companions => text().nullable()(); // JSON array of people
  TextColumn get ticketReference => text().nullable()();
  TextColumn get notes => text().nullable()();
}
