// lib/data/database/tables/travel_schedule.dart
import 'package:drift/drift.dart';
import 'base_schedule.dart';

class TravelSchedule extends Table {
  // FOREIGN KEY to BaseSchedule
  IntColumn get id => integer().references(BaseSchedule, #id)();

  // TRAVEL-SPECIFIC FIELDS
  TextColumn get destination => text()();
  TextColumn get travelType =>
      text()(); // 'flight', 'train', 'bus', 'car', 'ship'
  TextColumn get departureLocation => text().nullable()();
  DateTimeColumn get departureTime => dateTime().nullable()();
  DateTimeColumn get arrivalTime => dateTime().nullable()();
  TextColumn get transportationNumber =>
      text().nullable()(); // Flight number, train number, etc.
  TextColumn get seatNumber => text().nullable()();
  TextColumn get bookingReference => text().nullable()();
  RealColumn get cost => real().nullable()();
  TextColumn get luggageInfo => text().nullable()();
  TextColumn get notes => text().nullable()();
}
