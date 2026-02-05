// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $BaseScheduleTable extends BaseSchedule
    with TableInfo<$BaseScheduleTable, BaseScheduleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BaseScheduleTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _scheduleTypeMeta =
      const VerificationMeta('scheduleType');
  @override
  late final GeneratedColumn<String> scheduleType = GeneratedColumn<String>(
      'schedule_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('4280391411'));
  static const VerificationMeta _isUnscheduledMeta =
      const VerificationMeta('isUnscheduled');
  @override
  late final GeneratedColumn<bool> isUnscheduled = GeneratedColumn<bool>(
      'is_unscheduled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_unscheduled" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _unscheduledYearMeta =
      const VerificationMeta('unscheduledYear');
  @override
  late final GeneratedColumn<int> unscheduledYear = GeneratedColumn<int>(
      'unscheduled_year', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _unscheduledMonthMeta =
      const VerificationMeta('unscheduledMonth');
  @override
  late final GeneratedColumn<int> unscheduledMonth = GeneratedColumn<int>(
      'unscheduled_month', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        startDate,
        endDate,
        scheduleType,
        description,
        color,
        isUnscheduled,
        unscheduledYear,
        unscheduledMonth
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'base_schedule';
  @override
  VerificationContext validateIntegrity(Insertable<BaseScheduleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    if (data.containsKey('schedule_type')) {
      context.handle(
          _scheduleTypeMeta,
          scheduleType.isAcceptableOrUnknown(
              data['schedule_type']!, _scheduleTypeMeta));
    } else if (isInserting) {
      context.missing(_scheduleTypeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    }
    if (data.containsKey('is_unscheduled')) {
      context.handle(
          _isUnscheduledMeta,
          isUnscheduled.isAcceptableOrUnknown(
              data['is_unscheduled']!, _isUnscheduledMeta));
    }
    if (data.containsKey('unscheduled_year')) {
      context.handle(
          _unscheduledYearMeta,
          unscheduledYear.isAcceptableOrUnknown(
              data['unscheduled_year']!, _unscheduledYearMeta));
    }
    if (data.containsKey('unscheduled_month')) {
      context.handle(
          _unscheduledMonthMeta,
          unscheduledMonth.isAcceptableOrUnknown(
              data['unscheduled_month']!, _unscheduledMonthMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BaseScheduleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BaseScheduleData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date']),
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date']),
      scheduleType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}schedule_type'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color'])!,
      isUnscheduled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_unscheduled'])!,
      unscheduledYear: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}unscheduled_year']),
      unscheduledMonth: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}unscheduled_month']),
    );
  }

  @override
  $BaseScheduleTable createAlias(String alias) {
    return $BaseScheduleTable(attachedDatabase, alias);
  }
}

class BaseScheduleData extends DataClass
    implements Insertable<BaseScheduleData> {
  final int id;
  final String title;
  final DateTime? startDate;
  final DateTime? endDate;
  final String scheduleType;
  final String? description;
  final String color;
  final bool isUnscheduled;
  final int? unscheduledYear;
  final int? unscheduledMonth;
  const BaseScheduleData(
      {required this.id,
      required this.title,
      this.startDate,
      this.endDate,
      required this.scheduleType,
      this.description,
      required this.color,
      required this.isUnscheduled,
      this.unscheduledYear,
      this.unscheduledMonth});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    map['schedule_type'] = Variable<String>(scheduleType);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['color'] = Variable<String>(color);
    map['is_unscheduled'] = Variable<bool>(isUnscheduled);
    if (!nullToAbsent || unscheduledYear != null) {
      map['unscheduled_year'] = Variable<int>(unscheduledYear);
    }
    if (!nullToAbsent || unscheduledMonth != null) {
      map['unscheduled_month'] = Variable<int>(unscheduledMonth);
    }
    return map;
  }

  BaseScheduleCompanion toCompanion(bool nullToAbsent) {
    return BaseScheduleCompanion(
      id: Value(id),
      title: Value(title),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      scheduleType: Value(scheduleType),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      color: Value(color),
      isUnscheduled: Value(isUnscheduled),
      unscheduledYear: unscheduledYear == null && nullToAbsent
          ? const Value.absent()
          : Value(unscheduledYear),
      unscheduledMonth: unscheduledMonth == null && nullToAbsent
          ? const Value.absent()
          : Value(unscheduledMonth),
    );
  }

  factory BaseScheduleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BaseScheduleData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      scheduleType: serializer.fromJson<String>(json['scheduleType']),
      description: serializer.fromJson<String?>(json['description']),
      color: serializer.fromJson<String>(json['color']),
      isUnscheduled: serializer.fromJson<bool>(json['isUnscheduled']),
      unscheduledYear: serializer.fromJson<int?>(json['unscheduledYear']),
      unscheduledMonth: serializer.fromJson<int?>(json['unscheduledMonth']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'scheduleType': serializer.toJson<String>(scheduleType),
      'description': serializer.toJson<String?>(description),
      'color': serializer.toJson<String>(color),
      'isUnscheduled': serializer.toJson<bool>(isUnscheduled),
      'unscheduledYear': serializer.toJson<int?>(unscheduledYear),
      'unscheduledMonth': serializer.toJson<int?>(unscheduledMonth),
    };
  }

  BaseScheduleData copyWith(
          {int? id,
          String? title,
          Value<DateTime?> startDate = const Value.absent(),
          Value<DateTime?> endDate = const Value.absent(),
          String? scheduleType,
          Value<String?> description = const Value.absent(),
          String? color,
          bool? isUnscheduled,
          Value<int?> unscheduledYear = const Value.absent(),
          Value<int?> unscheduledMonth = const Value.absent()}) =>
      BaseScheduleData(
        id: id ?? this.id,
        title: title ?? this.title,
        startDate: startDate.present ? startDate.value : this.startDate,
        endDate: endDate.present ? endDate.value : this.endDate,
        scheduleType: scheduleType ?? this.scheduleType,
        description: description.present ? description.value : this.description,
        color: color ?? this.color,
        isUnscheduled: isUnscheduled ?? this.isUnscheduled,
        unscheduledYear: unscheduledYear.present
            ? unscheduledYear.value
            : this.unscheduledYear,
        unscheduledMonth: unscheduledMonth.present
            ? unscheduledMonth.value
            : this.unscheduledMonth,
      );
  BaseScheduleData copyWithCompanion(BaseScheduleCompanion data) {
    return BaseScheduleData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      scheduleType: data.scheduleType.present
          ? data.scheduleType.value
          : this.scheduleType,
      description:
          data.description.present ? data.description.value : this.description,
      color: data.color.present ? data.color.value : this.color,
      isUnscheduled: data.isUnscheduled.present
          ? data.isUnscheduled.value
          : this.isUnscheduled,
      unscheduledYear: data.unscheduledYear.present
          ? data.unscheduledYear.value
          : this.unscheduledYear,
      unscheduledMonth: data.unscheduledMonth.present
          ? data.unscheduledMonth.value
          : this.unscheduledMonth,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BaseScheduleData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('scheduleType: $scheduleType, ')
          ..write('description: $description, ')
          ..write('color: $color, ')
          ..write('isUnscheduled: $isUnscheduled, ')
          ..write('unscheduledYear: $unscheduledYear, ')
          ..write('unscheduledMonth: $unscheduledMonth')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, startDate, endDate, scheduleType,
      description, color, isUnscheduled, unscheduledYear, unscheduledMonth);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BaseScheduleData &&
          other.id == this.id &&
          other.title == this.title &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.scheduleType == this.scheduleType &&
          other.description == this.description &&
          other.color == this.color &&
          other.isUnscheduled == this.isUnscheduled &&
          other.unscheduledYear == this.unscheduledYear &&
          other.unscheduledMonth == this.unscheduledMonth);
}

class BaseScheduleCompanion extends UpdateCompanion<BaseScheduleData> {
  final Value<int> id;
  final Value<String> title;
  final Value<DateTime?> startDate;
  final Value<DateTime?> endDate;
  final Value<String> scheduleType;
  final Value<String?> description;
  final Value<String> color;
  final Value<bool> isUnscheduled;
  final Value<int?> unscheduledYear;
  final Value<int?> unscheduledMonth;
  const BaseScheduleCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.scheduleType = const Value.absent(),
    this.description = const Value.absent(),
    this.color = const Value.absent(),
    this.isUnscheduled = const Value.absent(),
    this.unscheduledYear = const Value.absent(),
    this.unscheduledMonth = const Value.absent(),
  });
  BaseScheduleCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    required String scheduleType,
    this.description = const Value.absent(),
    this.color = const Value.absent(),
    this.isUnscheduled = const Value.absent(),
    this.unscheduledYear = const Value.absent(),
    this.unscheduledMonth = const Value.absent(),
  })  : title = Value(title),
        scheduleType = Value(scheduleType);
  static Insertable<BaseScheduleData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<String>? scheduleType,
    Expression<String>? description,
    Expression<String>? color,
    Expression<bool>? isUnscheduled,
    Expression<int>? unscheduledYear,
    Expression<int>? unscheduledMonth,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (scheduleType != null) 'schedule_type': scheduleType,
      if (description != null) 'description': description,
      if (color != null) 'color': color,
      if (isUnscheduled != null) 'is_unscheduled': isUnscheduled,
      if (unscheduledYear != null) 'unscheduled_year': unscheduledYear,
      if (unscheduledMonth != null) 'unscheduled_month': unscheduledMonth,
    });
  }

  BaseScheduleCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<DateTime?>? startDate,
      Value<DateTime?>? endDate,
      Value<String>? scheduleType,
      Value<String?>? description,
      Value<String>? color,
      Value<bool>? isUnscheduled,
      Value<int?>? unscheduledYear,
      Value<int?>? unscheduledMonth}) {
    return BaseScheduleCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      scheduleType: scheduleType ?? this.scheduleType,
      description: description ?? this.description,
      color: color ?? this.color,
      isUnscheduled: isUnscheduled ?? this.isUnscheduled,
      unscheduledYear: unscheduledYear ?? this.unscheduledYear,
      unscheduledMonth: unscheduledMonth ?? this.unscheduledMonth,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (scheduleType.present) {
      map['schedule_type'] = Variable<String>(scheduleType.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (isUnscheduled.present) {
      map['is_unscheduled'] = Variable<bool>(isUnscheduled.value);
    }
    if (unscheduledYear.present) {
      map['unscheduled_year'] = Variable<int>(unscheduledYear.value);
    }
    if (unscheduledMonth.present) {
      map['unscheduled_month'] = Variable<int>(unscheduledMonth.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BaseScheduleCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('scheduleType: $scheduleType, ')
          ..write('description: $description, ')
          ..write('color: $color, ')
          ..write('isUnscheduled: $isUnscheduled, ')
          ..write('unscheduledYear: $unscheduledYear, ')
          ..write('unscheduledMonth: $unscheduledMonth')
          ..write(')'))
        .toString();
  }
}

class $EntertainmentScheduleTable extends EntertainmentSchedule
    with TableInfo<$EntertainmentScheduleTable, EntertainmentScheduleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EntertainmentScheduleTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES base_schedule (id)'));
  static const VerificationMeta _entertainmentTypeMeta =
      const VerificationMeta('entertainmentType');
  @override
  late final GeneratedColumn<String> entertainmentType =
      GeneratedColumn<String>('entertainment_type', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _venueMeta = const VerificationMeta('venue');
  @override
  late final GeneratedColumn<String> venue = GeneratedColumn<String>(
      'venue', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _performerMeta =
      const VerificationMeta('performer');
  @override
  late final GeneratedColumn<String> performer = GeneratedColumn<String>(
      'performer', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _genreMeta = const VerificationMeta('genre');
  @override
  late final GeneratedColumn<String> genre = GeneratedColumn<String>(
      'genre', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _seatInfoMeta =
      const VerificationMeta('seatInfo');
  @override
  late final GeneratedColumn<String> seatInfo = GeneratedColumn<String>(
      'seat_info', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ticketPriceMeta =
      const VerificationMeta('ticketPrice');
  @override
  late final GeneratedColumn<double> ticketPrice = GeneratedColumn<double>(
      'ticket_price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _companionsMeta =
      const VerificationMeta('companions');
  @override
  late final GeneratedColumn<String> companions = GeneratedColumn<String>(
      'companions', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ticketReferenceMeta =
      const VerificationMeta('ticketReference');
  @override
  late final GeneratedColumn<String> ticketReference = GeneratedColumn<String>(
      'ticket_reference', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        entertainmentType,
        venue,
        performer,
        genre,
        seatInfo,
        ticketPrice,
        companions,
        ticketReference,
        notes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'entertainment_schedule';
  @override
  VerificationContext validateIntegrity(
      Insertable<EntertainmentScheduleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('entertainment_type')) {
      context.handle(
          _entertainmentTypeMeta,
          entertainmentType.isAcceptableOrUnknown(
              data['entertainment_type']!, _entertainmentTypeMeta));
    } else if (isInserting) {
      context.missing(_entertainmentTypeMeta);
    }
    if (data.containsKey('venue')) {
      context.handle(
          _venueMeta, venue.isAcceptableOrUnknown(data['venue']!, _venueMeta));
    } else if (isInserting) {
      context.missing(_venueMeta);
    }
    if (data.containsKey('performer')) {
      context.handle(_performerMeta,
          performer.isAcceptableOrUnknown(data['performer']!, _performerMeta));
    }
    if (data.containsKey('genre')) {
      context.handle(
          _genreMeta, genre.isAcceptableOrUnknown(data['genre']!, _genreMeta));
    }
    if (data.containsKey('seat_info')) {
      context.handle(_seatInfoMeta,
          seatInfo.isAcceptableOrUnknown(data['seat_info']!, _seatInfoMeta));
    }
    if (data.containsKey('ticket_price')) {
      context.handle(
          _ticketPriceMeta,
          ticketPrice.isAcceptableOrUnknown(
              data['ticket_price']!, _ticketPriceMeta));
    }
    if (data.containsKey('companions')) {
      context.handle(
          _companionsMeta,
          companions.isAcceptableOrUnknown(
              data['companions']!, _companionsMeta));
    }
    if (data.containsKey('ticket_reference')) {
      context.handle(
          _ticketReferenceMeta,
          ticketReference.isAcceptableOrUnknown(
              data['ticket_reference']!, _ticketReferenceMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  EntertainmentScheduleData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EntertainmentScheduleData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      entertainmentType: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}entertainment_type'])!,
      venue: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}venue'])!,
      performer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}performer']),
      genre: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}genre']),
      seatInfo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}seat_info']),
      ticketPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}ticket_price']),
      companions: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}companions']),
      ticketReference: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}ticket_reference']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $EntertainmentScheduleTable createAlias(String alias) {
    return $EntertainmentScheduleTable(attachedDatabase, alias);
  }
}

class EntertainmentScheduleData extends DataClass
    implements Insertable<EntertainmentScheduleData> {
  final int id;
  final String entertainmentType;
  final String venue;
  final String? performer;
  final String? genre;
  final String? seatInfo;
  final double? ticketPrice;
  final String? companions;
  final String? ticketReference;
  final String? notes;
  const EntertainmentScheduleData(
      {required this.id,
      required this.entertainmentType,
      required this.venue,
      this.performer,
      this.genre,
      this.seatInfo,
      this.ticketPrice,
      this.companions,
      this.ticketReference,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entertainment_type'] = Variable<String>(entertainmentType);
    map['venue'] = Variable<String>(venue);
    if (!nullToAbsent || performer != null) {
      map['performer'] = Variable<String>(performer);
    }
    if (!nullToAbsent || genre != null) {
      map['genre'] = Variable<String>(genre);
    }
    if (!nullToAbsent || seatInfo != null) {
      map['seat_info'] = Variable<String>(seatInfo);
    }
    if (!nullToAbsent || ticketPrice != null) {
      map['ticket_price'] = Variable<double>(ticketPrice);
    }
    if (!nullToAbsent || companions != null) {
      map['companions'] = Variable<String>(companions);
    }
    if (!nullToAbsent || ticketReference != null) {
      map['ticket_reference'] = Variable<String>(ticketReference);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  EntertainmentScheduleCompanion toCompanion(bool nullToAbsent) {
    return EntertainmentScheduleCompanion(
      id: Value(id),
      entertainmentType: Value(entertainmentType),
      venue: Value(venue),
      performer: performer == null && nullToAbsent
          ? const Value.absent()
          : Value(performer),
      genre:
          genre == null && nullToAbsent ? const Value.absent() : Value(genre),
      seatInfo: seatInfo == null && nullToAbsent
          ? const Value.absent()
          : Value(seatInfo),
      ticketPrice: ticketPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(ticketPrice),
      companions: companions == null && nullToAbsent
          ? const Value.absent()
          : Value(companions),
      ticketReference: ticketReference == null && nullToAbsent
          ? const Value.absent()
          : Value(ticketReference),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory EntertainmentScheduleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EntertainmentScheduleData(
      id: serializer.fromJson<int>(json['id']),
      entertainmentType: serializer.fromJson<String>(json['entertainmentType']),
      venue: serializer.fromJson<String>(json['venue']),
      performer: serializer.fromJson<String?>(json['performer']),
      genre: serializer.fromJson<String?>(json['genre']),
      seatInfo: serializer.fromJson<String?>(json['seatInfo']),
      ticketPrice: serializer.fromJson<double?>(json['ticketPrice']),
      companions: serializer.fromJson<String?>(json['companions']),
      ticketReference: serializer.fromJson<String?>(json['ticketReference']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entertainmentType': serializer.toJson<String>(entertainmentType),
      'venue': serializer.toJson<String>(venue),
      'performer': serializer.toJson<String?>(performer),
      'genre': serializer.toJson<String?>(genre),
      'seatInfo': serializer.toJson<String?>(seatInfo),
      'ticketPrice': serializer.toJson<double?>(ticketPrice),
      'companions': serializer.toJson<String?>(companions),
      'ticketReference': serializer.toJson<String?>(ticketReference),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  EntertainmentScheduleData copyWith(
          {int? id,
          String? entertainmentType,
          String? venue,
          Value<String?> performer = const Value.absent(),
          Value<String?> genre = const Value.absent(),
          Value<String?> seatInfo = const Value.absent(),
          Value<double?> ticketPrice = const Value.absent(),
          Value<String?> companions = const Value.absent(),
          Value<String?> ticketReference = const Value.absent(),
          Value<String?> notes = const Value.absent()}) =>
      EntertainmentScheduleData(
        id: id ?? this.id,
        entertainmentType: entertainmentType ?? this.entertainmentType,
        venue: venue ?? this.venue,
        performer: performer.present ? performer.value : this.performer,
        genre: genre.present ? genre.value : this.genre,
        seatInfo: seatInfo.present ? seatInfo.value : this.seatInfo,
        ticketPrice: ticketPrice.present ? ticketPrice.value : this.ticketPrice,
        companions: companions.present ? companions.value : this.companions,
        ticketReference: ticketReference.present
            ? ticketReference.value
            : this.ticketReference,
        notes: notes.present ? notes.value : this.notes,
      );
  EntertainmentScheduleData copyWithCompanion(
      EntertainmentScheduleCompanion data) {
    return EntertainmentScheduleData(
      id: data.id.present ? data.id.value : this.id,
      entertainmentType: data.entertainmentType.present
          ? data.entertainmentType.value
          : this.entertainmentType,
      venue: data.venue.present ? data.venue.value : this.venue,
      performer: data.performer.present ? data.performer.value : this.performer,
      genre: data.genre.present ? data.genre.value : this.genre,
      seatInfo: data.seatInfo.present ? data.seatInfo.value : this.seatInfo,
      ticketPrice:
          data.ticketPrice.present ? data.ticketPrice.value : this.ticketPrice,
      companions:
          data.companions.present ? data.companions.value : this.companions,
      ticketReference: data.ticketReference.present
          ? data.ticketReference.value
          : this.ticketReference,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EntertainmentScheduleData(')
          ..write('id: $id, ')
          ..write('entertainmentType: $entertainmentType, ')
          ..write('venue: $venue, ')
          ..write('performer: $performer, ')
          ..write('genre: $genre, ')
          ..write('seatInfo: $seatInfo, ')
          ..write('ticketPrice: $ticketPrice, ')
          ..write('companions: $companions, ')
          ..write('ticketReference: $ticketReference, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, entertainmentType, venue, performer,
      genre, seatInfo, ticketPrice, companions, ticketReference, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EntertainmentScheduleData &&
          other.id == this.id &&
          other.entertainmentType == this.entertainmentType &&
          other.venue == this.venue &&
          other.performer == this.performer &&
          other.genre == this.genre &&
          other.seatInfo == this.seatInfo &&
          other.ticketPrice == this.ticketPrice &&
          other.companions == this.companions &&
          other.ticketReference == this.ticketReference &&
          other.notes == this.notes);
}

class EntertainmentScheduleCompanion
    extends UpdateCompanion<EntertainmentScheduleData> {
  final Value<int> id;
  final Value<String> entertainmentType;
  final Value<String> venue;
  final Value<String?> performer;
  final Value<String?> genre;
  final Value<String?> seatInfo;
  final Value<double?> ticketPrice;
  final Value<String?> companions;
  final Value<String?> ticketReference;
  final Value<String?> notes;
  final Value<int> rowid;
  const EntertainmentScheduleCompanion({
    this.id = const Value.absent(),
    this.entertainmentType = const Value.absent(),
    this.venue = const Value.absent(),
    this.performer = const Value.absent(),
    this.genre = const Value.absent(),
    this.seatInfo = const Value.absent(),
    this.ticketPrice = const Value.absent(),
    this.companions = const Value.absent(),
    this.ticketReference = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EntertainmentScheduleCompanion.insert({
    required int id,
    required String entertainmentType,
    required String venue,
    this.performer = const Value.absent(),
    this.genre = const Value.absent(),
    this.seatInfo = const Value.absent(),
    this.ticketPrice = const Value.absent(),
    this.companions = const Value.absent(),
    this.ticketReference = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        entertainmentType = Value(entertainmentType),
        venue = Value(venue);
  static Insertable<EntertainmentScheduleData> custom({
    Expression<int>? id,
    Expression<String>? entertainmentType,
    Expression<String>? venue,
    Expression<String>? performer,
    Expression<String>? genre,
    Expression<String>? seatInfo,
    Expression<double>? ticketPrice,
    Expression<String>? companions,
    Expression<String>? ticketReference,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entertainmentType != null) 'entertainment_type': entertainmentType,
      if (venue != null) 'venue': venue,
      if (performer != null) 'performer': performer,
      if (genre != null) 'genre': genre,
      if (seatInfo != null) 'seat_info': seatInfo,
      if (ticketPrice != null) 'ticket_price': ticketPrice,
      if (companions != null) 'companions': companions,
      if (ticketReference != null) 'ticket_reference': ticketReference,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EntertainmentScheduleCompanion copyWith(
      {Value<int>? id,
      Value<String>? entertainmentType,
      Value<String>? venue,
      Value<String?>? performer,
      Value<String?>? genre,
      Value<String?>? seatInfo,
      Value<double?>? ticketPrice,
      Value<String?>? companions,
      Value<String?>? ticketReference,
      Value<String?>? notes,
      Value<int>? rowid}) {
    return EntertainmentScheduleCompanion(
      id: id ?? this.id,
      entertainmentType: entertainmentType ?? this.entertainmentType,
      venue: venue ?? this.venue,
      performer: performer ?? this.performer,
      genre: genre ?? this.genre,
      seatInfo: seatInfo ?? this.seatInfo,
      ticketPrice: ticketPrice ?? this.ticketPrice,
      companions: companions ?? this.companions,
      ticketReference: ticketReference ?? this.ticketReference,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entertainmentType.present) {
      map['entertainment_type'] = Variable<String>(entertainmentType.value);
    }
    if (venue.present) {
      map['venue'] = Variable<String>(venue.value);
    }
    if (performer.present) {
      map['performer'] = Variable<String>(performer.value);
    }
    if (genre.present) {
      map['genre'] = Variable<String>(genre.value);
    }
    if (seatInfo.present) {
      map['seat_info'] = Variable<String>(seatInfo.value);
    }
    if (ticketPrice.present) {
      map['ticket_price'] = Variable<double>(ticketPrice.value);
    }
    if (companions.present) {
      map['companions'] = Variable<String>(companions.value);
    }
    if (ticketReference.present) {
      map['ticket_reference'] = Variable<String>(ticketReference.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EntertainmentScheduleCompanion(')
          ..write('id: $id, ')
          ..write('entertainmentType: $entertainmentType, ')
          ..write('venue: $venue, ')
          ..write('performer: $performer, ')
          ..write('genre: $genre, ')
          ..write('seatInfo: $seatInfo, ')
          ..write('ticketPrice: $ticketPrice, ')
          ..write('companions: $companions, ')
          ..write('ticketReference: $ticketReference, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LectureScheduleTable extends LectureSchedule
    with TableInfo<$LectureScheduleTable, LectureScheduleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LectureScheduleTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES base_schedule (id)'));
  static const VerificationMeta _subjectMeta =
      const VerificationMeta('subject');
  @override
  late final GeneratedColumn<String> subject = GeneratedColumn<String>(
      'subject', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _instructorMeta =
      const VerificationMeta('instructor');
  @override
  late final GeneratedColumn<String> instructor = GeneratedColumn<String>(
      'instructor', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roomNumberMeta =
      const VerificationMeta('roomNumber');
  @override
  late final GeneratedColumn<String> roomNumber = GeneratedColumn<String>(
      'room_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _buildingMeta =
      const VerificationMeta('building');
  @override
  late final GeneratedColumn<String> building = GeneratedColumn<String>(
      'building', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _courseCodeMeta =
      const VerificationMeta('courseCode');
  @override
  late final GeneratedColumn<String> courseCode = GeneratedColumn<String>(
      'course_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _materialsMeta =
      const VerificationMeta('materials');
  @override
  late final GeneratedColumn<String> materials = GeneratedColumn<String>(
      'materials', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isOnlineMeta =
      const VerificationMeta('isOnline');
  @override
  late final GeneratedColumn<bool> isOnline = GeneratedColumn<bool>(
      'is_online', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_online" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _platformMeta =
      const VerificationMeta('platform');
  @override
  late final GeneratedColumn<String> platform = GeneratedColumn<String>(
      'platform', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _linkMeta = const VerificationMeta('link');
  @override
  late final GeneratedColumn<String> link = GeneratedColumn<String>(
      'link', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _assignmentsMeta =
      const VerificationMeta('assignments');
  @override
  late final GeneratedColumn<String> assignments = GeneratedColumn<String>(
      'assignments', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _durationHoursMeta =
      const VerificationMeta('durationHours');
  @override
  late final GeneratedColumn<double> durationHours = GeneratedColumn<double>(
      'duration_hours', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        subject,
        instructor,
        roomNumber,
        building,
        courseCode,
        materials,
        isOnline,
        platform,
        link,
        notes,
        assignments,
        durationHours
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lecture_schedule';
  @override
  VerificationContext validateIntegrity(
      Insertable<LectureScheduleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('subject')) {
      context.handle(_subjectMeta,
          subject.isAcceptableOrUnknown(data['subject']!, _subjectMeta));
    } else if (isInserting) {
      context.missing(_subjectMeta);
    }
    if (data.containsKey('instructor')) {
      context.handle(
          _instructorMeta,
          instructor.isAcceptableOrUnknown(
              data['instructor']!, _instructorMeta));
    } else if (isInserting) {
      context.missing(_instructorMeta);
    }
    if (data.containsKey('room_number')) {
      context.handle(
          _roomNumberMeta,
          roomNumber.isAcceptableOrUnknown(
              data['room_number']!, _roomNumberMeta));
    }
    if (data.containsKey('building')) {
      context.handle(_buildingMeta,
          building.isAcceptableOrUnknown(data['building']!, _buildingMeta));
    }
    if (data.containsKey('course_code')) {
      context.handle(
          _courseCodeMeta,
          courseCode.isAcceptableOrUnknown(
              data['course_code']!, _courseCodeMeta));
    }
    if (data.containsKey('materials')) {
      context.handle(_materialsMeta,
          materials.isAcceptableOrUnknown(data['materials']!, _materialsMeta));
    }
    if (data.containsKey('is_online')) {
      context.handle(_isOnlineMeta,
          isOnline.isAcceptableOrUnknown(data['is_online']!, _isOnlineMeta));
    }
    if (data.containsKey('platform')) {
      context.handle(_platformMeta,
          platform.isAcceptableOrUnknown(data['platform']!, _platformMeta));
    }
    if (data.containsKey('link')) {
      context.handle(
          _linkMeta, link.isAcceptableOrUnknown(data['link']!, _linkMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('assignments')) {
      context.handle(
          _assignmentsMeta,
          assignments.isAcceptableOrUnknown(
              data['assignments']!, _assignmentsMeta));
    }
    if (data.containsKey('duration_hours')) {
      context.handle(
          _durationHoursMeta,
          durationHours.isAcceptableOrUnknown(
              data['duration_hours']!, _durationHoursMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  LectureScheduleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LectureScheduleData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      subject: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject'])!,
      instructor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}instructor'])!,
      roomNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}room_number']),
      building: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}building']),
      courseCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}course_code']),
      materials: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}materials']),
      isOnline: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_online'])!,
      platform: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}platform']),
      link: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}link']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      assignments: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}assignments']),
      durationHours: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}duration_hours']),
    );
  }

  @override
  $LectureScheduleTable createAlias(String alias) {
    return $LectureScheduleTable(attachedDatabase, alias);
  }
}

class LectureScheduleData extends DataClass
    implements Insertable<LectureScheduleData> {
  final int id;
  final String subject;
  final String instructor;
  final String? roomNumber;
  final String? building;
  final String? courseCode;
  final String? materials;
  final bool isOnline;
  final String? platform;
  final String? link;
  final String? notes;
  final String? assignments;
  final double? durationHours;
  const LectureScheduleData(
      {required this.id,
      required this.subject,
      required this.instructor,
      this.roomNumber,
      this.building,
      this.courseCode,
      this.materials,
      required this.isOnline,
      this.platform,
      this.link,
      this.notes,
      this.assignments,
      this.durationHours});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['subject'] = Variable<String>(subject);
    map['instructor'] = Variable<String>(instructor);
    if (!nullToAbsent || roomNumber != null) {
      map['room_number'] = Variable<String>(roomNumber);
    }
    if (!nullToAbsent || building != null) {
      map['building'] = Variable<String>(building);
    }
    if (!nullToAbsent || courseCode != null) {
      map['course_code'] = Variable<String>(courseCode);
    }
    if (!nullToAbsent || materials != null) {
      map['materials'] = Variable<String>(materials);
    }
    map['is_online'] = Variable<bool>(isOnline);
    if (!nullToAbsent || platform != null) {
      map['platform'] = Variable<String>(platform);
    }
    if (!nullToAbsent || link != null) {
      map['link'] = Variable<String>(link);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || assignments != null) {
      map['assignments'] = Variable<String>(assignments);
    }
    if (!nullToAbsent || durationHours != null) {
      map['duration_hours'] = Variable<double>(durationHours);
    }
    return map;
  }

  LectureScheduleCompanion toCompanion(bool nullToAbsent) {
    return LectureScheduleCompanion(
      id: Value(id),
      subject: Value(subject),
      instructor: Value(instructor),
      roomNumber: roomNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(roomNumber),
      building: building == null && nullToAbsent
          ? const Value.absent()
          : Value(building),
      courseCode: courseCode == null && nullToAbsent
          ? const Value.absent()
          : Value(courseCode),
      materials: materials == null && nullToAbsent
          ? const Value.absent()
          : Value(materials),
      isOnline: Value(isOnline),
      platform: platform == null && nullToAbsent
          ? const Value.absent()
          : Value(platform),
      link: link == null && nullToAbsent ? const Value.absent() : Value(link),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      assignments: assignments == null && nullToAbsent
          ? const Value.absent()
          : Value(assignments),
      durationHours: durationHours == null && nullToAbsent
          ? const Value.absent()
          : Value(durationHours),
    );
  }

  factory LectureScheduleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LectureScheduleData(
      id: serializer.fromJson<int>(json['id']),
      subject: serializer.fromJson<String>(json['subject']),
      instructor: serializer.fromJson<String>(json['instructor']),
      roomNumber: serializer.fromJson<String?>(json['roomNumber']),
      building: serializer.fromJson<String?>(json['building']),
      courseCode: serializer.fromJson<String?>(json['courseCode']),
      materials: serializer.fromJson<String?>(json['materials']),
      isOnline: serializer.fromJson<bool>(json['isOnline']),
      platform: serializer.fromJson<String?>(json['platform']),
      link: serializer.fromJson<String?>(json['link']),
      notes: serializer.fromJson<String?>(json['notes']),
      assignments: serializer.fromJson<String?>(json['assignments']),
      durationHours: serializer.fromJson<double?>(json['durationHours']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'subject': serializer.toJson<String>(subject),
      'instructor': serializer.toJson<String>(instructor),
      'roomNumber': serializer.toJson<String?>(roomNumber),
      'building': serializer.toJson<String?>(building),
      'courseCode': serializer.toJson<String?>(courseCode),
      'materials': serializer.toJson<String?>(materials),
      'isOnline': serializer.toJson<bool>(isOnline),
      'platform': serializer.toJson<String?>(platform),
      'link': serializer.toJson<String?>(link),
      'notes': serializer.toJson<String?>(notes),
      'assignments': serializer.toJson<String?>(assignments),
      'durationHours': serializer.toJson<double?>(durationHours),
    };
  }

  LectureScheduleData copyWith(
          {int? id,
          String? subject,
          String? instructor,
          Value<String?> roomNumber = const Value.absent(),
          Value<String?> building = const Value.absent(),
          Value<String?> courseCode = const Value.absent(),
          Value<String?> materials = const Value.absent(),
          bool? isOnline,
          Value<String?> platform = const Value.absent(),
          Value<String?> link = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          Value<String?> assignments = const Value.absent(),
          Value<double?> durationHours = const Value.absent()}) =>
      LectureScheduleData(
        id: id ?? this.id,
        subject: subject ?? this.subject,
        instructor: instructor ?? this.instructor,
        roomNumber: roomNumber.present ? roomNumber.value : this.roomNumber,
        building: building.present ? building.value : this.building,
        courseCode: courseCode.present ? courseCode.value : this.courseCode,
        materials: materials.present ? materials.value : this.materials,
        isOnline: isOnline ?? this.isOnline,
        platform: platform.present ? platform.value : this.platform,
        link: link.present ? link.value : this.link,
        notes: notes.present ? notes.value : this.notes,
        assignments: assignments.present ? assignments.value : this.assignments,
        durationHours:
            durationHours.present ? durationHours.value : this.durationHours,
      );
  LectureScheduleData copyWithCompanion(LectureScheduleCompanion data) {
    return LectureScheduleData(
      id: data.id.present ? data.id.value : this.id,
      subject: data.subject.present ? data.subject.value : this.subject,
      instructor:
          data.instructor.present ? data.instructor.value : this.instructor,
      roomNumber:
          data.roomNumber.present ? data.roomNumber.value : this.roomNumber,
      building: data.building.present ? data.building.value : this.building,
      courseCode:
          data.courseCode.present ? data.courseCode.value : this.courseCode,
      materials: data.materials.present ? data.materials.value : this.materials,
      isOnline: data.isOnline.present ? data.isOnline.value : this.isOnline,
      platform: data.platform.present ? data.platform.value : this.platform,
      link: data.link.present ? data.link.value : this.link,
      notes: data.notes.present ? data.notes.value : this.notes,
      assignments:
          data.assignments.present ? data.assignments.value : this.assignments,
      durationHours: data.durationHours.present
          ? data.durationHours.value
          : this.durationHours,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LectureScheduleData(')
          ..write('id: $id, ')
          ..write('subject: $subject, ')
          ..write('instructor: $instructor, ')
          ..write('roomNumber: $roomNumber, ')
          ..write('building: $building, ')
          ..write('courseCode: $courseCode, ')
          ..write('materials: $materials, ')
          ..write('isOnline: $isOnline, ')
          ..write('platform: $platform, ')
          ..write('link: $link, ')
          ..write('notes: $notes, ')
          ..write('assignments: $assignments, ')
          ..write('durationHours: $durationHours')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      subject,
      instructor,
      roomNumber,
      building,
      courseCode,
      materials,
      isOnline,
      platform,
      link,
      notes,
      assignments,
      durationHours);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LectureScheduleData &&
          other.id == this.id &&
          other.subject == this.subject &&
          other.instructor == this.instructor &&
          other.roomNumber == this.roomNumber &&
          other.building == this.building &&
          other.courseCode == this.courseCode &&
          other.materials == this.materials &&
          other.isOnline == this.isOnline &&
          other.platform == this.platform &&
          other.link == this.link &&
          other.notes == this.notes &&
          other.assignments == this.assignments &&
          other.durationHours == this.durationHours);
}

class LectureScheduleCompanion extends UpdateCompanion<LectureScheduleData> {
  final Value<int> id;
  final Value<String> subject;
  final Value<String> instructor;
  final Value<String?> roomNumber;
  final Value<String?> building;
  final Value<String?> courseCode;
  final Value<String?> materials;
  final Value<bool> isOnline;
  final Value<String?> platform;
  final Value<String?> link;
  final Value<String?> notes;
  final Value<String?> assignments;
  final Value<double?> durationHours;
  final Value<int> rowid;
  const LectureScheduleCompanion({
    this.id = const Value.absent(),
    this.subject = const Value.absent(),
    this.instructor = const Value.absent(),
    this.roomNumber = const Value.absent(),
    this.building = const Value.absent(),
    this.courseCode = const Value.absent(),
    this.materials = const Value.absent(),
    this.isOnline = const Value.absent(),
    this.platform = const Value.absent(),
    this.link = const Value.absent(),
    this.notes = const Value.absent(),
    this.assignments = const Value.absent(),
    this.durationHours = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LectureScheduleCompanion.insert({
    required int id,
    required String subject,
    required String instructor,
    this.roomNumber = const Value.absent(),
    this.building = const Value.absent(),
    this.courseCode = const Value.absent(),
    this.materials = const Value.absent(),
    this.isOnline = const Value.absent(),
    this.platform = const Value.absent(),
    this.link = const Value.absent(),
    this.notes = const Value.absent(),
    this.assignments = const Value.absent(),
    this.durationHours = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        subject = Value(subject),
        instructor = Value(instructor);
  static Insertable<LectureScheduleData> custom({
    Expression<int>? id,
    Expression<String>? subject,
    Expression<String>? instructor,
    Expression<String>? roomNumber,
    Expression<String>? building,
    Expression<String>? courseCode,
    Expression<String>? materials,
    Expression<bool>? isOnline,
    Expression<String>? platform,
    Expression<String>? link,
    Expression<String>? notes,
    Expression<String>? assignments,
    Expression<double>? durationHours,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subject != null) 'subject': subject,
      if (instructor != null) 'instructor': instructor,
      if (roomNumber != null) 'room_number': roomNumber,
      if (building != null) 'building': building,
      if (courseCode != null) 'course_code': courseCode,
      if (materials != null) 'materials': materials,
      if (isOnline != null) 'is_online': isOnline,
      if (platform != null) 'platform': platform,
      if (link != null) 'link': link,
      if (notes != null) 'notes': notes,
      if (assignments != null) 'assignments': assignments,
      if (durationHours != null) 'duration_hours': durationHours,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LectureScheduleCompanion copyWith(
      {Value<int>? id,
      Value<String>? subject,
      Value<String>? instructor,
      Value<String?>? roomNumber,
      Value<String?>? building,
      Value<String?>? courseCode,
      Value<String?>? materials,
      Value<bool>? isOnline,
      Value<String?>? platform,
      Value<String?>? link,
      Value<String?>? notes,
      Value<String?>? assignments,
      Value<double?>? durationHours,
      Value<int>? rowid}) {
    return LectureScheduleCompanion(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      instructor: instructor ?? this.instructor,
      roomNumber: roomNumber ?? this.roomNumber,
      building: building ?? this.building,
      courseCode: courseCode ?? this.courseCode,
      materials: materials ?? this.materials,
      isOnline: isOnline ?? this.isOnline,
      platform: platform ?? this.platform,
      link: link ?? this.link,
      notes: notes ?? this.notes,
      assignments: assignments ?? this.assignments,
      durationHours: durationHours ?? this.durationHours,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
    }
    if (instructor.present) {
      map['instructor'] = Variable<String>(instructor.value);
    }
    if (roomNumber.present) {
      map['room_number'] = Variable<String>(roomNumber.value);
    }
    if (building.present) {
      map['building'] = Variable<String>(building.value);
    }
    if (courseCode.present) {
      map['course_code'] = Variable<String>(courseCode.value);
    }
    if (materials.present) {
      map['materials'] = Variable<String>(materials.value);
    }
    if (isOnline.present) {
      map['is_online'] = Variable<bool>(isOnline.value);
    }
    if (platform.present) {
      map['platform'] = Variable<String>(platform.value);
    }
    if (link.present) {
      map['link'] = Variable<String>(link.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (assignments.present) {
      map['assignments'] = Variable<String>(assignments.value);
    }
    if (durationHours.present) {
      map['duration_hours'] = Variable<double>(durationHours.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LectureScheduleCompanion(')
          ..write('id: $id, ')
          ..write('subject: $subject, ')
          ..write('instructor: $instructor, ')
          ..write('roomNumber: $roomNumber, ')
          ..write('building: $building, ')
          ..write('courseCode: $courseCode, ')
          ..write('materials: $materials, ')
          ..write('isOnline: $isOnline, ')
          ..write('platform: $platform, ')
          ..write('link: $link, ')
          ..write('notes: $notes, ')
          ..write('assignments: $assignments, ')
          ..write('durationHours: $durationHours, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MealScheduleTable extends MealSchedule
    with TableInfo<$MealScheduleTable, MealScheduleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealScheduleTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES base_schedule (id)'));
  static const VerificationMeta _mealTypeMeta =
      const VerificationMeta('mealType');
  @override
  late final GeneratedColumn<String> mealType = GeneratedColumn<String>(
      'meal_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cuisineMeta =
      const VerificationMeta('cuisine');
  @override
  late final GeneratedColumn<String> cuisine = GeneratedColumn<String>(
      'cuisine', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _restaurantNameMeta =
      const VerificationMeta('restaurantName');
  @override
  late final GeneratedColumn<String> restaurantName = GeneratedColumn<String>(
      'restaurant_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dietTypeMeta =
      const VerificationMeta('dietType');
  @override
  late final GeneratedColumn<String> dietType = GeneratedColumn<String>(
      'diet_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _menuItemsMeta =
      const VerificationMeta('menuItems');
  @override
  late final GeneratedColumn<String> menuItems = GeneratedColumn<String>(
      'menu_items', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _numberOfPeopleMeta =
      const VerificationMeta('numberOfPeople');
  @override
  late final GeneratedColumn<int> numberOfPeople = GeneratedColumn<int>(
      'number_of_people', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _estimatedCostMeta =
      const VerificationMeta('estimatedCost');
  @override
  late final GeneratedColumn<double> estimatedCost = GeneratedColumn<double>(
      'estimated_cost', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _isDeliveryMeta =
      const VerificationMeta('isDelivery');
  @override
  late final GeneratedColumn<bool> isDelivery = GeneratedColumn<bool>(
      'is_delivery', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_delivery" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _specialRequestsMeta =
      const VerificationMeta('specialRequests');
  @override
  late final GeneratedColumn<String> specialRequests = GeneratedColumn<String>(
      'special_requests', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        mealType,
        cuisine,
        location,
        restaurantName,
        dietType,
        menuItems,
        numberOfPeople,
        estimatedCost,
        isDelivery,
        specialRequests,
        notes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meal_schedule';
  @override
  VerificationContext validateIntegrity(Insertable<MealScheduleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('meal_type')) {
      context.handle(_mealTypeMeta,
          mealType.isAcceptableOrUnknown(data['meal_type']!, _mealTypeMeta));
    } else if (isInserting) {
      context.missing(_mealTypeMeta);
    }
    if (data.containsKey('cuisine')) {
      context.handle(_cuisineMeta,
          cuisine.isAcceptableOrUnknown(data['cuisine']!, _cuisineMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('restaurant_name')) {
      context.handle(
          _restaurantNameMeta,
          restaurantName.isAcceptableOrUnknown(
              data['restaurant_name']!, _restaurantNameMeta));
    }
    if (data.containsKey('diet_type')) {
      context.handle(_dietTypeMeta,
          dietType.isAcceptableOrUnknown(data['diet_type']!, _dietTypeMeta));
    }
    if (data.containsKey('menu_items')) {
      context.handle(_menuItemsMeta,
          menuItems.isAcceptableOrUnknown(data['menu_items']!, _menuItemsMeta));
    }
    if (data.containsKey('number_of_people')) {
      context.handle(
          _numberOfPeopleMeta,
          numberOfPeople.isAcceptableOrUnknown(
              data['number_of_people']!, _numberOfPeopleMeta));
    }
    if (data.containsKey('estimated_cost')) {
      context.handle(
          _estimatedCostMeta,
          estimatedCost.isAcceptableOrUnknown(
              data['estimated_cost']!, _estimatedCostMeta));
    }
    if (data.containsKey('is_delivery')) {
      context.handle(
          _isDeliveryMeta,
          isDelivery.isAcceptableOrUnknown(
              data['is_delivery']!, _isDeliveryMeta));
    }
    if (data.containsKey('special_requests')) {
      context.handle(
          _specialRequestsMeta,
          specialRequests.isAcceptableOrUnknown(
              data['special_requests']!, _specialRequestsMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  MealScheduleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MealScheduleData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      mealType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meal_type'])!,
      cuisine: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cuisine']),
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location']),
      restaurantName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}restaurant_name']),
      dietType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}diet_type']),
      menuItems: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}menu_items']),
      numberOfPeople: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}number_of_people'])!,
      estimatedCost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}estimated_cost']),
      isDelivery: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_delivery'])!,
      specialRequests: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}special_requests']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $MealScheduleTable createAlias(String alias) {
    return $MealScheduleTable(attachedDatabase, alias);
  }
}

class MealScheduleData extends DataClass
    implements Insertable<MealScheduleData> {
  final int id;
  final String mealType;
  final String? cuisine;
  final String? location;
  final String? restaurantName;
  final String? dietType;
  final String? menuItems;
  final int numberOfPeople;
  final double? estimatedCost;
  final bool isDelivery;
  final String? specialRequests;
  final String? notes;
  const MealScheduleData(
      {required this.id,
      required this.mealType,
      this.cuisine,
      this.location,
      this.restaurantName,
      this.dietType,
      this.menuItems,
      required this.numberOfPeople,
      this.estimatedCost,
      required this.isDelivery,
      this.specialRequests,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['meal_type'] = Variable<String>(mealType);
    if (!nullToAbsent || cuisine != null) {
      map['cuisine'] = Variable<String>(cuisine);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || restaurantName != null) {
      map['restaurant_name'] = Variable<String>(restaurantName);
    }
    if (!nullToAbsent || dietType != null) {
      map['diet_type'] = Variable<String>(dietType);
    }
    if (!nullToAbsent || menuItems != null) {
      map['menu_items'] = Variable<String>(menuItems);
    }
    map['number_of_people'] = Variable<int>(numberOfPeople);
    if (!nullToAbsent || estimatedCost != null) {
      map['estimated_cost'] = Variable<double>(estimatedCost);
    }
    map['is_delivery'] = Variable<bool>(isDelivery);
    if (!nullToAbsent || specialRequests != null) {
      map['special_requests'] = Variable<String>(specialRequests);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  MealScheduleCompanion toCompanion(bool nullToAbsent) {
    return MealScheduleCompanion(
      id: Value(id),
      mealType: Value(mealType),
      cuisine: cuisine == null && nullToAbsent
          ? const Value.absent()
          : Value(cuisine),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      restaurantName: restaurantName == null && nullToAbsent
          ? const Value.absent()
          : Value(restaurantName),
      dietType: dietType == null && nullToAbsent
          ? const Value.absent()
          : Value(dietType),
      menuItems: menuItems == null && nullToAbsent
          ? const Value.absent()
          : Value(menuItems),
      numberOfPeople: Value(numberOfPeople),
      estimatedCost: estimatedCost == null && nullToAbsent
          ? const Value.absent()
          : Value(estimatedCost),
      isDelivery: Value(isDelivery),
      specialRequests: specialRequests == null && nullToAbsent
          ? const Value.absent()
          : Value(specialRequests),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory MealScheduleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MealScheduleData(
      id: serializer.fromJson<int>(json['id']),
      mealType: serializer.fromJson<String>(json['mealType']),
      cuisine: serializer.fromJson<String?>(json['cuisine']),
      location: serializer.fromJson<String?>(json['location']),
      restaurantName: serializer.fromJson<String?>(json['restaurantName']),
      dietType: serializer.fromJson<String?>(json['dietType']),
      menuItems: serializer.fromJson<String?>(json['menuItems']),
      numberOfPeople: serializer.fromJson<int>(json['numberOfPeople']),
      estimatedCost: serializer.fromJson<double?>(json['estimatedCost']),
      isDelivery: serializer.fromJson<bool>(json['isDelivery']),
      specialRequests: serializer.fromJson<String?>(json['specialRequests']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'mealType': serializer.toJson<String>(mealType),
      'cuisine': serializer.toJson<String?>(cuisine),
      'location': serializer.toJson<String?>(location),
      'restaurantName': serializer.toJson<String?>(restaurantName),
      'dietType': serializer.toJson<String?>(dietType),
      'menuItems': serializer.toJson<String?>(menuItems),
      'numberOfPeople': serializer.toJson<int>(numberOfPeople),
      'estimatedCost': serializer.toJson<double?>(estimatedCost),
      'isDelivery': serializer.toJson<bool>(isDelivery),
      'specialRequests': serializer.toJson<String?>(specialRequests),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  MealScheduleData copyWith(
          {int? id,
          String? mealType,
          Value<String?> cuisine = const Value.absent(),
          Value<String?> location = const Value.absent(),
          Value<String?> restaurantName = const Value.absent(),
          Value<String?> dietType = const Value.absent(),
          Value<String?> menuItems = const Value.absent(),
          int? numberOfPeople,
          Value<double?> estimatedCost = const Value.absent(),
          bool? isDelivery,
          Value<String?> specialRequests = const Value.absent(),
          Value<String?> notes = const Value.absent()}) =>
      MealScheduleData(
        id: id ?? this.id,
        mealType: mealType ?? this.mealType,
        cuisine: cuisine.present ? cuisine.value : this.cuisine,
        location: location.present ? location.value : this.location,
        restaurantName:
            restaurantName.present ? restaurantName.value : this.restaurantName,
        dietType: dietType.present ? dietType.value : this.dietType,
        menuItems: menuItems.present ? menuItems.value : this.menuItems,
        numberOfPeople: numberOfPeople ?? this.numberOfPeople,
        estimatedCost:
            estimatedCost.present ? estimatedCost.value : this.estimatedCost,
        isDelivery: isDelivery ?? this.isDelivery,
        specialRequests: specialRequests.present
            ? specialRequests.value
            : this.specialRequests,
        notes: notes.present ? notes.value : this.notes,
      );
  MealScheduleData copyWithCompanion(MealScheduleCompanion data) {
    return MealScheduleData(
      id: data.id.present ? data.id.value : this.id,
      mealType: data.mealType.present ? data.mealType.value : this.mealType,
      cuisine: data.cuisine.present ? data.cuisine.value : this.cuisine,
      location: data.location.present ? data.location.value : this.location,
      restaurantName: data.restaurantName.present
          ? data.restaurantName.value
          : this.restaurantName,
      dietType: data.dietType.present ? data.dietType.value : this.dietType,
      menuItems: data.menuItems.present ? data.menuItems.value : this.menuItems,
      numberOfPeople: data.numberOfPeople.present
          ? data.numberOfPeople.value
          : this.numberOfPeople,
      estimatedCost: data.estimatedCost.present
          ? data.estimatedCost.value
          : this.estimatedCost,
      isDelivery:
          data.isDelivery.present ? data.isDelivery.value : this.isDelivery,
      specialRequests: data.specialRequests.present
          ? data.specialRequests.value
          : this.specialRequests,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MealScheduleData(')
          ..write('id: $id, ')
          ..write('mealType: $mealType, ')
          ..write('cuisine: $cuisine, ')
          ..write('location: $location, ')
          ..write('restaurantName: $restaurantName, ')
          ..write('dietType: $dietType, ')
          ..write('menuItems: $menuItems, ')
          ..write('numberOfPeople: $numberOfPeople, ')
          ..write('estimatedCost: $estimatedCost, ')
          ..write('isDelivery: $isDelivery, ')
          ..write('specialRequests: $specialRequests, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      mealType,
      cuisine,
      location,
      restaurantName,
      dietType,
      menuItems,
      numberOfPeople,
      estimatedCost,
      isDelivery,
      specialRequests,
      notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealScheduleData &&
          other.id == this.id &&
          other.mealType == this.mealType &&
          other.cuisine == this.cuisine &&
          other.location == this.location &&
          other.restaurantName == this.restaurantName &&
          other.dietType == this.dietType &&
          other.menuItems == this.menuItems &&
          other.numberOfPeople == this.numberOfPeople &&
          other.estimatedCost == this.estimatedCost &&
          other.isDelivery == this.isDelivery &&
          other.specialRequests == this.specialRequests &&
          other.notes == this.notes);
}

class MealScheduleCompanion extends UpdateCompanion<MealScheduleData> {
  final Value<int> id;
  final Value<String> mealType;
  final Value<String?> cuisine;
  final Value<String?> location;
  final Value<String?> restaurantName;
  final Value<String?> dietType;
  final Value<String?> menuItems;
  final Value<int> numberOfPeople;
  final Value<double?> estimatedCost;
  final Value<bool> isDelivery;
  final Value<String?> specialRequests;
  final Value<String?> notes;
  final Value<int> rowid;
  const MealScheduleCompanion({
    this.id = const Value.absent(),
    this.mealType = const Value.absent(),
    this.cuisine = const Value.absent(),
    this.location = const Value.absent(),
    this.restaurantName = const Value.absent(),
    this.dietType = const Value.absent(),
    this.menuItems = const Value.absent(),
    this.numberOfPeople = const Value.absent(),
    this.estimatedCost = const Value.absent(),
    this.isDelivery = const Value.absent(),
    this.specialRequests = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MealScheduleCompanion.insert({
    required int id,
    required String mealType,
    this.cuisine = const Value.absent(),
    this.location = const Value.absent(),
    this.restaurantName = const Value.absent(),
    this.dietType = const Value.absent(),
    this.menuItems = const Value.absent(),
    this.numberOfPeople = const Value.absent(),
    this.estimatedCost = const Value.absent(),
    this.isDelivery = const Value.absent(),
    this.specialRequests = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        mealType = Value(mealType);
  static Insertable<MealScheduleData> custom({
    Expression<int>? id,
    Expression<String>? mealType,
    Expression<String>? cuisine,
    Expression<String>? location,
    Expression<String>? restaurantName,
    Expression<String>? dietType,
    Expression<String>? menuItems,
    Expression<int>? numberOfPeople,
    Expression<double>? estimatedCost,
    Expression<bool>? isDelivery,
    Expression<String>? specialRequests,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mealType != null) 'meal_type': mealType,
      if (cuisine != null) 'cuisine': cuisine,
      if (location != null) 'location': location,
      if (restaurantName != null) 'restaurant_name': restaurantName,
      if (dietType != null) 'diet_type': dietType,
      if (menuItems != null) 'menu_items': menuItems,
      if (numberOfPeople != null) 'number_of_people': numberOfPeople,
      if (estimatedCost != null) 'estimated_cost': estimatedCost,
      if (isDelivery != null) 'is_delivery': isDelivery,
      if (specialRequests != null) 'special_requests': specialRequests,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MealScheduleCompanion copyWith(
      {Value<int>? id,
      Value<String>? mealType,
      Value<String?>? cuisine,
      Value<String?>? location,
      Value<String?>? restaurantName,
      Value<String?>? dietType,
      Value<String?>? menuItems,
      Value<int>? numberOfPeople,
      Value<double?>? estimatedCost,
      Value<bool>? isDelivery,
      Value<String?>? specialRequests,
      Value<String?>? notes,
      Value<int>? rowid}) {
    return MealScheduleCompanion(
      id: id ?? this.id,
      mealType: mealType ?? this.mealType,
      cuisine: cuisine ?? this.cuisine,
      location: location ?? this.location,
      restaurantName: restaurantName ?? this.restaurantName,
      dietType: dietType ?? this.dietType,
      menuItems: menuItems ?? this.menuItems,
      numberOfPeople: numberOfPeople ?? this.numberOfPeople,
      estimatedCost: estimatedCost ?? this.estimatedCost,
      isDelivery: isDelivery ?? this.isDelivery,
      specialRequests: specialRequests ?? this.specialRequests,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (mealType.present) {
      map['meal_type'] = Variable<String>(mealType.value);
    }
    if (cuisine.present) {
      map['cuisine'] = Variable<String>(cuisine.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (restaurantName.present) {
      map['restaurant_name'] = Variable<String>(restaurantName.value);
    }
    if (dietType.present) {
      map['diet_type'] = Variable<String>(dietType.value);
    }
    if (menuItems.present) {
      map['menu_items'] = Variable<String>(menuItems.value);
    }
    if (numberOfPeople.present) {
      map['number_of_people'] = Variable<int>(numberOfPeople.value);
    }
    if (estimatedCost.present) {
      map['estimated_cost'] = Variable<double>(estimatedCost.value);
    }
    if (isDelivery.present) {
      map['is_delivery'] = Variable<bool>(isDelivery.value);
    }
    if (specialRequests.present) {
      map['special_requests'] = Variable<String>(specialRequests.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealScheduleCompanion(')
          ..write('id: $id, ')
          ..write('mealType: $mealType, ')
          ..write('cuisine: $cuisine, ')
          ..write('location: $location, ')
          ..write('restaurantName: $restaurantName, ')
          ..write('dietType: $dietType, ')
          ..write('menuItems: $menuItems, ')
          ..write('numberOfPeople: $numberOfPeople, ')
          ..write('estimatedCost: $estimatedCost, ')
          ..write('isDelivery: $isDelivery, ')
          ..write('specialRequests: $specialRequests, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MeetingScheduleTable extends MeetingSchedule
    with TableInfo<$MeetingScheduleTable, MeetingScheduleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MeetingScheduleTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES base_schedule (id)'));
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _attendeesMeta =
      const VerificationMeta('attendees');
  @override
  late final GeneratedColumn<String> attendees = GeneratedColumn<String>(
      'attendees', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _organizerMeta =
      const VerificationMeta('organizer');
  @override
  late final GeneratedColumn<String> organizer = GeneratedColumn<String>(
      'organizer', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _agendaMeta = const VerificationMeta('agenda');
  @override
  late final GeneratedColumn<String> agenda = GeneratedColumn<String>(
      'agenda', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _meetingTypeMeta =
      const VerificationMeta('meetingType');
  @override
  late final GeneratedColumn<String> meetingType = GeneratedColumn<String>(
      'meeting_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isVirtualMeta =
      const VerificationMeta('isVirtual');
  @override
  late final GeneratedColumn<bool> isVirtual = GeneratedColumn<bool>(
      'is_virtual', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_virtual" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _platformMeta =
      const VerificationMeta('platform');
  @override
  late final GeneratedColumn<String> platform = GeneratedColumn<String>(
      'platform', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _linkMeta = const VerificationMeta('link');
  @override
  late final GeneratedColumn<String> link = GeneratedColumn<String>(
      'link', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _attachmentsMeta =
      const VerificationMeta('attachments');
  @override
  late final GeneratedColumn<String> attachments = GeneratedColumn<String>(
      'attachments', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        location,
        attendees,
        organizer,
        agenda,
        meetingType,
        isVirtual,
        platform,
        link,
        notes,
        attachments
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meeting_schedule';
  @override
  VerificationContext validateIntegrity(
      Insertable<MeetingScheduleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('attendees')) {
      context.handle(_attendeesMeta,
          attendees.isAcceptableOrUnknown(data['attendees']!, _attendeesMeta));
    } else if (isInserting) {
      context.missing(_attendeesMeta);
    }
    if (data.containsKey('organizer')) {
      context.handle(_organizerMeta,
          organizer.isAcceptableOrUnknown(data['organizer']!, _organizerMeta));
    } else if (isInserting) {
      context.missing(_organizerMeta);
    }
    if (data.containsKey('agenda')) {
      context.handle(_agendaMeta,
          agenda.isAcceptableOrUnknown(data['agenda']!, _agendaMeta));
    }
    if (data.containsKey('meeting_type')) {
      context.handle(
          _meetingTypeMeta,
          meetingType.isAcceptableOrUnknown(
              data['meeting_type']!, _meetingTypeMeta));
    } else if (isInserting) {
      context.missing(_meetingTypeMeta);
    }
    if (data.containsKey('is_virtual')) {
      context.handle(_isVirtualMeta,
          isVirtual.isAcceptableOrUnknown(data['is_virtual']!, _isVirtualMeta));
    }
    if (data.containsKey('platform')) {
      context.handle(_platformMeta,
          platform.isAcceptableOrUnknown(data['platform']!, _platformMeta));
    }
    if (data.containsKey('link')) {
      context.handle(
          _linkMeta, link.isAcceptableOrUnknown(data['link']!, _linkMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('attachments')) {
      context.handle(
          _attachmentsMeta,
          attachments.isAcceptableOrUnknown(
              data['attachments']!, _attachmentsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  MeetingScheduleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MeetingScheduleData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location'])!,
      attendees: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}attendees'])!,
      organizer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}organizer'])!,
      agenda: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}agenda']),
      meetingType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meeting_type'])!,
      isVirtual: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_virtual'])!,
      platform: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}platform']),
      link: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}link']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      attachments: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}attachments']),
    );
  }

  @override
  $MeetingScheduleTable createAlias(String alias) {
    return $MeetingScheduleTable(attachedDatabase, alias);
  }
}

class MeetingScheduleData extends DataClass
    implements Insertable<MeetingScheduleData> {
  final int id;
  final String location;
  final String attendees;
  final String organizer;
  final String? agenda;
  final String meetingType;
  final bool isVirtual;
  final String? platform;
  final String? link;
  final String? notes;
  final String? attachments;
  const MeetingScheduleData(
      {required this.id,
      required this.location,
      required this.attendees,
      required this.organizer,
      this.agenda,
      required this.meetingType,
      required this.isVirtual,
      this.platform,
      this.link,
      this.notes,
      this.attachments});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['location'] = Variable<String>(location);
    map['attendees'] = Variable<String>(attendees);
    map['organizer'] = Variable<String>(organizer);
    if (!nullToAbsent || agenda != null) {
      map['agenda'] = Variable<String>(agenda);
    }
    map['meeting_type'] = Variable<String>(meetingType);
    map['is_virtual'] = Variable<bool>(isVirtual);
    if (!nullToAbsent || platform != null) {
      map['platform'] = Variable<String>(platform);
    }
    if (!nullToAbsent || link != null) {
      map['link'] = Variable<String>(link);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || attachments != null) {
      map['attachments'] = Variable<String>(attachments);
    }
    return map;
  }

  MeetingScheduleCompanion toCompanion(bool nullToAbsent) {
    return MeetingScheduleCompanion(
      id: Value(id),
      location: Value(location),
      attendees: Value(attendees),
      organizer: Value(organizer),
      agenda:
          agenda == null && nullToAbsent ? const Value.absent() : Value(agenda),
      meetingType: Value(meetingType),
      isVirtual: Value(isVirtual),
      platform: platform == null && nullToAbsent
          ? const Value.absent()
          : Value(platform),
      link: link == null && nullToAbsent ? const Value.absent() : Value(link),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      attachments: attachments == null && nullToAbsent
          ? const Value.absent()
          : Value(attachments),
    );
  }

  factory MeetingScheduleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MeetingScheduleData(
      id: serializer.fromJson<int>(json['id']),
      location: serializer.fromJson<String>(json['location']),
      attendees: serializer.fromJson<String>(json['attendees']),
      organizer: serializer.fromJson<String>(json['organizer']),
      agenda: serializer.fromJson<String?>(json['agenda']),
      meetingType: serializer.fromJson<String>(json['meetingType']),
      isVirtual: serializer.fromJson<bool>(json['isVirtual']),
      platform: serializer.fromJson<String?>(json['platform']),
      link: serializer.fromJson<String?>(json['link']),
      notes: serializer.fromJson<String?>(json['notes']),
      attachments: serializer.fromJson<String?>(json['attachments']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'location': serializer.toJson<String>(location),
      'attendees': serializer.toJson<String>(attendees),
      'organizer': serializer.toJson<String>(organizer),
      'agenda': serializer.toJson<String?>(agenda),
      'meetingType': serializer.toJson<String>(meetingType),
      'isVirtual': serializer.toJson<bool>(isVirtual),
      'platform': serializer.toJson<String?>(platform),
      'link': serializer.toJson<String?>(link),
      'notes': serializer.toJson<String?>(notes),
      'attachments': serializer.toJson<String?>(attachments),
    };
  }

  MeetingScheduleData copyWith(
          {int? id,
          String? location,
          String? attendees,
          String? organizer,
          Value<String?> agenda = const Value.absent(),
          String? meetingType,
          bool? isVirtual,
          Value<String?> platform = const Value.absent(),
          Value<String?> link = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          Value<String?> attachments = const Value.absent()}) =>
      MeetingScheduleData(
        id: id ?? this.id,
        location: location ?? this.location,
        attendees: attendees ?? this.attendees,
        organizer: organizer ?? this.organizer,
        agenda: agenda.present ? agenda.value : this.agenda,
        meetingType: meetingType ?? this.meetingType,
        isVirtual: isVirtual ?? this.isVirtual,
        platform: platform.present ? platform.value : this.platform,
        link: link.present ? link.value : this.link,
        notes: notes.present ? notes.value : this.notes,
        attachments: attachments.present ? attachments.value : this.attachments,
      );
  MeetingScheduleData copyWithCompanion(MeetingScheduleCompanion data) {
    return MeetingScheduleData(
      id: data.id.present ? data.id.value : this.id,
      location: data.location.present ? data.location.value : this.location,
      attendees: data.attendees.present ? data.attendees.value : this.attendees,
      organizer: data.organizer.present ? data.organizer.value : this.organizer,
      agenda: data.agenda.present ? data.agenda.value : this.agenda,
      meetingType:
          data.meetingType.present ? data.meetingType.value : this.meetingType,
      isVirtual: data.isVirtual.present ? data.isVirtual.value : this.isVirtual,
      platform: data.platform.present ? data.platform.value : this.platform,
      link: data.link.present ? data.link.value : this.link,
      notes: data.notes.present ? data.notes.value : this.notes,
      attachments:
          data.attachments.present ? data.attachments.value : this.attachments,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MeetingScheduleData(')
          ..write('id: $id, ')
          ..write('location: $location, ')
          ..write('attendees: $attendees, ')
          ..write('organizer: $organizer, ')
          ..write('agenda: $agenda, ')
          ..write('meetingType: $meetingType, ')
          ..write('isVirtual: $isVirtual, ')
          ..write('platform: $platform, ')
          ..write('link: $link, ')
          ..write('notes: $notes, ')
          ..write('attachments: $attachments')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, location, attendees, organizer, agenda,
      meetingType, isVirtual, platform, link, notes, attachments);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MeetingScheduleData &&
          other.id == this.id &&
          other.location == this.location &&
          other.attendees == this.attendees &&
          other.organizer == this.organizer &&
          other.agenda == this.agenda &&
          other.meetingType == this.meetingType &&
          other.isVirtual == this.isVirtual &&
          other.platform == this.platform &&
          other.link == this.link &&
          other.notes == this.notes &&
          other.attachments == this.attachments);
}

class MeetingScheduleCompanion extends UpdateCompanion<MeetingScheduleData> {
  final Value<int> id;
  final Value<String> location;
  final Value<String> attendees;
  final Value<String> organizer;
  final Value<String?> agenda;
  final Value<String> meetingType;
  final Value<bool> isVirtual;
  final Value<String?> platform;
  final Value<String?> link;
  final Value<String?> notes;
  final Value<String?> attachments;
  final Value<int> rowid;
  const MeetingScheduleCompanion({
    this.id = const Value.absent(),
    this.location = const Value.absent(),
    this.attendees = const Value.absent(),
    this.organizer = const Value.absent(),
    this.agenda = const Value.absent(),
    this.meetingType = const Value.absent(),
    this.isVirtual = const Value.absent(),
    this.platform = const Value.absent(),
    this.link = const Value.absent(),
    this.notes = const Value.absent(),
    this.attachments = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MeetingScheduleCompanion.insert({
    required int id,
    required String location,
    required String attendees,
    required String organizer,
    this.agenda = const Value.absent(),
    required String meetingType,
    this.isVirtual = const Value.absent(),
    this.platform = const Value.absent(),
    this.link = const Value.absent(),
    this.notes = const Value.absent(),
    this.attachments = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        location = Value(location),
        attendees = Value(attendees),
        organizer = Value(organizer),
        meetingType = Value(meetingType);
  static Insertable<MeetingScheduleData> custom({
    Expression<int>? id,
    Expression<String>? location,
    Expression<String>? attendees,
    Expression<String>? organizer,
    Expression<String>? agenda,
    Expression<String>? meetingType,
    Expression<bool>? isVirtual,
    Expression<String>? platform,
    Expression<String>? link,
    Expression<String>? notes,
    Expression<String>? attachments,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (location != null) 'location': location,
      if (attendees != null) 'attendees': attendees,
      if (organizer != null) 'organizer': organizer,
      if (agenda != null) 'agenda': agenda,
      if (meetingType != null) 'meeting_type': meetingType,
      if (isVirtual != null) 'is_virtual': isVirtual,
      if (platform != null) 'platform': platform,
      if (link != null) 'link': link,
      if (notes != null) 'notes': notes,
      if (attachments != null) 'attachments': attachments,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MeetingScheduleCompanion copyWith(
      {Value<int>? id,
      Value<String>? location,
      Value<String>? attendees,
      Value<String>? organizer,
      Value<String?>? agenda,
      Value<String>? meetingType,
      Value<bool>? isVirtual,
      Value<String?>? platform,
      Value<String?>? link,
      Value<String?>? notes,
      Value<String?>? attachments,
      Value<int>? rowid}) {
    return MeetingScheduleCompanion(
      id: id ?? this.id,
      location: location ?? this.location,
      attendees: attendees ?? this.attendees,
      organizer: organizer ?? this.organizer,
      agenda: agenda ?? this.agenda,
      meetingType: meetingType ?? this.meetingType,
      isVirtual: isVirtual ?? this.isVirtual,
      platform: platform ?? this.platform,
      link: link ?? this.link,
      notes: notes ?? this.notes,
      attachments: attachments ?? this.attachments,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (attendees.present) {
      map['attendees'] = Variable<String>(attendees.value);
    }
    if (organizer.present) {
      map['organizer'] = Variable<String>(organizer.value);
    }
    if (agenda.present) {
      map['agenda'] = Variable<String>(agenda.value);
    }
    if (meetingType.present) {
      map['meeting_type'] = Variable<String>(meetingType.value);
    }
    if (isVirtual.present) {
      map['is_virtual'] = Variable<bool>(isVirtual.value);
    }
    if (platform.present) {
      map['platform'] = Variable<String>(platform.value);
    }
    if (link.present) {
      map['link'] = Variable<String>(link.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (attachments.present) {
      map['attachments'] = Variable<String>(attachments.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MeetingScheduleCompanion(')
          ..write('id: $id, ')
          ..write('location: $location, ')
          ..write('attendees: $attendees, ')
          ..write('organizer: $organizer, ')
          ..write('agenda: $agenda, ')
          ..write('meetingType: $meetingType, ')
          ..write('isVirtual: $isVirtual, ')
          ..write('platform: $platform, ')
          ..write('link: $link, ')
          ..write('notes: $notes, ')
          ..write('attachments: $attachments, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PersonalScheduleTable extends PersonalSchedule
    with TableInfo<$PersonalScheduleTable, PersonalScheduleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonalScheduleTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES base_schedule (id)'));
  static const VerificationMeta _personalTypeMeta =
      const VerificationMeta('personalType');
  @override
  late final GeneratedColumn<String> personalType = GeneratedColumn<String>(
      'personal_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _providerNameMeta =
      const VerificationMeta('providerName');
  @override
  late final GeneratedColumn<String> providerName = GeneratedColumn<String>(
      'provider_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _contactPhoneMeta =
      const VerificationMeta('contactPhone');
  @override
  late final GeneratedColumn<String> contactPhone = GeneratedColumn<String>(
      'contact_phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _confirmationNumberMeta =
      const VerificationMeta('confirmationNumber');
  @override
  late final GeneratedColumn<String> confirmationNumber =
      GeneratedColumn<String>('confirmation_number', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _estimatedCostMeta =
      const VerificationMeta('estimatedCost');
  @override
  late final GeneratedColumn<double> estimatedCost = GeneratedColumn<double>(
      'estimated_cost', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _specialInstructionsMeta =
      const VerificationMeta('specialInstructions');
  @override
  late final GeneratedColumn<String> specialInstructions =
      GeneratedColumn<String>('special_instructions', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _requiresPreparationMeta =
      const VerificationMeta('requiresPreparation');
  @override
  late final GeneratedColumn<bool> requiresPreparation = GeneratedColumn<bool>(
      'requires_preparation', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("requires_preparation" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _preparationNotesMeta =
      const VerificationMeta('preparationNotes');
  @override
  late final GeneratedColumn<String> preparationNotes = GeneratedColumn<String>(
      'preparation_notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        personalType,
        providerName,
        location,
        contactPhone,
        confirmationNumber,
        estimatedCost,
        specialInstructions,
        requiresPreparation,
        preparationNotes,
        notes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'personal_schedule';
  @override
  VerificationContext validateIntegrity(
      Insertable<PersonalScheduleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('personal_type')) {
      context.handle(
          _personalTypeMeta,
          personalType.isAcceptableOrUnknown(
              data['personal_type']!, _personalTypeMeta));
    } else if (isInserting) {
      context.missing(_personalTypeMeta);
    }
    if (data.containsKey('provider_name')) {
      context.handle(
          _providerNameMeta,
          providerName.isAcceptableOrUnknown(
              data['provider_name']!, _providerNameMeta));
    } else if (isInserting) {
      context.missing(_providerNameMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('contact_phone')) {
      context.handle(
          _contactPhoneMeta,
          contactPhone.isAcceptableOrUnknown(
              data['contact_phone']!, _contactPhoneMeta));
    }
    if (data.containsKey('confirmation_number')) {
      context.handle(
          _confirmationNumberMeta,
          confirmationNumber.isAcceptableOrUnknown(
              data['confirmation_number']!, _confirmationNumberMeta));
    }
    if (data.containsKey('estimated_cost')) {
      context.handle(
          _estimatedCostMeta,
          estimatedCost.isAcceptableOrUnknown(
              data['estimated_cost']!, _estimatedCostMeta));
    }
    if (data.containsKey('special_instructions')) {
      context.handle(
          _specialInstructionsMeta,
          specialInstructions.isAcceptableOrUnknown(
              data['special_instructions']!, _specialInstructionsMeta));
    }
    if (data.containsKey('requires_preparation')) {
      context.handle(
          _requiresPreparationMeta,
          requiresPreparation.isAcceptableOrUnknown(
              data['requires_preparation']!, _requiresPreparationMeta));
    }
    if (data.containsKey('preparation_notes')) {
      context.handle(
          _preparationNotesMeta,
          preparationNotes.isAcceptableOrUnknown(
              data['preparation_notes']!, _preparationNotesMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PersonalScheduleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PersonalScheduleData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      personalType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}personal_type'])!,
      providerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}provider_name'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location']),
      contactPhone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}contact_phone']),
      confirmationNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}confirmation_number']),
      estimatedCost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}estimated_cost']),
      specialInstructions: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}special_instructions']),
      requiresPreparation: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}requires_preparation'])!,
      preparationNotes: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}preparation_notes']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $PersonalScheduleTable createAlias(String alias) {
    return $PersonalScheduleTable(attachedDatabase, alias);
  }
}

class PersonalScheduleData extends DataClass
    implements Insertable<PersonalScheduleData> {
  final int id;
  final String personalType;
  final String providerName;
  final String? location;
  final String? contactPhone;
  final String? confirmationNumber;
  final double? estimatedCost;
  final String? specialInstructions;
  final bool requiresPreparation;
  final String? preparationNotes;
  final String? notes;
  const PersonalScheduleData(
      {required this.id,
      required this.personalType,
      required this.providerName,
      this.location,
      this.contactPhone,
      this.confirmationNumber,
      this.estimatedCost,
      this.specialInstructions,
      required this.requiresPreparation,
      this.preparationNotes,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['personal_type'] = Variable<String>(personalType);
    map['provider_name'] = Variable<String>(providerName);
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || contactPhone != null) {
      map['contact_phone'] = Variable<String>(contactPhone);
    }
    if (!nullToAbsent || confirmationNumber != null) {
      map['confirmation_number'] = Variable<String>(confirmationNumber);
    }
    if (!nullToAbsent || estimatedCost != null) {
      map['estimated_cost'] = Variable<double>(estimatedCost);
    }
    if (!nullToAbsent || specialInstructions != null) {
      map['special_instructions'] = Variable<String>(specialInstructions);
    }
    map['requires_preparation'] = Variable<bool>(requiresPreparation);
    if (!nullToAbsent || preparationNotes != null) {
      map['preparation_notes'] = Variable<String>(preparationNotes);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  PersonalScheduleCompanion toCompanion(bool nullToAbsent) {
    return PersonalScheduleCompanion(
      id: Value(id),
      personalType: Value(personalType),
      providerName: Value(providerName),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      contactPhone: contactPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(contactPhone),
      confirmationNumber: confirmationNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(confirmationNumber),
      estimatedCost: estimatedCost == null && nullToAbsent
          ? const Value.absent()
          : Value(estimatedCost),
      specialInstructions: specialInstructions == null && nullToAbsent
          ? const Value.absent()
          : Value(specialInstructions),
      requiresPreparation: Value(requiresPreparation),
      preparationNotes: preparationNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(preparationNotes),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory PersonalScheduleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PersonalScheduleData(
      id: serializer.fromJson<int>(json['id']),
      personalType: serializer.fromJson<String>(json['personalType']),
      providerName: serializer.fromJson<String>(json['providerName']),
      location: serializer.fromJson<String?>(json['location']),
      contactPhone: serializer.fromJson<String?>(json['contactPhone']),
      confirmationNumber:
          serializer.fromJson<String?>(json['confirmationNumber']),
      estimatedCost: serializer.fromJson<double?>(json['estimatedCost']),
      specialInstructions:
          serializer.fromJson<String?>(json['specialInstructions']),
      requiresPreparation:
          serializer.fromJson<bool>(json['requiresPreparation']),
      preparationNotes: serializer.fromJson<String?>(json['preparationNotes']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'personalType': serializer.toJson<String>(personalType),
      'providerName': serializer.toJson<String>(providerName),
      'location': serializer.toJson<String?>(location),
      'contactPhone': serializer.toJson<String?>(contactPhone),
      'confirmationNumber': serializer.toJson<String?>(confirmationNumber),
      'estimatedCost': serializer.toJson<double?>(estimatedCost),
      'specialInstructions': serializer.toJson<String?>(specialInstructions),
      'requiresPreparation': serializer.toJson<bool>(requiresPreparation),
      'preparationNotes': serializer.toJson<String?>(preparationNotes),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  PersonalScheduleData copyWith(
          {int? id,
          String? personalType,
          String? providerName,
          Value<String?> location = const Value.absent(),
          Value<String?> contactPhone = const Value.absent(),
          Value<String?> confirmationNumber = const Value.absent(),
          Value<double?> estimatedCost = const Value.absent(),
          Value<String?> specialInstructions = const Value.absent(),
          bool? requiresPreparation,
          Value<String?> preparationNotes = const Value.absent(),
          Value<String?> notes = const Value.absent()}) =>
      PersonalScheduleData(
        id: id ?? this.id,
        personalType: personalType ?? this.personalType,
        providerName: providerName ?? this.providerName,
        location: location.present ? location.value : this.location,
        contactPhone:
            contactPhone.present ? contactPhone.value : this.contactPhone,
        confirmationNumber: confirmationNumber.present
            ? confirmationNumber.value
            : this.confirmationNumber,
        estimatedCost:
            estimatedCost.present ? estimatedCost.value : this.estimatedCost,
        specialInstructions: specialInstructions.present
            ? specialInstructions.value
            : this.specialInstructions,
        requiresPreparation: requiresPreparation ?? this.requiresPreparation,
        preparationNotes: preparationNotes.present
            ? preparationNotes.value
            : this.preparationNotes,
        notes: notes.present ? notes.value : this.notes,
      );
  PersonalScheduleData copyWithCompanion(PersonalScheduleCompanion data) {
    return PersonalScheduleData(
      id: data.id.present ? data.id.value : this.id,
      personalType: data.personalType.present
          ? data.personalType.value
          : this.personalType,
      providerName: data.providerName.present
          ? data.providerName.value
          : this.providerName,
      location: data.location.present ? data.location.value : this.location,
      contactPhone: data.contactPhone.present
          ? data.contactPhone.value
          : this.contactPhone,
      confirmationNumber: data.confirmationNumber.present
          ? data.confirmationNumber.value
          : this.confirmationNumber,
      estimatedCost: data.estimatedCost.present
          ? data.estimatedCost.value
          : this.estimatedCost,
      specialInstructions: data.specialInstructions.present
          ? data.specialInstructions.value
          : this.specialInstructions,
      requiresPreparation: data.requiresPreparation.present
          ? data.requiresPreparation.value
          : this.requiresPreparation,
      preparationNotes: data.preparationNotes.present
          ? data.preparationNotes.value
          : this.preparationNotes,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PersonalScheduleData(')
          ..write('id: $id, ')
          ..write('personalType: $personalType, ')
          ..write('providerName: $providerName, ')
          ..write('location: $location, ')
          ..write('contactPhone: $contactPhone, ')
          ..write('confirmationNumber: $confirmationNumber, ')
          ..write('estimatedCost: $estimatedCost, ')
          ..write('specialInstructions: $specialInstructions, ')
          ..write('requiresPreparation: $requiresPreparation, ')
          ..write('preparationNotes: $preparationNotes, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      personalType,
      providerName,
      location,
      contactPhone,
      confirmationNumber,
      estimatedCost,
      specialInstructions,
      requiresPreparation,
      preparationNotes,
      notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonalScheduleData &&
          other.id == this.id &&
          other.personalType == this.personalType &&
          other.providerName == this.providerName &&
          other.location == this.location &&
          other.contactPhone == this.contactPhone &&
          other.confirmationNumber == this.confirmationNumber &&
          other.estimatedCost == this.estimatedCost &&
          other.specialInstructions == this.specialInstructions &&
          other.requiresPreparation == this.requiresPreparation &&
          other.preparationNotes == this.preparationNotes &&
          other.notes == this.notes);
}

class PersonalScheduleCompanion extends UpdateCompanion<PersonalScheduleData> {
  final Value<int> id;
  final Value<String> personalType;
  final Value<String> providerName;
  final Value<String?> location;
  final Value<String?> contactPhone;
  final Value<String?> confirmationNumber;
  final Value<double?> estimatedCost;
  final Value<String?> specialInstructions;
  final Value<bool> requiresPreparation;
  final Value<String?> preparationNotes;
  final Value<String?> notes;
  final Value<int> rowid;
  const PersonalScheduleCompanion({
    this.id = const Value.absent(),
    this.personalType = const Value.absent(),
    this.providerName = const Value.absent(),
    this.location = const Value.absent(),
    this.contactPhone = const Value.absent(),
    this.confirmationNumber = const Value.absent(),
    this.estimatedCost = const Value.absent(),
    this.specialInstructions = const Value.absent(),
    this.requiresPreparation = const Value.absent(),
    this.preparationNotes = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PersonalScheduleCompanion.insert({
    required int id,
    required String personalType,
    required String providerName,
    this.location = const Value.absent(),
    this.contactPhone = const Value.absent(),
    this.confirmationNumber = const Value.absent(),
    this.estimatedCost = const Value.absent(),
    this.specialInstructions = const Value.absent(),
    this.requiresPreparation = const Value.absent(),
    this.preparationNotes = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        personalType = Value(personalType),
        providerName = Value(providerName);
  static Insertable<PersonalScheduleData> custom({
    Expression<int>? id,
    Expression<String>? personalType,
    Expression<String>? providerName,
    Expression<String>? location,
    Expression<String>? contactPhone,
    Expression<String>? confirmationNumber,
    Expression<double>? estimatedCost,
    Expression<String>? specialInstructions,
    Expression<bool>? requiresPreparation,
    Expression<String>? preparationNotes,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (personalType != null) 'personal_type': personalType,
      if (providerName != null) 'provider_name': providerName,
      if (location != null) 'location': location,
      if (contactPhone != null) 'contact_phone': contactPhone,
      if (confirmationNumber != null) 'confirmation_number': confirmationNumber,
      if (estimatedCost != null) 'estimated_cost': estimatedCost,
      if (specialInstructions != null)
        'special_instructions': specialInstructions,
      if (requiresPreparation != null)
        'requires_preparation': requiresPreparation,
      if (preparationNotes != null) 'preparation_notes': preparationNotes,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PersonalScheduleCompanion copyWith(
      {Value<int>? id,
      Value<String>? personalType,
      Value<String>? providerName,
      Value<String?>? location,
      Value<String?>? contactPhone,
      Value<String?>? confirmationNumber,
      Value<double?>? estimatedCost,
      Value<String?>? specialInstructions,
      Value<bool>? requiresPreparation,
      Value<String?>? preparationNotes,
      Value<String?>? notes,
      Value<int>? rowid}) {
    return PersonalScheduleCompanion(
      id: id ?? this.id,
      personalType: personalType ?? this.personalType,
      providerName: providerName ?? this.providerName,
      location: location ?? this.location,
      contactPhone: contactPhone ?? this.contactPhone,
      confirmationNumber: confirmationNumber ?? this.confirmationNumber,
      estimatedCost: estimatedCost ?? this.estimatedCost,
      specialInstructions: specialInstructions ?? this.specialInstructions,
      requiresPreparation: requiresPreparation ?? this.requiresPreparation,
      preparationNotes: preparationNotes ?? this.preparationNotes,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (personalType.present) {
      map['personal_type'] = Variable<String>(personalType.value);
    }
    if (providerName.present) {
      map['provider_name'] = Variable<String>(providerName.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (contactPhone.present) {
      map['contact_phone'] = Variable<String>(contactPhone.value);
    }
    if (confirmationNumber.present) {
      map['confirmation_number'] = Variable<String>(confirmationNumber.value);
    }
    if (estimatedCost.present) {
      map['estimated_cost'] = Variable<double>(estimatedCost.value);
    }
    if (specialInstructions.present) {
      map['special_instructions'] = Variable<String>(specialInstructions.value);
    }
    if (requiresPreparation.present) {
      map['requires_preparation'] = Variable<bool>(requiresPreparation.value);
    }
    if (preparationNotes.present) {
      map['preparation_notes'] = Variable<String>(preparationNotes.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonalScheduleCompanion(')
          ..write('id: $id, ')
          ..write('personalType: $personalType, ')
          ..write('providerName: $providerName, ')
          ..write('location: $location, ')
          ..write('contactPhone: $contactPhone, ')
          ..write('confirmationNumber: $confirmationNumber, ')
          ..write('estimatedCost: $estimatedCost, ')
          ..write('specialInstructions: $specialInstructions, ')
          ..write('requiresPreparation: $requiresPreparation, ')
          ..write('preparationNotes: $preparationNotes, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ShoppingScheduleTable extends ShoppingSchedule
    with TableInfo<$ShoppingScheduleTable, ShoppingScheduleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShoppingScheduleTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES base_schedule (id)'));
  static const VerificationMeta _isOnlineMeta =
      const VerificationMeta('isOnline');
  @override
  late final GeneratedColumn<bool> isOnline = GeneratedColumn<bool>(
      'is_online', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_online" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _storeNameMeta =
      const VerificationMeta('storeName');
  @override
  late final GeneratedColumn<String> storeName = GeneratedColumn<String>(
      'store_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _storeTypeMeta =
      const VerificationMeta('storeType');
  @override
  late final GeneratedColumn<String> storeType = GeneratedColumn<String>(
      'store_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _itemIdsMeta =
      const VerificationMeta('itemIds');
  @override
  late final GeneratedColumn<String> itemIds = GeneratedColumn<String>(
      'item_ids', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _itemQuantitiesMeta =
      const VerificationMeta('itemQuantities');
  @override
  late final GeneratedColumn<String> itemQuantities = GeneratedColumn<String>(
      'item_quantities', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _itemNotesMeta =
      const VerificationMeta('itemNotes');
  @override
  late final GeneratedColumn<String> itemNotes = GeneratedColumn<String>(
      'item_notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _budgetMeta = const VerificationMeta('budget');
  @override
  late final GeneratedColumn<double> budget = GeneratedColumn<double>(
      'budget', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumn<String> priority = GeneratedColumn<String>(
      'priority', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('medium'));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        isOnline,
        storeName,
        storeType,
        location,
        itemIds,
        itemQuantities,
        itemNotes,
        budget,
        priority,
        notes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shopping_schedule';
  @override
  VerificationContext validateIntegrity(
      Insertable<ShoppingScheduleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('is_online')) {
      context.handle(_isOnlineMeta,
          isOnline.isAcceptableOrUnknown(data['is_online']!, _isOnlineMeta));
    }
    if (data.containsKey('store_name')) {
      context.handle(_storeNameMeta,
          storeName.isAcceptableOrUnknown(data['store_name']!, _storeNameMeta));
    } else if (isInserting) {
      context.missing(_storeNameMeta);
    }
    if (data.containsKey('store_type')) {
      context.handle(_storeTypeMeta,
          storeType.isAcceptableOrUnknown(data['store_type']!, _storeTypeMeta));
    } else if (isInserting) {
      context.missing(_storeTypeMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('item_ids')) {
      context.handle(_itemIdsMeta,
          itemIds.isAcceptableOrUnknown(data['item_ids']!, _itemIdsMeta));
    }
    if (data.containsKey('item_quantities')) {
      context.handle(
          _itemQuantitiesMeta,
          itemQuantities.isAcceptableOrUnknown(
              data['item_quantities']!, _itemQuantitiesMeta));
    }
    if (data.containsKey('item_notes')) {
      context.handle(_itemNotesMeta,
          itemNotes.isAcceptableOrUnknown(data['item_notes']!, _itemNotesMeta));
    }
    if (data.containsKey('budget')) {
      context.handle(_budgetMeta,
          budget.isAcceptableOrUnknown(data['budget']!, _budgetMeta));
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ShoppingScheduleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShoppingScheduleData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      isOnline: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_online'])!,
      storeName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}store_name'])!,
      storeType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}store_type'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location']),
      itemIds: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_ids']),
      itemQuantities: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_quantities']),
      itemNotes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_notes']),
      budget: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}budget']),
      priority: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}priority'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $ShoppingScheduleTable createAlias(String alias) {
    return $ShoppingScheduleTable(attachedDatabase, alias);
  }
}

class ShoppingScheduleData extends DataClass
    implements Insertable<ShoppingScheduleData> {
  final int id;
  final bool isOnline;
  final String storeName;
  final String storeType;
  final String? location;
  final String? itemIds;
  final String? itemQuantities;
  final String? itemNotes;
  final double? budget;
  final String priority;
  final String? notes;
  const ShoppingScheduleData(
      {required this.id,
      required this.isOnline,
      required this.storeName,
      required this.storeType,
      this.location,
      this.itemIds,
      this.itemQuantities,
      this.itemNotes,
      this.budget,
      required this.priority,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['is_online'] = Variable<bool>(isOnline);
    map['store_name'] = Variable<String>(storeName);
    map['store_type'] = Variable<String>(storeType);
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || itemIds != null) {
      map['item_ids'] = Variable<String>(itemIds);
    }
    if (!nullToAbsent || itemQuantities != null) {
      map['item_quantities'] = Variable<String>(itemQuantities);
    }
    if (!nullToAbsent || itemNotes != null) {
      map['item_notes'] = Variable<String>(itemNotes);
    }
    if (!nullToAbsent || budget != null) {
      map['budget'] = Variable<double>(budget);
    }
    map['priority'] = Variable<String>(priority);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  ShoppingScheduleCompanion toCompanion(bool nullToAbsent) {
    return ShoppingScheduleCompanion(
      id: Value(id),
      isOnline: Value(isOnline),
      storeName: Value(storeName),
      storeType: Value(storeType),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      itemIds: itemIds == null && nullToAbsent
          ? const Value.absent()
          : Value(itemIds),
      itemQuantities: itemQuantities == null && nullToAbsent
          ? const Value.absent()
          : Value(itemQuantities),
      itemNotes: itemNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(itemNotes),
      budget:
          budget == null && nullToAbsent ? const Value.absent() : Value(budget),
      priority: Value(priority),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory ShoppingScheduleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShoppingScheduleData(
      id: serializer.fromJson<int>(json['id']),
      isOnline: serializer.fromJson<bool>(json['isOnline']),
      storeName: serializer.fromJson<String>(json['storeName']),
      storeType: serializer.fromJson<String>(json['storeType']),
      location: serializer.fromJson<String?>(json['location']),
      itemIds: serializer.fromJson<String?>(json['itemIds']),
      itemQuantities: serializer.fromJson<String?>(json['itemQuantities']),
      itemNotes: serializer.fromJson<String?>(json['itemNotes']),
      budget: serializer.fromJson<double?>(json['budget']),
      priority: serializer.fromJson<String>(json['priority']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'isOnline': serializer.toJson<bool>(isOnline),
      'storeName': serializer.toJson<String>(storeName),
      'storeType': serializer.toJson<String>(storeType),
      'location': serializer.toJson<String?>(location),
      'itemIds': serializer.toJson<String?>(itemIds),
      'itemQuantities': serializer.toJson<String?>(itemQuantities),
      'itemNotes': serializer.toJson<String?>(itemNotes),
      'budget': serializer.toJson<double?>(budget),
      'priority': serializer.toJson<String>(priority),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  ShoppingScheduleData copyWith(
          {int? id,
          bool? isOnline,
          String? storeName,
          String? storeType,
          Value<String?> location = const Value.absent(),
          Value<String?> itemIds = const Value.absent(),
          Value<String?> itemQuantities = const Value.absent(),
          Value<String?> itemNotes = const Value.absent(),
          Value<double?> budget = const Value.absent(),
          String? priority,
          Value<String?> notes = const Value.absent()}) =>
      ShoppingScheduleData(
        id: id ?? this.id,
        isOnline: isOnline ?? this.isOnline,
        storeName: storeName ?? this.storeName,
        storeType: storeType ?? this.storeType,
        location: location.present ? location.value : this.location,
        itemIds: itemIds.present ? itemIds.value : this.itemIds,
        itemQuantities:
            itemQuantities.present ? itemQuantities.value : this.itemQuantities,
        itemNotes: itemNotes.present ? itemNotes.value : this.itemNotes,
        budget: budget.present ? budget.value : this.budget,
        priority: priority ?? this.priority,
        notes: notes.present ? notes.value : this.notes,
      );
  ShoppingScheduleData copyWithCompanion(ShoppingScheduleCompanion data) {
    return ShoppingScheduleData(
      id: data.id.present ? data.id.value : this.id,
      isOnline: data.isOnline.present ? data.isOnline.value : this.isOnline,
      storeName: data.storeName.present ? data.storeName.value : this.storeName,
      storeType: data.storeType.present ? data.storeType.value : this.storeType,
      location: data.location.present ? data.location.value : this.location,
      itemIds: data.itemIds.present ? data.itemIds.value : this.itemIds,
      itemQuantities: data.itemQuantities.present
          ? data.itemQuantities.value
          : this.itemQuantities,
      itemNotes: data.itemNotes.present ? data.itemNotes.value : this.itemNotes,
      budget: data.budget.present ? data.budget.value : this.budget,
      priority: data.priority.present ? data.priority.value : this.priority,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingScheduleData(')
          ..write('id: $id, ')
          ..write('isOnline: $isOnline, ')
          ..write('storeName: $storeName, ')
          ..write('storeType: $storeType, ')
          ..write('location: $location, ')
          ..write('itemIds: $itemIds, ')
          ..write('itemQuantities: $itemQuantities, ')
          ..write('itemNotes: $itemNotes, ')
          ..write('budget: $budget, ')
          ..write('priority: $priority, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, isOnline, storeName, storeType, location,
      itemIds, itemQuantities, itemNotes, budget, priority, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShoppingScheduleData &&
          other.id == this.id &&
          other.isOnline == this.isOnline &&
          other.storeName == this.storeName &&
          other.storeType == this.storeType &&
          other.location == this.location &&
          other.itemIds == this.itemIds &&
          other.itemQuantities == this.itemQuantities &&
          other.itemNotes == this.itemNotes &&
          other.budget == this.budget &&
          other.priority == this.priority &&
          other.notes == this.notes);
}

class ShoppingScheduleCompanion extends UpdateCompanion<ShoppingScheduleData> {
  final Value<int> id;
  final Value<bool> isOnline;
  final Value<String> storeName;
  final Value<String> storeType;
  final Value<String?> location;
  final Value<String?> itemIds;
  final Value<String?> itemQuantities;
  final Value<String?> itemNotes;
  final Value<double?> budget;
  final Value<String> priority;
  final Value<String?> notes;
  final Value<int> rowid;
  const ShoppingScheduleCompanion({
    this.id = const Value.absent(),
    this.isOnline = const Value.absent(),
    this.storeName = const Value.absent(),
    this.storeType = const Value.absent(),
    this.location = const Value.absent(),
    this.itemIds = const Value.absent(),
    this.itemQuantities = const Value.absent(),
    this.itemNotes = const Value.absent(),
    this.budget = const Value.absent(),
    this.priority = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ShoppingScheduleCompanion.insert({
    required int id,
    this.isOnline = const Value.absent(),
    required String storeName,
    required String storeType,
    this.location = const Value.absent(),
    this.itemIds = const Value.absent(),
    this.itemQuantities = const Value.absent(),
    this.itemNotes = const Value.absent(),
    this.budget = const Value.absent(),
    this.priority = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        storeName = Value(storeName),
        storeType = Value(storeType);
  static Insertable<ShoppingScheduleData> custom({
    Expression<int>? id,
    Expression<bool>? isOnline,
    Expression<String>? storeName,
    Expression<String>? storeType,
    Expression<String>? location,
    Expression<String>? itemIds,
    Expression<String>? itemQuantities,
    Expression<String>? itemNotes,
    Expression<double>? budget,
    Expression<String>? priority,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isOnline != null) 'is_online': isOnline,
      if (storeName != null) 'store_name': storeName,
      if (storeType != null) 'store_type': storeType,
      if (location != null) 'location': location,
      if (itemIds != null) 'item_ids': itemIds,
      if (itemQuantities != null) 'item_quantities': itemQuantities,
      if (itemNotes != null) 'item_notes': itemNotes,
      if (budget != null) 'budget': budget,
      if (priority != null) 'priority': priority,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ShoppingScheduleCompanion copyWith(
      {Value<int>? id,
      Value<bool>? isOnline,
      Value<String>? storeName,
      Value<String>? storeType,
      Value<String?>? location,
      Value<String?>? itemIds,
      Value<String?>? itemQuantities,
      Value<String?>? itemNotes,
      Value<double?>? budget,
      Value<String>? priority,
      Value<String?>? notes,
      Value<int>? rowid}) {
    return ShoppingScheduleCompanion(
      id: id ?? this.id,
      isOnline: isOnline ?? this.isOnline,
      storeName: storeName ?? this.storeName,
      storeType: storeType ?? this.storeType,
      location: location ?? this.location,
      itemIds: itemIds ?? this.itemIds,
      itemQuantities: itemQuantities ?? this.itemQuantities,
      itemNotes: itemNotes ?? this.itemNotes,
      budget: budget ?? this.budget,
      priority: priority ?? this.priority,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isOnline.present) {
      map['is_online'] = Variable<bool>(isOnline.value);
    }
    if (storeName.present) {
      map['store_name'] = Variable<String>(storeName.value);
    }
    if (storeType.present) {
      map['store_type'] = Variable<String>(storeType.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (itemIds.present) {
      map['item_ids'] = Variable<String>(itemIds.value);
    }
    if (itemQuantities.present) {
      map['item_quantities'] = Variable<String>(itemQuantities.value);
    }
    if (itemNotes.present) {
      map['item_notes'] = Variable<String>(itemNotes.value);
    }
    if (budget.present) {
      map['budget'] = Variable<double>(budget.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingScheduleCompanion(')
          ..write('id: $id, ')
          ..write('isOnline: $isOnline, ')
          ..write('storeName: $storeName, ')
          ..write('storeType: $storeType, ')
          ..write('location: $location, ')
          ..write('itemIds: $itemIds, ')
          ..write('itemQuantities: $itemQuantities, ')
          ..write('itemNotes: $itemNotes, ')
          ..write('budget: $budget, ')
          ..write('priority: $priority, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TravelScheduleTable extends TravelSchedule
    with TableInfo<$TravelScheduleTable, TravelScheduleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TravelScheduleTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES base_schedule (id)'));
  static const VerificationMeta _destinationMeta =
      const VerificationMeta('destination');
  @override
  late final GeneratedColumn<String> destination = GeneratedColumn<String>(
      'destination', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _travelTypeMeta =
      const VerificationMeta('travelType');
  @override
  late final GeneratedColumn<String> travelType = GeneratedColumn<String>(
      'travel_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _departureLocationMeta =
      const VerificationMeta('departureLocation');
  @override
  late final GeneratedColumn<String> departureLocation =
      GeneratedColumn<String>('departure_location', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _departureTimeMeta =
      const VerificationMeta('departureTime');
  @override
  late final GeneratedColumn<DateTime> departureTime =
      GeneratedColumn<DateTime>('departure_time', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _arrivalTimeMeta =
      const VerificationMeta('arrivalTime');
  @override
  late final GeneratedColumn<DateTime> arrivalTime = GeneratedColumn<DateTime>(
      'arrival_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _transportationNumberMeta =
      const VerificationMeta('transportationNumber');
  @override
  late final GeneratedColumn<String> transportationNumber =
      GeneratedColumn<String>('transportation_number', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _seatNumberMeta =
      const VerificationMeta('seatNumber');
  @override
  late final GeneratedColumn<String> seatNumber = GeneratedColumn<String>(
      'seat_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bookingReferenceMeta =
      const VerificationMeta('bookingReference');
  @override
  late final GeneratedColumn<String> bookingReference = GeneratedColumn<String>(
      'booking_reference', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _costMeta = const VerificationMeta('cost');
  @override
  late final GeneratedColumn<double> cost = GeneratedColumn<double>(
      'cost', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _luggageInfoMeta =
      const VerificationMeta('luggageInfo');
  @override
  late final GeneratedColumn<String> luggageInfo = GeneratedColumn<String>(
      'luggage_info', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        destination,
        travelType,
        departureLocation,
        departureTime,
        arrivalTime,
        transportationNumber,
        seatNumber,
        bookingReference,
        cost,
        luggageInfo,
        notes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'travel_schedule';
  @override
  VerificationContext validateIntegrity(Insertable<TravelScheduleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('destination')) {
      context.handle(
          _destinationMeta,
          destination.isAcceptableOrUnknown(
              data['destination']!, _destinationMeta));
    } else if (isInserting) {
      context.missing(_destinationMeta);
    }
    if (data.containsKey('travel_type')) {
      context.handle(
          _travelTypeMeta,
          travelType.isAcceptableOrUnknown(
              data['travel_type']!, _travelTypeMeta));
    } else if (isInserting) {
      context.missing(_travelTypeMeta);
    }
    if (data.containsKey('departure_location')) {
      context.handle(
          _departureLocationMeta,
          departureLocation.isAcceptableOrUnknown(
              data['departure_location']!, _departureLocationMeta));
    }
    if (data.containsKey('departure_time')) {
      context.handle(
          _departureTimeMeta,
          departureTime.isAcceptableOrUnknown(
              data['departure_time']!, _departureTimeMeta));
    }
    if (data.containsKey('arrival_time')) {
      context.handle(
          _arrivalTimeMeta,
          arrivalTime.isAcceptableOrUnknown(
              data['arrival_time']!, _arrivalTimeMeta));
    }
    if (data.containsKey('transportation_number')) {
      context.handle(
          _transportationNumberMeta,
          transportationNumber.isAcceptableOrUnknown(
              data['transportation_number']!, _transportationNumberMeta));
    }
    if (data.containsKey('seat_number')) {
      context.handle(
          _seatNumberMeta,
          seatNumber.isAcceptableOrUnknown(
              data['seat_number']!, _seatNumberMeta));
    }
    if (data.containsKey('booking_reference')) {
      context.handle(
          _bookingReferenceMeta,
          bookingReference.isAcceptableOrUnknown(
              data['booking_reference']!, _bookingReferenceMeta));
    }
    if (data.containsKey('cost')) {
      context.handle(
          _costMeta, cost.isAcceptableOrUnknown(data['cost']!, _costMeta));
    }
    if (data.containsKey('luggage_info')) {
      context.handle(
          _luggageInfoMeta,
          luggageInfo.isAcceptableOrUnknown(
              data['luggage_info']!, _luggageInfoMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  TravelScheduleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TravelScheduleData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      destination: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}destination'])!,
      travelType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}travel_type'])!,
      departureLocation: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}departure_location']),
      departureTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}departure_time']),
      arrivalTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}arrival_time']),
      transportationNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}transportation_number']),
      seatNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}seat_number']),
      bookingReference: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}booking_reference']),
      cost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cost']),
      luggageInfo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}luggage_info']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $TravelScheduleTable createAlias(String alias) {
    return $TravelScheduleTable(attachedDatabase, alias);
  }
}

class TravelScheduleData extends DataClass
    implements Insertable<TravelScheduleData> {
  final int id;
  final String destination;
  final String travelType;
  final String? departureLocation;
  final DateTime? departureTime;
  final DateTime? arrivalTime;
  final String? transportationNumber;
  final String? seatNumber;
  final String? bookingReference;
  final double? cost;
  final String? luggageInfo;
  final String? notes;
  const TravelScheduleData(
      {required this.id,
      required this.destination,
      required this.travelType,
      this.departureLocation,
      this.departureTime,
      this.arrivalTime,
      this.transportationNumber,
      this.seatNumber,
      this.bookingReference,
      this.cost,
      this.luggageInfo,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['destination'] = Variable<String>(destination);
    map['travel_type'] = Variable<String>(travelType);
    if (!nullToAbsent || departureLocation != null) {
      map['departure_location'] = Variable<String>(departureLocation);
    }
    if (!nullToAbsent || departureTime != null) {
      map['departure_time'] = Variable<DateTime>(departureTime);
    }
    if (!nullToAbsent || arrivalTime != null) {
      map['arrival_time'] = Variable<DateTime>(arrivalTime);
    }
    if (!nullToAbsent || transportationNumber != null) {
      map['transportation_number'] = Variable<String>(transportationNumber);
    }
    if (!nullToAbsent || seatNumber != null) {
      map['seat_number'] = Variable<String>(seatNumber);
    }
    if (!nullToAbsent || bookingReference != null) {
      map['booking_reference'] = Variable<String>(bookingReference);
    }
    if (!nullToAbsent || cost != null) {
      map['cost'] = Variable<double>(cost);
    }
    if (!nullToAbsent || luggageInfo != null) {
      map['luggage_info'] = Variable<String>(luggageInfo);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  TravelScheduleCompanion toCompanion(bool nullToAbsent) {
    return TravelScheduleCompanion(
      id: Value(id),
      destination: Value(destination),
      travelType: Value(travelType),
      departureLocation: departureLocation == null && nullToAbsent
          ? const Value.absent()
          : Value(departureLocation),
      departureTime: departureTime == null && nullToAbsent
          ? const Value.absent()
          : Value(departureTime),
      arrivalTime: arrivalTime == null && nullToAbsent
          ? const Value.absent()
          : Value(arrivalTime),
      transportationNumber: transportationNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(transportationNumber),
      seatNumber: seatNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(seatNumber),
      bookingReference: bookingReference == null && nullToAbsent
          ? const Value.absent()
          : Value(bookingReference),
      cost: cost == null && nullToAbsent ? const Value.absent() : Value(cost),
      luggageInfo: luggageInfo == null && nullToAbsent
          ? const Value.absent()
          : Value(luggageInfo),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory TravelScheduleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TravelScheduleData(
      id: serializer.fromJson<int>(json['id']),
      destination: serializer.fromJson<String>(json['destination']),
      travelType: serializer.fromJson<String>(json['travelType']),
      departureLocation:
          serializer.fromJson<String?>(json['departureLocation']),
      departureTime: serializer.fromJson<DateTime?>(json['departureTime']),
      arrivalTime: serializer.fromJson<DateTime?>(json['arrivalTime']),
      transportationNumber:
          serializer.fromJson<String?>(json['transportationNumber']),
      seatNumber: serializer.fromJson<String?>(json['seatNumber']),
      bookingReference: serializer.fromJson<String?>(json['bookingReference']),
      cost: serializer.fromJson<double?>(json['cost']),
      luggageInfo: serializer.fromJson<String?>(json['luggageInfo']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'destination': serializer.toJson<String>(destination),
      'travelType': serializer.toJson<String>(travelType),
      'departureLocation': serializer.toJson<String?>(departureLocation),
      'departureTime': serializer.toJson<DateTime?>(departureTime),
      'arrivalTime': serializer.toJson<DateTime?>(arrivalTime),
      'transportationNumber': serializer.toJson<String?>(transportationNumber),
      'seatNumber': serializer.toJson<String?>(seatNumber),
      'bookingReference': serializer.toJson<String?>(bookingReference),
      'cost': serializer.toJson<double?>(cost),
      'luggageInfo': serializer.toJson<String?>(luggageInfo),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  TravelScheduleData copyWith(
          {int? id,
          String? destination,
          String? travelType,
          Value<String?> departureLocation = const Value.absent(),
          Value<DateTime?> departureTime = const Value.absent(),
          Value<DateTime?> arrivalTime = const Value.absent(),
          Value<String?> transportationNumber = const Value.absent(),
          Value<String?> seatNumber = const Value.absent(),
          Value<String?> bookingReference = const Value.absent(),
          Value<double?> cost = const Value.absent(),
          Value<String?> luggageInfo = const Value.absent(),
          Value<String?> notes = const Value.absent()}) =>
      TravelScheduleData(
        id: id ?? this.id,
        destination: destination ?? this.destination,
        travelType: travelType ?? this.travelType,
        departureLocation: departureLocation.present
            ? departureLocation.value
            : this.departureLocation,
        departureTime:
            departureTime.present ? departureTime.value : this.departureTime,
        arrivalTime: arrivalTime.present ? arrivalTime.value : this.arrivalTime,
        transportationNumber: transportationNumber.present
            ? transportationNumber.value
            : this.transportationNumber,
        seatNumber: seatNumber.present ? seatNumber.value : this.seatNumber,
        bookingReference: bookingReference.present
            ? bookingReference.value
            : this.bookingReference,
        cost: cost.present ? cost.value : this.cost,
        luggageInfo: luggageInfo.present ? luggageInfo.value : this.luggageInfo,
        notes: notes.present ? notes.value : this.notes,
      );
  TravelScheduleData copyWithCompanion(TravelScheduleCompanion data) {
    return TravelScheduleData(
      id: data.id.present ? data.id.value : this.id,
      destination:
          data.destination.present ? data.destination.value : this.destination,
      travelType:
          data.travelType.present ? data.travelType.value : this.travelType,
      departureLocation: data.departureLocation.present
          ? data.departureLocation.value
          : this.departureLocation,
      departureTime: data.departureTime.present
          ? data.departureTime.value
          : this.departureTime,
      arrivalTime:
          data.arrivalTime.present ? data.arrivalTime.value : this.arrivalTime,
      transportationNumber: data.transportationNumber.present
          ? data.transportationNumber.value
          : this.transportationNumber,
      seatNumber:
          data.seatNumber.present ? data.seatNumber.value : this.seatNumber,
      bookingReference: data.bookingReference.present
          ? data.bookingReference.value
          : this.bookingReference,
      cost: data.cost.present ? data.cost.value : this.cost,
      luggageInfo:
          data.luggageInfo.present ? data.luggageInfo.value : this.luggageInfo,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TravelScheduleData(')
          ..write('id: $id, ')
          ..write('destination: $destination, ')
          ..write('travelType: $travelType, ')
          ..write('departureLocation: $departureLocation, ')
          ..write('departureTime: $departureTime, ')
          ..write('arrivalTime: $arrivalTime, ')
          ..write('transportationNumber: $transportationNumber, ')
          ..write('seatNumber: $seatNumber, ')
          ..write('bookingReference: $bookingReference, ')
          ..write('cost: $cost, ')
          ..write('luggageInfo: $luggageInfo, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      destination,
      travelType,
      departureLocation,
      departureTime,
      arrivalTime,
      transportationNumber,
      seatNumber,
      bookingReference,
      cost,
      luggageInfo,
      notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TravelScheduleData &&
          other.id == this.id &&
          other.destination == this.destination &&
          other.travelType == this.travelType &&
          other.departureLocation == this.departureLocation &&
          other.departureTime == this.departureTime &&
          other.arrivalTime == this.arrivalTime &&
          other.transportationNumber == this.transportationNumber &&
          other.seatNumber == this.seatNumber &&
          other.bookingReference == this.bookingReference &&
          other.cost == this.cost &&
          other.luggageInfo == this.luggageInfo &&
          other.notes == this.notes);
}

class TravelScheduleCompanion extends UpdateCompanion<TravelScheduleData> {
  final Value<int> id;
  final Value<String> destination;
  final Value<String> travelType;
  final Value<String?> departureLocation;
  final Value<DateTime?> departureTime;
  final Value<DateTime?> arrivalTime;
  final Value<String?> transportationNumber;
  final Value<String?> seatNumber;
  final Value<String?> bookingReference;
  final Value<double?> cost;
  final Value<String?> luggageInfo;
  final Value<String?> notes;
  final Value<int> rowid;
  const TravelScheduleCompanion({
    this.id = const Value.absent(),
    this.destination = const Value.absent(),
    this.travelType = const Value.absent(),
    this.departureLocation = const Value.absent(),
    this.departureTime = const Value.absent(),
    this.arrivalTime = const Value.absent(),
    this.transportationNumber = const Value.absent(),
    this.seatNumber = const Value.absent(),
    this.bookingReference = const Value.absent(),
    this.cost = const Value.absent(),
    this.luggageInfo = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TravelScheduleCompanion.insert({
    required int id,
    required String destination,
    required String travelType,
    this.departureLocation = const Value.absent(),
    this.departureTime = const Value.absent(),
    this.arrivalTime = const Value.absent(),
    this.transportationNumber = const Value.absent(),
    this.seatNumber = const Value.absent(),
    this.bookingReference = const Value.absent(),
    this.cost = const Value.absent(),
    this.luggageInfo = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        destination = Value(destination),
        travelType = Value(travelType);
  static Insertable<TravelScheduleData> custom({
    Expression<int>? id,
    Expression<String>? destination,
    Expression<String>? travelType,
    Expression<String>? departureLocation,
    Expression<DateTime>? departureTime,
    Expression<DateTime>? arrivalTime,
    Expression<String>? transportationNumber,
    Expression<String>? seatNumber,
    Expression<String>? bookingReference,
    Expression<double>? cost,
    Expression<String>? luggageInfo,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (destination != null) 'destination': destination,
      if (travelType != null) 'travel_type': travelType,
      if (departureLocation != null) 'departure_location': departureLocation,
      if (departureTime != null) 'departure_time': departureTime,
      if (arrivalTime != null) 'arrival_time': arrivalTime,
      if (transportationNumber != null)
        'transportation_number': transportationNumber,
      if (seatNumber != null) 'seat_number': seatNumber,
      if (bookingReference != null) 'booking_reference': bookingReference,
      if (cost != null) 'cost': cost,
      if (luggageInfo != null) 'luggage_info': luggageInfo,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TravelScheduleCompanion copyWith(
      {Value<int>? id,
      Value<String>? destination,
      Value<String>? travelType,
      Value<String?>? departureLocation,
      Value<DateTime?>? departureTime,
      Value<DateTime?>? arrivalTime,
      Value<String?>? transportationNumber,
      Value<String?>? seatNumber,
      Value<String?>? bookingReference,
      Value<double?>? cost,
      Value<String?>? luggageInfo,
      Value<String?>? notes,
      Value<int>? rowid}) {
    return TravelScheduleCompanion(
      id: id ?? this.id,
      destination: destination ?? this.destination,
      travelType: travelType ?? this.travelType,
      departureLocation: departureLocation ?? this.departureLocation,
      departureTime: departureTime ?? this.departureTime,
      arrivalTime: arrivalTime ?? this.arrivalTime,
      transportationNumber: transportationNumber ?? this.transportationNumber,
      seatNumber: seatNumber ?? this.seatNumber,
      bookingReference: bookingReference ?? this.bookingReference,
      cost: cost ?? this.cost,
      luggageInfo: luggageInfo ?? this.luggageInfo,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (destination.present) {
      map['destination'] = Variable<String>(destination.value);
    }
    if (travelType.present) {
      map['travel_type'] = Variable<String>(travelType.value);
    }
    if (departureLocation.present) {
      map['departure_location'] = Variable<String>(departureLocation.value);
    }
    if (departureTime.present) {
      map['departure_time'] = Variable<DateTime>(departureTime.value);
    }
    if (arrivalTime.present) {
      map['arrival_time'] = Variable<DateTime>(arrivalTime.value);
    }
    if (transportationNumber.present) {
      map['transportation_number'] =
          Variable<String>(transportationNumber.value);
    }
    if (seatNumber.present) {
      map['seat_number'] = Variable<String>(seatNumber.value);
    }
    if (bookingReference.present) {
      map['booking_reference'] = Variable<String>(bookingReference.value);
    }
    if (cost.present) {
      map['cost'] = Variable<double>(cost.value);
    }
    if (luggageInfo.present) {
      map['luggage_info'] = Variable<String>(luggageInfo.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TravelScheduleCompanion(')
          ..write('id: $id, ')
          ..write('destination: $destination, ')
          ..write('travelType: $travelType, ')
          ..write('departureLocation: $departureLocation, ')
          ..write('departureTime: $departureTime, ')
          ..write('arrivalTime: $arrivalTime, ')
          ..write('transportationNumber: $transportationNumber, ')
          ..write('seatNumber: $seatNumber, ')
          ..write('bookingReference: $bookingReference, ')
          ..write('cost: $cost, ')
          ..write('luggageInfo: $luggageInfo, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutScheduleTable extends WorkoutSchedule
    with TableInfo<$WorkoutScheduleTable, WorkoutScheduleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutScheduleTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES base_schedule (id)'));
  static const VerificationMeta _workoutTypeMeta =
      const VerificationMeta('workoutType');
  @override
  late final GeneratedColumn<String> workoutType = GeneratedColumn<String>(
      'workout_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _locationTypeMeta =
      const VerificationMeta('locationType');
  @override
  late final GeneratedColumn<String> locationType = GeneratedColumn<String>(
      'location_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _durationMinutesMeta =
      const VerificationMeta('durationMinutes');
  @override
  late final GeneratedColumn<double> durationMinutes = GeneratedColumn<double>(
      'duration_minutes', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _intensityMeta =
      const VerificationMeta('intensity');
  @override
  late final GeneratedColumn<String> intensity = GeneratedColumn<String>(
      'intensity', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _exercisesMeta =
      const VerificationMeta('exercises');
  @override
  late final GeneratedColumn<String> exercises = GeneratedColumn<String>(
      'exercises', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _distanceKmMeta =
      const VerificationMeta('distanceKm');
  @override
  late final GeneratedColumn<double> distanceKm = GeneratedColumn<double>(
      'distance_km', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _caloriesBurnedMeta =
      const VerificationMeta('caloriesBurned');
  @override
  late final GeneratedColumn<double> caloriesBurned = GeneratedColumn<double>(
      'calories_burned', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _equipmentMeta =
      const VerificationMeta('equipment');
  @override
  late final GeneratedColumn<String> equipment = GeneratedColumn<String>(
      'equipment', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        workoutType,
        locationType,
        durationMinutes,
        intensity,
        exercises,
        distanceKm,
        caloriesBurned,
        equipment,
        notes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_schedule';
  @override
  VerificationContext validateIntegrity(
      Insertable<WorkoutScheduleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('workout_type')) {
      context.handle(
          _workoutTypeMeta,
          workoutType.isAcceptableOrUnknown(
              data['workout_type']!, _workoutTypeMeta));
    } else if (isInserting) {
      context.missing(_workoutTypeMeta);
    }
    if (data.containsKey('location_type')) {
      context.handle(
          _locationTypeMeta,
          locationType.isAcceptableOrUnknown(
              data['location_type']!, _locationTypeMeta));
    } else if (isInserting) {
      context.missing(_locationTypeMeta);
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
          _durationMinutesMeta,
          durationMinutes.isAcceptableOrUnknown(
              data['duration_minutes']!, _durationMinutesMeta));
    } else if (isInserting) {
      context.missing(_durationMinutesMeta);
    }
    if (data.containsKey('intensity')) {
      context.handle(_intensityMeta,
          intensity.isAcceptableOrUnknown(data['intensity']!, _intensityMeta));
    } else if (isInserting) {
      context.missing(_intensityMeta);
    }
    if (data.containsKey('exercises')) {
      context.handle(_exercisesMeta,
          exercises.isAcceptableOrUnknown(data['exercises']!, _exercisesMeta));
    }
    if (data.containsKey('distance_km')) {
      context.handle(
          _distanceKmMeta,
          distanceKm.isAcceptableOrUnknown(
              data['distance_km']!, _distanceKmMeta));
    }
    if (data.containsKey('calories_burned')) {
      context.handle(
          _caloriesBurnedMeta,
          caloriesBurned.isAcceptableOrUnknown(
              data['calories_burned']!, _caloriesBurnedMeta));
    }
    if (data.containsKey('equipment')) {
      context.handle(_equipmentMeta,
          equipment.isAcceptableOrUnknown(data['equipment']!, _equipmentMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  WorkoutScheduleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutScheduleData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      workoutType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}workout_type'])!,
      locationType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location_type'])!,
      durationMinutes: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}duration_minutes'])!,
      intensity: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}intensity'])!,
      exercises: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercises']),
      distanceKm: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}distance_km']),
      caloriesBurned: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}calories_burned']),
      equipment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}equipment']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $WorkoutScheduleTable createAlias(String alias) {
    return $WorkoutScheduleTable(attachedDatabase, alias);
  }
}

class WorkoutScheduleData extends DataClass
    implements Insertable<WorkoutScheduleData> {
  final int id;
  final String workoutType;
  final String locationType;
  final double durationMinutes;
  final String intensity;
  final String? exercises;
  final double? distanceKm;
  final double? caloriesBurned;
  final String? equipment;
  final String? notes;
  const WorkoutScheduleData(
      {required this.id,
      required this.workoutType,
      required this.locationType,
      required this.durationMinutes,
      required this.intensity,
      this.exercises,
      this.distanceKm,
      this.caloriesBurned,
      this.equipment,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['workout_type'] = Variable<String>(workoutType);
    map['location_type'] = Variable<String>(locationType);
    map['duration_minutes'] = Variable<double>(durationMinutes);
    map['intensity'] = Variable<String>(intensity);
    if (!nullToAbsent || exercises != null) {
      map['exercises'] = Variable<String>(exercises);
    }
    if (!nullToAbsent || distanceKm != null) {
      map['distance_km'] = Variable<double>(distanceKm);
    }
    if (!nullToAbsent || caloriesBurned != null) {
      map['calories_burned'] = Variable<double>(caloriesBurned);
    }
    if (!nullToAbsent || equipment != null) {
      map['equipment'] = Variable<String>(equipment);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  WorkoutScheduleCompanion toCompanion(bool nullToAbsent) {
    return WorkoutScheduleCompanion(
      id: Value(id),
      workoutType: Value(workoutType),
      locationType: Value(locationType),
      durationMinutes: Value(durationMinutes),
      intensity: Value(intensity),
      exercises: exercises == null && nullToAbsent
          ? const Value.absent()
          : Value(exercises),
      distanceKm: distanceKm == null && nullToAbsent
          ? const Value.absent()
          : Value(distanceKm),
      caloriesBurned: caloriesBurned == null && nullToAbsent
          ? const Value.absent()
          : Value(caloriesBurned),
      equipment: equipment == null && nullToAbsent
          ? const Value.absent()
          : Value(equipment),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory WorkoutScheduleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutScheduleData(
      id: serializer.fromJson<int>(json['id']),
      workoutType: serializer.fromJson<String>(json['workoutType']),
      locationType: serializer.fromJson<String>(json['locationType']),
      durationMinutes: serializer.fromJson<double>(json['durationMinutes']),
      intensity: serializer.fromJson<String>(json['intensity']),
      exercises: serializer.fromJson<String?>(json['exercises']),
      distanceKm: serializer.fromJson<double?>(json['distanceKm']),
      caloriesBurned: serializer.fromJson<double?>(json['caloriesBurned']),
      equipment: serializer.fromJson<String?>(json['equipment']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'workoutType': serializer.toJson<String>(workoutType),
      'locationType': serializer.toJson<String>(locationType),
      'durationMinutes': serializer.toJson<double>(durationMinutes),
      'intensity': serializer.toJson<String>(intensity),
      'exercises': serializer.toJson<String?>(exercises),
      'distanceKm': serializer.toJson<double?>(distanceKm),
      'caloriesBurned': serializer.toJson<double?>(caloriesBurned),
      'equipment': serializer.toJson<String?>(equipment),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  WorkoutScheduleData copyWith(
          {int? id,
          String? workoutType,
          String? locationType,
          double? durationMinutes,
          String? intensity,
          Value<String?> exercises = const Value.absent(),
          Value<double?> distanceKm = const Value.absent(),
          Value<double?> caloriesBurned = const Value.absent(),
          Value<String?> equipment = const Value.absent(),
          Value<String?> notes = const Value.absent()}) =>
      WorkoutScheduleData(
        id: id ?? this.id,
        workoutType: workoutType ?? this.workoutType,
        locationType: locationType ?? this.locationType,
        durationMinutes: durationMinutes ?? this.durationMinutes,
        intensity: intensity ?? this.intensity,
        exercises: exercises.present ? exercises.value : this.exercises,
        distanceKm: distanceKm.present ? distanceKm.value : this.distanceKm,
        caloriesBurned:
            caloriesBurned.present ? caloriesBurned.value : this.caloriesBurned,
        equipment: equipment.present ? equipment.value : this.equipment,
        notes: notes.present ? notes.value : this.notes,
      );
  WorkoutScheduleData copyWithCompanion(WorkoutScheduleCompanion data) {
    return WorkoutScheduleData(
      id: data.id.present ? data.id.value : this.id,
      workoutType:
          data.workoutType.present ? data.workoutType.value : this.workoutType,
      locationType: data.locationType.present
          ? data.locationType.value
          : this.locationType,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
      intensity: data.intensity.present ? data.intensity.value : this.intensity,
      exercises: data.exercises.present ? data.exercises.value : this.exercises,
      distanceKm:
          data.distanceKm.present ? data.distanceKm.value : this.distanceKm,
      caloriesBurned: data.caloriesBurned.present
          ? data.caloriesBurned.value
          : this.caloriesBurned,
      equipment: data.equipment.present ? data.equipment.value : this.equipment,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutScheduleData(')
          ..write('id: $id, ')
          ..write('workoutType: $workoutType, ')
          ..write('locationType: $locationType, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('intensity: $intensity, ')
          ..write('exercises: $exercises, ')
          ..write('distanceKm: $distanceKm, ')
          ..write('caloriesBurned: $caloriesBurned, ')
          ..write('equipment: $equipment, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      workoutType,
      locationType,
      durationMinutes,
      intensity,
      exercises,
      distanceKm,
      caloriesBurned,
      equipment,
      notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutScheduleData &&
          other.id == this.id &&
          other.workoutType == this.workoutType &&
          other.locationType == this.locationType &&
          other.durationMinutes == this.durationMinutes &&
          other.intensity == this.intensity &&
          other.exercises == this.exercises &&
          other.distanceKm == this.distanceKm &&
          other.caloriesBurned == this.caloriesBurned &&
          other.equipment == this.equipment &&
          other.notes == this.notes);
}

class WorkoutScheduleCompanion extends UpdateCompanion<WorkoutScheduleData> {
  final Value<int> id;
  final Value<String> workoutType;
  final Value<String> locationType;
  final Value<double> durationMinutes;
  final Value<String> intensity;
  final Value<String?> exercises;
  final Value<double?> distanceKm;
  final Value<double?> caloriesBurned;
  final Value<String?> equipment;
  final Value<String?> notes;
  final Value<int> rowid;
  const WorkoutScheduleCompanion({
    this.id = const Value.absent(),
    this.workoutType = const Value.absent(),
    this.locationType = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.intensity = const Value.absent(),
    this.exercises = const Value.absent(),
    this.distanceKm = const Value.absent(),
    this.caloriesBurned = const Value.absent(),
    this.equipment = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutScheduleCompanion.insert({
    required int id,
    required String workoutType,
    required String locationType,
    required double durationMinutes,
    required String intensity,
    this.exercises = const Value.absent(),
    this.distanceKm = const Value.absent(),
    this.caloriesBurned = const Value.absent(),
    this.equipment = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        workoutType = Value(workoutType),
        locationType = Value(locationType),
        durationMinutes = Value(durationMinutes),
        intensity = Value(intensity);
  static Insertable<WorkoutScheduleData> custom({
    Expression<int>? id,
    Expression<String>? workoutType,
    Expression<String>? locationType,
    Expression<double>? durationMinutes,
    Expression<String>? intensity,
    Expression<String>? exercises,
    Expression<double>? distanceKm,
    Expression<double>? caloriesBurned,
    Expression<String>? equipment,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workoutType != null) 'workout_type': workoutType,
      if (locationType != null) 'location_type': locationType,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (intensity != null) 'intensity': intensity,
      if (exercises != null) 'exercises': exercises,
      if (distanceKm != null) 'distance_km': distanceKm,
      if (caloriesBurned != null) 'calories_burned': caloriesBurned,
      if (equipment != null) 'equipment': equipment,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutScheduleCompanion copyWith(
      {Value<int>? id,
      Value<String>? workoutType,
      Value<String>? locationType,
      Value<double>? durationMinutes,
      Value<String>? intensity,
      Value<String?>? exercises,
      Value<double?>? distanceKm,
      Value<double?>? caloriesBurned,
      Value<String?>? equipment,
      Value<String?>? notes,
      Value<int>? rowid}) {
    return WorkoutScheduleCompanion(
      id: id ?? this.id,
      workoutType: workoutType ?? this.workoutType,
      locationType: locationType ?? this.locationType,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      intensity: intensity ?? this.intensity,
      exercises: exercises ?? this.exercises,
      distanceKm: distanceKm ?? this.distanceKm,
      caloriesBurned: caloriesBurned ?? this.caloriesBurned,
      equipment: equipment ?? this.equipment,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (workoutType.present) {
      map['workout_type'] = Variable<String>(workoutType.value);
    }
    if (locationType.present) {
      map['location_type'] = Variable<String>(locationType.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<double>(durationMinutes.value);
    }
    if (intensity.present) {
      map['intensity'] = Variable<String>(intensity.value);
    }
    if (exercises.present) {
      map['exercises'] = Variable<String>(exercises.value);
    }
    if (distanceKm.present) {
      map['distance_km'] = Variable<double>(distanceKm.value);
    }
    if (caloriesBurned.present) {
      map['calories_burned'] = Variable<double>(caloriesBurned.value);
    }
    if (equipment.present) {
      map['equipment'] = Variable<String>(equipment.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutScheduleCompanion(')
          ..write('id: $id, ')
          ..write('workoutType: $workoutType, ')
          ..write('locationType: $locationType, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('intensity: $intensity, ')
          ..write('exercises: $exercises, ')
          ..write('distanceKm: $distanceKm, ')
          ..write('caloriesBurned: $caloriesBurned, ')
          ..write('equipment: $equipment, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ShoppingItemTable extends ShoppingItem
    with TableInfo<$ShoppingItemTable, ShoppingItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShoppingItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _defaultQuantityMeta =
      const VerificationMeta('defaultQuantity');
  @override
  late final GeneratedColumn<double> defaultQuantity = GeneratedColumn<double>(
      'default_quantity', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pcs'));
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
      'brand', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _estimatedPriceMeta =
      const VerificationMeta('estimatedPrice');
  @override
  late final GeneratedColumn<double> estimatedPrice = GeneratedColumn<double>(
      'estimated_price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _sizeMeta = const VerificationMeta('size');
  @override
  late final GeneratedColumn<String> size = GeneratedColumn<String>(
      'size', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imagePathMeta =
      const VerificationMeta('imagePath');
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
      'image_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isFavoriteMeta =
      const VerificationMeta('isFavorite');
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
      'is_favorite', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_favorite" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lastUsedMeta =
      const VerificationMeta('lastUsed');
  @override
  late final GeneratedColumn<DateTime> lastUsed = GeneratedColumn<DateTime>(
      'last_used', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _usageCountMeta =
      const VerificationMeta('usageCount');
  @override
  late final GeneratedColumn<int> usageCount = GeneratedColumn<int>(
      'usage_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        defaultQuantity,
        unit,
        category,
        brand,
        estimatedPrice,
        size,
        color,
        imagePath,
        isFavorite,
        createdAt,
        lastUsed,
        usageCount
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shopping_item';
  @override
  VerificationContext validateIntegrity(Insertable<ShoppingItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('default_quantity')) {
      context.handle(
          _defaultQuantityMeta,
          defaultQuantity.isAcceptableOrUnknown(
              data['default_quantity']!, _defaultQuantityMeta));
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('brand')) {
      context.handle(
          _brandMeta, brand.isAcceptableOrUnknown(data['brand']!, _brandMeta));
    }
    if (data.containsKey('estimated_price')) {
      context.handle(
          _estimatedPriceMeta,
          estimatedPrice.isAcceptableOrUnknown(
              data['estimated_price']!, _estimatedPriceMeta));
    }
    if (data.containsKey('size')) {
      context.handle(
          _sizeMeta, size.isAcceptableOrUnknown(data['size']!, _sizeMeta));
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta));
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
          _isFavoriteMeta,
          isFavorite.isAcceptableOrUnknown(
              data['is_favorite']!, _isFavoriteMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_used')) {
      context.handle(_lastUsedMeta,
          lastUsed.isAcceptableOrUnknown(data['last_used']!, _lastUsedMeta));
    }
    if (data.containsKey('usage_count')) {
      context.handle(
          _usageCountMeta,
          usageCount.isAcceptableOrUnknown(
              data['usage_count']!, _usageCountMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShoppingItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShoppingItemData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      defaultQuantity: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}default_quantity'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category']),
      brand: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}brand']),
      estimatedPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}estimated_price']),
      size: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}size']),
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color']),
      imagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path']),
      isFavorite: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_favorite'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      lastUsed: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_used']),
      usageCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}usage_count'])!,
    );
  }

  @override
  $ShoppingItemTable createAlias(String alias) {
    return $ShoppingItemTable(attachedDatabase, alias);
  }
}

class ShoppingItemData extends DataClass
    implements Insertable<ShoppingItemData> {
  final int id;
  final String name;
  final String? description;
  final double defaultQuantity;
  final String unit;
  final String? category;
  final String? brand;
  final double? estimatedPrice;
  final String? size;
  final String? color;
  final String? imagePath;
  final bool isFavorite;
  final DateTime createdAt;
  final DateTime? lastUsed;
  final int usageCount;
  const ShoppingItemData(
      {required this.id,
      required this.name,
      this.description,
      required this.defaultQuantity,
      required this.unit,
      this.category,
      this.brand,
      this.estimatedPrice,
      this.size,
      this.color,
      this.imagePath,
      required this.isFavorite,
      required this.createdAt,
      this.lastUsed,
      required this.usageCount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['default_quantity'] = Variable<double>(defaultQuantity);
    map['unit'] = Variable<String>(unit);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || brand != null) {
      map['brand'] = Variable<String>(brand);
    }
    if (!nullToAbsent || estimatedPrice != null) {
      map['estimated_price'] = Variable<double>(estimatedPrice);
    }
    if (!nullToAbsent || size != null) {
      map['size'] = Variable<String>(size);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    map['is_favorite'] = Variable<bool>(isFavorite);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastUsed != null) {
      map['last_used'] = Variable<DateTime>(lastUsed);
    }
    map['usage_count'] = Variable<int>(usageCount);
    return map;
  }

  ShoppingItemCompanion toCompanion(bool nullToAbsent) {
    return ShoppingItemCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      defaultQuantity: Value(defaultQuantity),
      unit: Value(unit),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      brand:
          brand == null && nullToAbsent ? const Value.absent() : Value(brand),
      estimatedPrice: estimatedPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(estimatedPrice),
      size: size == null && nullToAbsent ? const Value.absent() : Value(size),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      isFavorite: Value(isFavorite),
      createdAt: Value(createdAt),
      lastUsed: lastUsed == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUsed),
      usageCount: Value(usageCount),
    );
  }

  factory ShoppingItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShoppingItemData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      defaultQuantity: serializer.fromJson<double>(json['defaultQuantity']),
      unit: serializer.fromJson<String>(json['unit']),
      category: serializer.fromJson<String?>(json['category']),
      brand: serializer.fromJson<String?>(json['brand']),
      estimatedPrice: serializer.fromJson<double?>(json['estimatedPrice']),
      size: serializer.fromJson<String?>(json['size']),
      color: serializer.fromJson<String?>(json['color']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastUsed: serializer.fromJson<DateTime?>(json['lastUsed']),
      usageCount: serializer.fromJson<int>(json['usageCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'defaultQuantity': serializer.toJson<double>(defaultQuantity),
      'unit': serializer.toJson<String>(unit),
      'category': serializer.toJson<String?>(category),
      'brand': serializer.toJson<String?>(brand),
      'estimatedPrice': serializer.toJson<double?>(estimatedPrice),
      'size': serializer.toJson<String?>(size),
      'color': serializer.toJson<String?>(color),
      'imagePath': serializer.toJson<String?>(imagePath),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastUsed': serializer.toJson<DateTime?>(lastUsed),
      'usageCount': serializer.toJson<int>(usageCount),
    };
  }

  ShoppingItemData copyWith(
          {int? id,
          String? name,
          Value<String?> description = const Value.absent(),
          double? defaultQuantity,
          String? unit,
          Value<String?> category = const Value.absent(),
          Value<String?> brand = const Value.absent(),
          Value<double?> estimatedPrice = const Value.absent(),
          Value<String?> size = const Value.absent(),
          Value<String?> color = const Value.absent(),
          Value<String?> imagePath = const Value.absent(),
          bool? isFavorite,
          DateTime? createdAt,
          Value<DateTime?> lastUsed = const Value.absent(),
          int? usageCount}) =>
      ShoppingItemData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        defaultQuantity: defaultQuantity ?? this.defaultQuantity,
        unit: unit ?? this.unit,
        category: category.present ? category.value : this.category,
        brand: brand.present ? brand.value : this.brand,
        estimatedPrice:
            estimatedPrice.present ? estimatedPrice.value : this.estimatedPrice,
        size: size.present ? size.value : this.size,
        color: color.present ? color.value : this.color,
        imagePath: imagePath.present ? imagePath.value : this.imagePath,
        isFavorite: isFavorite ?? this.isFavorite,
        createdAt: createdAt ?? this.createdAt,
        lastUsed: lastUsed.present ? lastUsed.value : this.lastUsed,
        usageCount: usageCount ?? this.usageCount,
      );
  ShoppingItemData copyWithCompanion(ShoppingItemCompanion data) {
    return ShoppingItemData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      defaultQuantity: data.defaultQuantity.present
          ? data.defaultQuantity.value
          : this.defaultQuantity,
      unit: data.unit.present ? data.unit.value : this.unit,
      category: data.category.present ? data.category.value : this.category,
      brand: data.brand.present ? data.brand.value : this.brand,
      estimatedPrice: data.estimatedPrice.present
          ? data.estimatedPrice.value
          : this.estimatedPrice,
      size: data.size.present ? data.size.value : this.size,
      color: data.color.present ? data.color.value : this.color,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      isFavorite:
          data.isFavorite.present ? data.isFavorite.value : this.isFavorite,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastUsed: data.lastUsed.present ? data.lastUsed.value : this.lastUsed,
      usageCount:
          data.usageCount.present ? data.usageCount.value : this.usageCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingItemData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('defaultQuantity: $defaultQuantity, ')
          ..write('unit: $unit, ')
          ..write('category: $category, ')
          ..write('brand: $brand, ')
          ..write('estimatedPrice: $estimatedPrice, ')
          ..write('size: $size, ')
          ..write('color: $color, ')
          ..write('imagePath: $imagePath, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastUsed: $lastUsed, ')
          ..write('usageCount: $usageCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      description,
      defaultQuantity,
      unit,
      category,
      brand,
      estimatedPrice,
      size,
      color,
      imagePath,
      isFavorite,
      createdAt,
      lastUsed,
      usageCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShoppingItemData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.defaultQuantity == this.defaultQuantity &&
          other.unit == this.unit &&
          other.category == this.category &&
          other.brand == this.brand &&
          other.estimatedPrice == this.estimatedPrice &&
          other.size == this.size &&
          other.color == this.color &&
          other.imagePath == this.imagePath &&
          other.isFavorite == this.isFavorite &&
          other.createdAt == this.createdAt &&
          other.lastUsed == this.lastUsed &&
          other.usageCount == this.usageCount);
}

class ShoppingItemCompanion extends UpdateCompanion<ShoppingItemData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<double> defaultQuantity;
  final Value<String> unit;
  final Value<String?> category;
  final Value<String?> brand;
  final Value<double?> estimatedPrice;
  final Value<String?> size;
  final Value<String?> color;
  final Value<String?> imagePath;
  final Value<bool> isFavorite;
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastUsed;
  final Value<int> usageCount;
  const ShoppingItemCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.defaultQuantity = const Value.absent(),
    this.unit = const Value.absent(),
    this.category = const Value.absent(),
    this.brand = const Value.absent(),
    this.estimatedPrice = const Value.absent(),
    this.size = const Value.absent(),
    this.color = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastUsed = const Value.absent(),
    this.usageCount = const Value.absent(),
  });
  ShoppingItemCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.defaultQuantity = const Value.absent(),
    this.unit = const Value.absent(),
    this.category = const Value.absent(),
    this.brand = const Value.absent(),
    this.estimatedPrice = const Value.absent(),
    this.size = const Value.absent(),
    this.color = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.isFavorite = const Value.absent(),
    required DateTime createdAt,
    this.lastUsed = const Value.absent(),
    this.usageCount = const Value.absent(),
  })  : name = Value(name),
        createdAt = Value(createdAt);
  static Insertable<ShoppingItemData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<double>? defaultQuantity,
    Expression<String>? unit,
    Expression<String>? category,
    Expression<String>? brand,
    Expression<double>? estimatedPrice,
    Expression<String>? size,
    Expression<String>? color,
    Expression<String>? imagePath,
    Expression<bool>? isFavorite,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastUsed,
    Expression<int>? usageCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (defaultQuantity != null) 'default_quantity': defaultQuantity,
      if (unit != null) 'unit': unit,
      if (category != null) 'category': category,
      if (brand != null) 'brand': brand,
      if (estimatedPrice != null) 'estimated_price': estimatedPrice,
      if (size != null) 'size': size,
      if (color != null) 'color': color,
      if (imagePath != null) 'image_path': imagePath,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (createdAt != null) 'created_at': createdAt,
      if (lastUsed != null) 'last_used': lastUsed,
      if (usageCount != null) 'usage_count': usageCount,
    });
  }

  ShoppingItemCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<double>? defaultQuantity,
      Value<String>? unit,
      Value<String?>? category,
      Value<String?>? brand,
      Value<double?>? estimatedPrice,
      Value<String?>? size,
      Value<String?>? color,
      Value<String?>? imagePath,
      Value<bool>? isFavorite,
      Value<DateTime>? createdAt,
      Value<DateTime?>? lastUsed,
      Value<int>? usageCount}) {
    return ShoppingItemCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      defaultQuantity: defaultQuantity ?? this.defaultQuantity,
      unit: unit ?? this.unit,
      category: category ?? this.category,
      brand: brand ?? this.brand,
      estimatedPrice: estimatedPrice ?? this.estimatedPrice,
      size: size ?? this.size,
      color: color ?? this.color,
      imagePath: imagePath ?? this.imagePath,
      isFavorite: isFavorite ?? this.isFavorite,
      createdAt: createdAt ?? this.createdAt,
      lastUsed: lastUsed ?? this.lastUsed,
      usageCount: usageCount ?? this.usageCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (defaultQuantity.present) {
      map['default_quantity'] = Variable<double>(defaultQuantity.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (estimatedPrice.present) {
      map['estimated_price'] = Variable<double>(estimatedPrice.value);
    }
    if (size.present) {
      map['size'] = Variable<String>(size.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastUsed.present) {
      map['last_used'] = Variable<DateTime>(lastUsed.value);
    }
    if (usageCount.present) {
      map['usage_count'] = Variable<int>(usageCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingItemCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('defaultQuantity: $defaultQuantity, ')
          ..write('unit: $unit, ')
          ..write('category: $category, ')
          ..write('brand: $brand, ')
          ..write('estimatedPrice: $estimatedPrice, ')
          ..write('size: $size, ')
          ..write('color: $color, ')
          ..write('imagePath: $imagePath, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastUsed: $lastUsed, ')
          ..write('usageCount: $usageCount')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BaseScheduleTable baseSchedule = $BaseScheduleTable(this);
  late final $EntertainmentScheduleTable entertainmentSchedule =
      $EntertainmentScheduleTable(this);
  late final $LectureScheduleTable lectureSchedule =
      $LectureScheduleTable(this);
  late final $MealScheduleTable mealSchedule = $MealScheduleTable(this);
  late final $MeetingScheduleTable meetingSchedule =
      $MeetingScheduleTable(this);
  late final $PersonalScheduleTable personalSchedule =
      $PersonalScheduleTable(this);
  late final $ShoppingScheduleTable shoppingSchedule =
      $ShoppingScheduleTable(this);
  late final $TravelScheduleTable travelSchedule = $TravelScheduleTable(this);
  late final $WorkoutScheduleTable workoutSchedule =
      $WorkoutScheduleTable(this);
  late final $ShoppingItemTable shoppingItem = $ShoppingItemTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        baseSchedule,
        entertainmentSchedule,
        lectureSchedule,
        mealSchedule,
        meetingSchedule,
        personalSchedule,
        shoppingSchedule,
        travelSchedule,
        workoutSchedule,
        shoppingItem
      ];
}

typedef $$BaseScheduleTableCreateCompanionBuilder = BaseScheduleCompanion
    Function({
  Value<int> id,
  required String title,
  Value<DateTime?> startDate,
  Value<DateTime?> endDate,
  required String scheduleType,
  Value<String?> description,
  Value<String> color,
  Value<bool> isUnscheduled,
  Value<int?> unscheduledYear,
  Value<int?> unscheduledMonth,
});
typedef $$BaseScheduleTableUpdateCompanionBuilder = BaseScheduleCompanion
    Function({
  Value<int> id,
  Value<String> title,
  Value<DateTime?> startDate,
  Value<DateTime?> endDate,
  Value<String> scheduleType,
  Value<String?> description,
  Value<String> color,
  Value<bool> isUnscheduled,
  Value<int?> unscheduledYear,
  Value<int?> unscheduledMonth,
});

final class $$BaseScheduleTableReferences extends BaseReferences<_$AppDatabase,
    $BaseScheduleTable, BaseScheduleData> {
  $$BaseScheduleTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$EntertainmentScheduleTable,
      List<EntertainmentScheduleData>> _entertainmentScheduleRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.entertainmentSchedule,
          aliasName: $_aliasNameGenerator(
              db.baseSchedule.id, db.entertainmentSchedule.id));

  $$EntertainmentScheduleTableProcessedTableManager
      get entertainmentScheduleRefs {
    final manager = $$EntertainmentScheduleTableTableManager(
            $_db, $_db.entertainmentSchedule)
        .filter((f) => f.id.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_entertainmentScheduleRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$LectureScheduleTable, List<LectureScheduleData>>
      _lectureScheduleRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.lectureSchedule,
              aliasName: $_aliasNameGenerator(
                  db.baseSchedule.id, db.lectureSchedule.id));

  $$LectureScheduleTableProcessedTableManager get lectureScheduleRefs {
    final manager =
        $$LectureScheduleTableTableManager($_db, $_db.lectureSchedule)
            .filter((f) => f.id.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_lectureScheduleRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$MealScheduleTable, List<MealScheduleData>>
      _mealScheduleRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.mealSchedule,
              aliasName:
                  $_aliasNameGenerator(db.baseSchedule.id, db.mealSchedule.id));

  $$MealScheduleTableProcessedTableManager get mealScheduleRefs {
    final manager = $$MealScheduleTableTableManager($_db, $_db.mealSchedule)
        .filter((f) => f.id.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_mealScheduleRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$MeetingScheduleTable, List<MeetingScheduleData>>
      _meetingScheduleRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.meetingSchedule,
              aliasName: $_aliasNameGenerator(
                  db.baseSchedule.id, db.meetingSchedule.id));

  $$MeetingScheduleTableProcessedTableManager get meetingScheduleRefs {
    final manager =
        $$MeetingScheduleTableTableManager($_db, $_db.meetingSchedule)
            .filter((f) => f.id.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_meetingScheduleRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$PersonalScheduleTable, List<PersonalScheduleData>>
      _personalScheduleRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.personalSchedule,
              aliasName: $_aliasNameGenerator(
                  db.baseSchedule.id, db.personalSchedule.id));

  $$PersonalScheduleTableProcessedTableManager get personalScheduleRefs {
    final manager =
        $$PersonalScheduleTableTableManager($_db, $_db.personalSchedule)
            .filter((f) => f.id.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_personalScheduleRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ShoppingScheduleTable, List<ShoppingScheduleData>>
      _shoppingScheduleRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.shoppingSchedule,
              aliasName: $_aliasNameGenerator(
                  db.baseSchedule.id, db.shoppingSchedule.id));

  $$ShoppingScheduleTableProcessedTableManager get shoppingScheduleRefs {
    final manager =
        $$ShoppingScheduleTableTableManager($_db, $_db.shoppingSchedule)
            .filter((f) => f.id.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_shoppingScheduleRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TravelScheduleTable, List<TravelScheduleData>>
      _travelScheduleRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.travelSchedule,
              aliasName: $_aliasNameGenerator(
                  db.baseSchedule.id, db.travelSchedule.id));

  $$TravelScheduleTableProcessedTableManager get travelScheduleRefs {
    final manager = $$TravelScheduleTableTableManager($_db, $_db.travelSchedule)
        .filter((f) => f.id.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_travelScheduleRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$WorkoutScheduleTable, List<WorkoutScheduleData>>
      _workoutScheduleRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.workoutSchedule,
              aliasName: $_aliasNameGenerator(
                  db.baseSchedule.id, db.workoutSchedule.id));

  $$WorkoutScheduleTableProcessedTableManager get workoutScheduleRefs {
    final manager =
        $$WorkoutScheduleTableTableManager($_db, $_db.workoutSchedule)
            .filter((f) => f.id.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_workoutScheduleRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$BaseScheduleTableFilterComposer
    extends Composer<_$AppDatabase, $BaseScheduleTable> {
  $$BaseScheduleTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get scheduleType => $composableBuilder(
      column: $table.scheduleType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isUnscheduled => $composableBuilder(
      column: $table.isUnscheduled, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get unscheduledYear => $composableBuilder(
      column: $table.unscheduledYear,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get unscheduledMonth => $composableBuilder(
      column: $table.unscheduledMonth,
      builder: (column) => ColumnFilters(column));

  Expression<bool> entertainmentScheduleRefs(
      Expression<bool> Function($$EntertainmentScheduleTableFilterComposer f)
          f) {
    final $$EntertainmentScheduleTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.entertainmentSchedule,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$EntertainmentScheduleTableFilterComposer(
                  $db: $db,
                  $table: $db.entertainmentSchedule,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> lectureScheduleRefs(
      Expression<bool> Function($$LectureScheduleTableFilterComposer f) f) {
    final $$LectureScheduleTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.lectureSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LectureScheduleTableFilterComposer(
              $db: $db,
              $table: $db.lectureSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> mealScheduleRefs(
      Expression<bool> Function($$MealScheduleTableFilterComposer f) f) {
    final $$MealScheduleTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.mealSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MealScheduleTableFilterComposer(
              $db: $db,
              $table: $db.mealSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> meetingScheduleRefs(
      Expression<bool> Function($$MeetingScheduleTableFilterComposer f) f) {
    final $$MeetingScheduleTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.meetingSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MeetingScheduleTableFilterComposer(
              $db: $db,
              $table: $db.meetingSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> personalScheduleRefs(
      Expression<bool> Function($$PersonalScheduleTableFilterComposer f) f) {
    final $$PersonalScheduleTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.personalSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonalScheduleTableFilterComposer(
              $db: $db,
              $table: $db.personalSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> shoppingScheduleRefs(
      Expression<bool> Function($$ShoppingScheduleTableFilterComposer f) f) {
    final $$ShoppingScheduleTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.shoppingSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ShoppingScheduleTableFilterComposer(
              $db: $db,
              $table: $db.shoppingSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> travelScheduleRefs(
      Expression<bool> Function($$TravelScheduleTableFilterComposer f) f) {
    final $$TravelScheduleTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.travelSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TravelScheduleTableFilterComposer(
              $db: $db,
              $table: $db.travelSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> workoutScheduleRefs(
      Expression<bool> Function($$WorkoutScheduleTableFilterComposer f) f) {
    final $$WorkoutScheduleTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.workoutSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutScheduleTableFilterComposer(
              $db: $db,
              $table: $db.workoutSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$BaseScheduleTableOrderingComposer
    extends Composer<_$AppDatabase, $BaseScheduleTable> {
  $$BaseScheduleTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get scheduleType => $composableBuilder(
      column: $table.scheduleType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isUnscheduled => $composableBuilder(
      column: $table.isUnscheduled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get unscheduledYear => $composableBuilder(
      column: $table.unscheduledYear,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get unscheduledMonth => $composableBuilder(
      column: $table.unscheduledMonth,
      builder: (column) => ColumnOrderings(column));
}

class $$BaseScheduleTableAnnotationComposer
    extends Composer<_$AppDatabase, $BaseScheduleTable> {
  $$BaseScheduleTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<String> get scheduleType => $composableBuilder(
      column: $table.scheduleType, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<bool> get isUnscheduled => $composableBuilder(
      column: $table.isUnscheduled, builder: (column) => column);

  GeneratedColumn<int> get unscheduledYear => $composableBuilder(
      column: $table.unscheduledYear, builder: (column) => column);

  GeneratedColumn<int> get unscheduledMonth => $composableBuilder(
      column: $table.unscheduledMonth, builder: (column) => column);

  Expression<T> entertainmentScheduleRefs<T extends Object>(
      Expression<T> Function($$EntertainmentScheduleTableAnnotationComposer a)
          f) {
    final $$EntertainmentScheduleTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.entertainmentSchedule,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$EntertainmentScheduleTableAnnotationComposer(
                  $db: $db,
                  $table: $db.entertainmentSchedule,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> lectureScheduleRefs<T extends Object>(
      Expression<T> Function($$LectureScheduleTableAnnotationComposer a) f) {
    final $$LectureScheduleTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.lectureSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LectureScheduleTableAnnotationComposer(
              $db: $db,
              $table: $db.lectureSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> mealScheduleRefs<T extends Object>(
      Expression<T> Function($$MealScheduleTableAnnotationComposer a) f) {
    final $$MealScheduleTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.mealSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MealScheduleTableAnnotationComposer(
              $db: $db,
              $table: $db.mealSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> meetingScheduleRefs<T extends Object>(
      Expression<T> Function($$MeetingScheduleTableAnnotationComposer a) f) {
    final $$MeetingScheduleTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.meetingSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MeetingScheduleTableAnnotationComposer(
              $db: $db,
              $table: $db.meetingSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> personalScheduleRefs<T extends Object>(
      Expression<T> Function($$PersonalScheduleTableAnnotationComposer a) f) {
    final $$PersonalScheduleTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.personalSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonalScheduleTableAnnotationComposer(
              $db: $db,
              $table: $db.personalSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> shoppingScheduleRefs<T extends Object>(
      Expression<T> Function($$ShoppingScheduleTableAnnotationComposer a) f) {
    final $$ShoppingScheduleTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.shoppingSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ShoppingScheduleTableAnnotationComposer(
              $db: $db,
              $table: $db.shoppingSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> travelScheduleRefs<T extends Object>(
      Expression<T> Function($$TravelScheduleTableAnnotationComposer a) f) {
    final $$TravelScheduleTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.travelSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TravelScheduleTableAnnotationComposer(
              $db: $db,
              $table: $db.travelSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> workoutScheduleRefs<T extends Object>(
      Expression<T> Function($$WorkoutScheduleTableAnnotationComposer a) f) {
    final $$WorkoutScheduleTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.workoutSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutScheduleTableAnnotationComposer(
              $db: $db,
              $table: $db.workoutSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$BaseScheduleTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BaseScheduleTable,
    BaseScheduleData,
    $$BaseScheduleTableFilterComposer,
    $$BaseScheduleTableOrderingComposer,
    $$BaseScheduleTableAnnotationComposer,
    $$BaseScheduleTableCreateCompanionBuilder,
    $$BaseScheduleTableUpdateCompanionBuilder,
    (BaseScheduleData, $$BaseScheduleTableReferences),
    BaseScheduleData,
    PrefetchHooks Function(
        {bool entertainmentScheduleRefs,
        bool lectureScheduleRefs,
        bool mealScheduleRefs,
        bool meetingScheduleRefs,
        bool personalScheduleRefs,
        bool shoppingScheduleRefs,
        bool travelScheduleRefs,
        bool workoutScheduleRefs})> {
  $$BaseScheduleTableTableManager(_$AppDatabase db, $BaseScheduleTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BaseScheduleTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BaseScheduleTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BaseScheduleTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<DateTime?> startDate = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<String> scheduleType = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String> color = const Value.absent(),
            Value<bool> isUnscheduled = const Value.absent(),
            Value<int?> unscheduledYear = const Value.absent(),
            Value<int?> unscheduledMonth = const Value.absent(),
          }) =>
              BaseScheduleCompanion(
            id: id,
            title: title,
            startDate: startDate,
            endDate: endDate,
            scheduleType: scheduleType,
            description: description,
            color: color,
            isUnscheduled: isUnscheduled,
            unscheduledYear: unscheduledYear,
            unscheduledMonth: unscheduledMonth,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            Value<DateTime?> startDate = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            required String scheduleType,
            Value<String?> description = const Value.absent(),
            Value<String> color = const Value.absent(),
            Value<bool> isUnscheduled = const Value.absent(),
            Value<int?> unscheduledYear = const Value.absent(),
            Value<int?> unscheduledMonth = const Value.absent(),
          }) =>
              BaseScheduleCompanion.insert(
            id: id,
            title: title,
            startDate: startDate,
            endDate: endDate,
            scheduleType: scheduleType,
            description: description,
            color: color,
            isUnscheduled: isUnscheduled,
            unscheduledYear: unscheduledYear,
            unscheduledMonth: unscheduledMonth,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$BaseScheduleTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {entertainmentScheduleRefs = false,
              lectureScheduleRefs = false,
              mealScheduleRefs = false,
              meetingScheduleRefs = false,
              personalScheduleRefs = false,
              shoppingScheduleRefs = false,
              travelScheduleRefs = false,
              workoutScheduleRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (entertainmentScheduleRefs) db.entertainmentSchedule,
                if (lectureScheduleRefs) db.lectureSchedule,
                if (mealScheduleRefs) db.mealSchedule,
                if (meetingScheduleRefs) db.meetingSchedule,
                if (personalScheduleRefs) db.personalSchedule,
                if (shoppingScheduleRefs) db.shoppingSchedule,
                if (travelScheduleRefs) db.travelSchedule,
                if (workoutScheduleRefs) db.workoutSchedule
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (entertainmentScheduleRefs)
                    await $_getPrefetchedData<BaseScheduleData,
                            $BaseScheduleTable, EntertainmentScheduleData>(
                        currentTable: table,
                        referencedTable: $$BaseScheduleTableReferences
                            ._entertainmentScheduleRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BaseScheduleTableReferences(db, table, p0)
                                .entertainmentScheduleRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) =>
                                referencedItems.where((e) => e.id == item.id),
                        typedResults: items),
                  if (lectureScheduleRefs)
                    await $_getPrefetchedData<BaseScheduleData,
                            $BaseScheduleTable, LectureScheduleData>(
                        currentTable: table,
                        referencedTable: $$BaseScheduleTableReferences
                            ._lectureScheduleRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BaseScheduleTableReferences(db, table, p0)
                                .lectureScheduleRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) =>
                                referencedItems.where((e) => e.id == item.id),
                        typedResults: items),
                  if (mealScheduleRefs)
                    await $_getPrefetchedData<BaseScheduleData,
                            $BaseScheduleTable, MealScheduleData>(
                        currentTable: table,
                        referencedTable: $$BaseScheduleTableReferences
                            ._mealScheduleRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BaseScheduleTableReferences(db, table, p0)
                                .mealScheduleRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) =>
                                referencedItems.where((e) => e.id == item.id),
                        typedResults: items),
                  if (meetingScheduleRefs)
                    await $_getPrefetchedData<BaseScheduleData,
                            $BaseScheduleTable, MeetingScheduleData>(
                        currentTable: table,
                        referencedTable: $$BaseScheduleTableReferences
                            ._meetingScheduleRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BaseScheduleTableReferences(db, table, p0)
                                .meetingScheduleRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) =>
                                referencedItems.where((e) => e.id == item.id),
                        typedResults: items),
                  if (personalScheduleRefs)
                    await $_getPrefetchedData<BaseScheduleData,
                            $BaseScheduleTable, PersonalScheduleData>(
                        currentTable: table,
                        referencedTable: $$BaseScheduleTableReferences
                            ._personalScheduleRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BaseScheduleTableReferences(db, table, p0)
                                .personalScheduleRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) =>
                                referencedItems.where((e) => e.id == item.id),
                        typedResults: items),
                  if (shoppingScheduleRefs)
                    await $_getPrefetchedData<BaseScheduleData,
                            $BaseScheduleTable, ShoppingScheduleData>(
                        currentTable: table,
                        referencedTable: $$BaseScheduleTableReferences
                            ._shoppingScheduleRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BaseScheduleTableReferences(db, table, p0)
                                .shoppingScheduleRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) =>
                                referencedItems.where((e) => e.id == item.id),
                        typedResults: items),
                  if (travelScheduleRefs)
                    await $_getPrefetchedData<BaseScheduleData,
                            $BaseScheduleTable, TravelScheduleData>(
                        currentTable: table,
                        referencedTable: $$BaseScheduleTableReferences
                            ._travelScheduleRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BaseScheduleTableReferences(db, table, p0)
                                .travelScheduleRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) =>
                                referencedItems.where((e) => e.id == item.id),
                        typedResults: items),
                  if (workoutScheduleRefs)
                    await $_getPrefetchedData<BaseScheduleData,
                            $BaseScheduleTable, WorkoutScheduleData>(
                        currentTable: table,
                        referencedTable: $$BaseScheduleTableReferences
                            ._workoutScheduleRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BaseScheduleTableReferences(db, table, p0)
                                .workoutScheduleRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) =>
                                referencedItems.where((e) => e.id == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$BaseScheduleTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BaseScheduleTable,
    BaseScheduleData,
    $$BaseScheduleTableFilterComposer,
    $$BaseScheduleTableOrderingComposer,
    $$BaseScheduleTableAnnotationComposer,
    $$BaseScheduleTableCreateCompanionBuilder,
    $$BaseScheduleTableUpdateCompanionBuilder,
    (BaseScheduleData, $$BaseScheduleTableReferences),
    BaseScheduleData,
    PrefetchHooks Function(
        {bool entertainmentScheduleRefs,
        bool lectureScheduleRefs,
        bool mealScheduleRefs,
        bool meetingScheduleRefs,
        bool personalScheduleRefs,
        bool shoppingScheduleRefs,
        bool travelScheduleRefs,
        bool workoutScheduleRefs})>;
typedef $$EntertainmentScheduleTableCreateCompanionBuilder
    = EntertainmentScheduleCompanion Function({
  required int id,
  required String entertainmentType,
  required String venue,
  Value<String?> performer,
  Value<String?> genre,
  Value<String?> seatInfo,
  Value<double?> ticketPrice,
  Value<String?> companions,
  Value<String?> ticketReference,
  Value<String?> notes,
  Value<int> rowid,
});
typedef $$EntertainmentScheduleTableUpdateCompanionBuilder
    = EntertainmentScheduleCompanion Function({
  Value<int> id,
  Value<String> entertainmentType,
  Value<String> venue,
  Value<String?> performer,
  Value<String?> genre,
  Value<String?> seatInfo,
  Value<double?> ticketPrice,
  Value<String?> companions,
  Value<String?> ticketReference,
  Value<String?> notes,
  Value<int> rowid,
});

final class $$EntertainmentScheduleTableReferences extends BaseReferences<
    _$AppDatabase, $EntertainmentScheduleTable, EntertainmentScheduleData> {
  $$EntertainmentScheduleTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $BaseScheduleTable _idTable(_$AppDatabase db) =>
      db.baseSchedule.createAlias($_aliasNameGenerator(
          db.entertainmentSchedule.id, db.baseSchedule.id));

  $$BaseScheduleTableProcessedTableManager get id {
    final $_column = $_itemColumn<int>('id')!;

    final manager = $$BaseScheduleTableTableManager($_db, $_db.baseSchedule)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$EntertainmentScheduleTableFilterComposer
    extends Composer<_$AppDatabase, $EntertainmentScheduleTable> {
  $$EntertainmentScheduleTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get entertainmentType => $composableBuilder(
      column: $table.entertainmentType,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get venue => $composableBuilder(
      column: $table.venue, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get performer => $composableBuilder(
      column: $table.performer, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get genre => $composableBuilder(
      column: $table.genre, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get seatInfo => $composableBuilder(
      column: $table.seatInfo, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get ticketPrice => $composableBuilder(
      column: $table.ticketPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get companions => $composableBuilder(
      column: $table.companions, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ticketReference => $composableBuilder(
      column: $table.ticketReference,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  $$BaseScheduleTableFilterComposer get id {
    final $$BaseScheduleTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.baseSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BaseScheduleTableFilterComposer(
              $db: $db,
              $table: $db.baseSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EntertainmentScheduleTableOrderingComposer
    extends Composer<_$AppDatabase, $EntertainmentScheduleTable> {
  $$EntertainmentScheduleTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get entertainmentType => $composableBuilder(
      column: $table.entertainmentType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get venue => $composableBuilder(
      column: $table.venue, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get performer => $composableBuilder(
      column: $table.performer, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get genre => $composableBuilder(
      column: $table.genre, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get seatInfo => $composableBuilder(
      column: $table.seatInfo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get ticketPrice => $composableBuilder(
      column: $table.ticketPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get companions => $composableBuilder(
      column: $table.companions, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ticketReference => $composableBuilder(
      column: $table.ticketReference,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  $$BaseScheduleTableOrderingComposer get id {
    final $$BaseScheduleTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.baseSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BaseScheduleTableOrderingComposer(
              $db: $db,
              $table: $db.baseSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EntertainmentScheduleTableAnnotationComposer
    extends Composer<_$AppDatabase, $EntertainmentScheduleTable> {
  $$EntertainmentScheduleTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get entertainmentType => $composableBuilder(
      column: $table.entertainmentType, builder: (column) => column);

  GeneratedColumn<String> get venue =>
      $composableBuilder(column: $table.venue, builder: (column) => column);

  GeneratedColumn<String> get performer =>
      $composableBuilder(column: $table.performer, builder: (column) => column);

  GeneratedColumn<String> get genre =>
      $composableBuilder(column: $table.genre, builder: (column) => column);

  GeneratedColumn<String> get seatInfo =>
      $composableBuilder(column: $table.seatInfo, builder: (column) => column);

  GeneratedColumn<double> get ticketPrice => $composableBuilder(
      column: $table.ticketPrice, builder: (column) => column);

  GeneratedColumn<String> get companions => $composableBuilder(
      column: $table.companions, builder: (column) => column);

  GeneratedColumn<String> get ticketReference => $composableBuilder(
      column: $table.ticketReference, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$BaseScheduleTableAnnotationComposer get id {
    final $$BaseScheduleTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.baseSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BaseScheduleTableAnnotationComposer(
              $db: $db,
              $table: $db.baseSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EntertainmentScheduleTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EntertainmentScheduleTable,
    EntertainmentScheduleData,
    $$EntertainmentScheduleTableFilterComposer,
    $$EntertainmentScheduleTableOrderingComposer,
    $$EntertainmentScheduleTableAnnotationComposer,
    $$EntertainmentScheduleTableCreateCompanionBuilder,
    $$EntertainmentScheduleTableUpdateCompanionBuilder,
    (EntertainmentScheduleData, $$EntertainmentScheduleTableReferences),
    EntertainmentScheduleData,
    PrefetchHooks Function({bool id})> {
  $$EntertainmentScheduleTableTableManager(
      _$AppDatabase db, $EntertainmentScheduleTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EntertainmentScheduleTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$EntertainmentScheduleTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EntertainmentScheduleTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> entertainmentType = const Value.absent(),
            Value<String> venue = const Value.absent(),
            Value<String?> performer = const Value.absent(),
            Value<String?> genre = const Value.absent(),
            Value<String?> seatInfo = const Value.absent(),
            Value<double?> ticketPrice = const Value.absent(),
            Value<String?> companions = const Value.absent(),
            Value<String?> ticketReference = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EntertainmentScheduleCompanion(
            id: id,
            entertainmentType: entertainmentType,
            venue: venue,
            performer: performer,
            genre: genre,
            seatInfo: seatInfo,
            ticketPrice: ticketPrice,
            companions: companions,
            ticketReference: ticketReference,
            notes: notes,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required String entertainmentType,
            required String venue,
            Value<String?> performer = const Value.absent(),
            Value<String?> genre = const Value.absent(),
            Value<String?> seatInfo = const Value.absent(),
            Value<double?> ticketPrice = const Value.absent(),
            Value<String?> companions = const Value.absent(),
            Value<String?> ticketReference = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EntertainmentScheduleCompanion.insert(
            id: id,
            entertainmentType: entertainmentType,
            venue: venue,
            performer: performer,
            genre: genre,
            seatInfo: seatInfo,
            ticketPrice: ticketPrice,
            companions: companions,
            ticketReference: ticketReference,
            notes: notes,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$EntertainmentScheduleTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({id = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (id) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.id,
                    referencedTable:
                        $$EntertainmentScheduleTableReferences._idTable(db),
                    referencedColumn:
                        $$EntertainmentScheduleTableReferences._idTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$EntertainmentScheduleTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $EntertainmentScheduleTable,
        EntertainmentScheduleData,
        $$EntertainmentScheduleTableFilterComposer,
        $$EntertainmentScheduleTableOrderingComposer,
        $$EntertainmentScheduleTableAnnotationComposer,
        $$EntertainmentScheduleTableCreateCompanionBuilder,
        $$EntertainmentScheduleTableUpdateCompanionBuilder,
        (EntertainmentScheduleData, $$EntertainmentScheduleTableReferences),
        EntertainmentScheduleData,
        PrefetchHooks Function({bool id})>;
typedef $$LectureScheduleTableCreateCompanionBuilder = LectureScheduleCompanion
    Function({
  required int id,
  required String subject,
  required String instructor,
  Value<String?> roomNumber,
  Value<String?> building,
  Value<String?> courseCode,
  Value<String?> materials,
  Value<bool> isOnline,
  Value<String?> platform,
  Value<String?> link,
  Value<String?> notes,
  Value<String?> assignments,
  Value<double?> durationHours,
  Value<int> rowid,
});
typedef $$LectureScheduleTableUpdateCompanionBuilder = LectureScheduleCompanion
    Function({
  Value<int> id,
  Value<String> subject,
  Value<String> instructor,
  Value<String?> roomNumber,
  Value<String?> building,
  Value<String?> courseCode,
  Value<String?> materials,
  Value<bool> isOnline,
  Value<String?> platform,
  Value<String?> link,
  Value<String?> notes,
  Value<String?> assignments,
  Value<double?> durationHours,
  Value<int> rowid,
});

final class $$LectureScheduleTableReferences extends BaseReferences<
    _$AppDatabase, $LectureScheduleTable, LectureScheduleData> {
  $$LectureScheduleTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $BaseScheduleTable _idTable(_$AppDatabase db) =>
      db.baseSchedule.createAlias(
          $_aliasNameGenerator(db.lectureSchedule.id, db.baseSchedule.id));

  $$BaseScheduleTableProcessedTableManager get id {
    final $_column = $_itemColumn<int>('id')!;

    final manager = $$BaseScheduleTableTableManager($_db, $_db.baseSchedule)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$LectureScheduleTableFilterComposer
    extends Composer<_$AppDatabase, $LectureScheduleTable> {
  $$LectureScheduleTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get instructor => $composableBuilder(
      column: $table.instructor, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get roomNumber => $composableBuilder(
      column: $table.roomNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get building => $composableBuilder(
      column: $table.building, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get courseCode => $composableBuilder(
      column: $table.courseCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get materials => $composableBuilder(
      column: $table.materials, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isOnline => $composableBuilder(
      column: $table.isOnline, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get platform => $composableBuilder(
      column: $table.platform, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get link => $composableBuilder(
      column: $table.link, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get assignments => $composableBuilder(
      column: $table.assignments, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get durationHours => $composableBuilder(
      column: $table.durationHours, builder: (column) => ColumnFilters(column));

  $$BaseScheduleTableFilterComposer get id {
    final $$BaseScheduleTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.baseSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BaseScheduleTableFilterComposer(
              $db: $db,
              $table: $db.baseSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LectureScheduleTableOrderingComposer
    extends Composer<_$AppDatabase, $LectureScheduleTable> {
  $$LectureScheduleTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get instructor => $composableBuilder(
      column: $table.instructor, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get roomNumber => $composableBuilder(
      column: $table.roomNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get building => $composableBuilder(
      column: $table.building, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get courseCode => $composableBuilder(
      column: $table.courseCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get materials => $composableBuilder(
      column: $table.materials, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isOnline => $composableBuilder(
      column: $table.isOnline, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get platform => $composableBuilder(
      column: $table.platform, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get link => $composableBuilder(
      column: $table.link, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get assignments => $composableBuilder(
      column: $table.assignments, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get durationHours => $composableBuilder(
      column: $table.durationHours,
      builder: (column) => ColumnOrderings(column));

  $$BaseScheduleTableOrderingComposer get id {
    final $$BaseScheduleTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.baseSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BaseScheduleTableOrderingComposer(
              $db: $db,
              $table: $db.baseSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LectureScheduleTableAnnotationComposer
    extends Composer<_$AppDatabase, $LectureScheduleTable> {
  $$LectureScheduleTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get subject =>
      $composableBuilder(column: $table.subject, builder: (column) => column);

  GeneratedColumn<String> get instructor => $composableBuilder(
      column: $table.instructor, builder: (column) => column);

  GeneratedColumn<String> get roomNumber => $composableBuilder(
      column: $table.roomNumber, builder: (column) => column);

  GeneratedColumn<String> get building =>
      $composableBuilder(column: $table.building, builder: (column) => column);

  GeneratedColumn<String> get courseCode => $composableBuilder(
      column: $table.courseCode, builder: (column) => column);

  GeneratedColumn<String> get materials =>
      $composableBuilder(column: $table.materials, builder: (column) => column);

  GeneratedColumn<bool> get isOnline =>
      $composableBuilder(column: $table.isOnline, builder: (column) => column);

  GeneratedColumn<String> get platform =>
      $composableBuilder(column: $table.platform, builder: (column) => column);

  GeneratedColumn<String> get link =>
      $composableBuilder(column: $table.link, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get assignments => $composableBuilder(
      column: $table.assignments, builder: (column) => column);

  GeneratedColumn<double> get durationHours => $composableBuilder(
      column: $table.durationHours, builder: (column) => column);

  $$BaseScheduleTableAnnotationComposer get id {
    final $$BaseScheduleTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.baseSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BaseScheduleTableAnnotationComposer(
              $db: $db,
              $table: $db.baseSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LectureScheduleTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LectureScheduleTable,
    LectureScheduleData,
    $$LectureScheduleTableFilterComposer,
    $$LectureScheduleTableOrderingComposer,
    $$LectureScheduleTableAnnotationComposer,
    $$LectureScheduleTableCreateCompanionBuilder,
    $$LectureScheduleTableUpdateCompanionBuilder,
    (LectureScheduleData, $$LectureScheduleTableReferences),
    LectureScheduleData,
    PrefetchHooks Function({bool id})> {
  $$LectureScheduleTableTableManager(
      _$AppDatabase db, $LectureScheduleTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LectureScheduleTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LectureScheduleTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LectureScheduleTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> subject = const Value.absent(),
            Value<String> instructor = const Value.absent(),
            Value<String?> roomNumber = const Value.absent(),
            Value<String?> building = const Value.absent(),
            Value<String?> courseCode = const Value.absent(),
            Value<String?> materials = const Value.absent(),
            Value<bool> isOnline = const Value.absent(),
            Value<String?> platform = const Value.absent(),
            Value<String?> link = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String?> assignments = const Value.absent(),
            Value<double?> durationHours = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LectureScheduleCompanion(
            id: id,
            subject: subject,
            instructor: instructor,
            roomNumber: roomNumber,
            building: building,
            courseCode: courseCode,
            materials: materials,
            isOnline: isOnline,
            platform: platform,
            link: link,
            notes: notes,
            assignments: assignments,
            durationHours: durationHours,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required String subject,
            required String instructor,
            Value<String?> roomNumber = const Value.absent(),
            Value<String?> building = const Value.absent(),
            Value<String?> courseCode = const Value.absent(),
            Value<String?> materials = const Value.absent(),
            Value<bool> isOnline = const Value.absent(),
            Value<String?> platform = const Value.absent(),
            Value<String?> link = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String?> assignments = const Value.absent(),
            Value<double?> durationHours = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LectureScheduleCompanion.insert(
            id: id,
            subject: subject,
            instructor: instructor,
            roomNumber: roomNumber,
            building: building,
            courseCode: courseCode,
            materials: materials,
            isOnline: isOnline,
            platform: platform,
            link: link,
            notes: notes,
            assignments: assignments,
            durationHours: durationHours,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$LectureScheduleTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({id = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (id) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.id,
                    referencedTable:
                        $$LectureScheduleTableReferences._idTable(db),
                    referencedColumn:
                        $$LectureScheduleTableReferences._idTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$LectureScheduleTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LectureScheduleTable,
    LectureScheduleData,
    $$LectureScheduleTableFilterComposer,
    $$LectureScheduleTableOrderingComposer,
    $$LectureScheduleTableAnnotationComposer,
    $$LectureScheduleTableCreateCompanionBuilder,
    $$LectureScheduleTableUpdateCompanionBuilder,
    (LectureScheduleData, $$LectureScheduleTableReferences),
    LectureScheduleData,
    PrefetchHooks Function({bool id})>;
typedef $$MealScheduleTableCreateCompanionBuilder = MealScheduleCompanion
    Function({
  required int id,
  required String mealType,
  Value<String?> cuisine,
  Value<String?> location,
  Value<String?> restaurantName,
  Value<String?> dietType,
  Value<String?> menuItems,
  Value<int> numberOfPeople,
  Value<double?> estimatedCost,
  Value<bool> isDelivery,
  Value<String?> specialRequests,
  Value<String?> notes,
  Value<int> rowid,
});
typedef $$MealScheduleTableUpdateCompanionBuilder = MealScheduleCompanion
    Function({
  Value<int> id,
  Value<String> mealType,
  Value<String?> cuisine,
  Value<String?> location,
  Value<String?> restaurantName,
  Value<String?> dietType,
  Value<String?> menuItems,
  Value<int> numberOfPeople,
  Value<double?> estimatedCost,
  Value<bool> isDelivery,
  Value<String?> specialRequests,
  Value<String?> notes,
  Value<int> rowid,
});

final class $$MealScheduleTableReferences extends BaseReferences<_$AppDatabase,
    $MealScheduleTable, MealScheduleData> {
  $$MealScheduleTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $BaseScheduleTable _idTable(_$AppDatabase db) =>
      db.baseSchedule.createAlias(
          $_aliasNameGenerator(db.mealSchedule.id, db.baseSchedule.id));

  $$BaseScheduleTableProcessedTableManager get id {
    final $_column = $_itemColumn<int>('id')!;

    final manager = $$BaseScheduleTableTableManager($_db, $_db.baseSchedule)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$MealScheduleTableFilterComposer
    extends Composer<_$AppDatabase, $MealScheduleTable> {
  $$MealScheduleTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get mealType => $composableBuilder(
      column: $table.mealType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cuisine => $composableBuilder(
      column: $table.cuisine, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get restaurantName => $composableBuilder(
      column: $table.restaurantName,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dietType => $composableBuilder(
      column: $table.dietType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get menuItems => $composableBuilder(
      column: $table.menuItems, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get numberOfPeople => $composableBuilder(
      column: $table.numberOfPeople,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get estimatedCost => $composableBuilder(
      column: $table.estimatedCost, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDelivery => $composableBuilder(
      column: $table.isDelivery, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get specialRequests => $composableBuilder(
      column: $table.specialRequests,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  $$BaseScheduleTableFilterComposer get id {
    final $$BaseScheduleTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.baseSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BaseScheduleTableFilterComposer(
              $db: $db,
              $table: $db.baseSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MealScheduleTableOrderingComposer
    extends Composer<_$AppDatabase, $MealScheduleTable> {
  $$MealScheduleTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get mealType => $composableBuilder(
      column: $table.mealType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cuisine => $composableBuilder(
      column: $table.cuisine, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get restaurantName => $composableBuilder(
      column: $table.restaurantName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dietType => $composableBuilder(
      column: $table.dietType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get menuItems => $composableBuilder(
      column: $table.menuItems, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get numberOfPeople => $composableBuilder(
      column: $table.numberOfPeople,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get estimatedCost => $composableBuilder(
      column: $table.estimatedCost,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDelivery => $composableBuilder(
      column: $table.isDelivery, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get specialRequests => $composableBuilder(
      column: $table.specialRequests,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  $$BaseScheduleTableOrderingComposer get id {
    final $$BaseScheduleTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.baseSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BaseScheduleTableOrderingComposer(
              $db: $db,
              $table: $db.baseSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MealScheduleTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealScheduleTable> {
  $$MealScheduleTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get mealType =>
      $composableBuilder(column: $table.mealType, builder: (column) => column);

  GeneratedColumn<String> get cuisine =>
      $composableBuilder(column: $table.cuisine, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get restaurantName => $composableBuilder(
      column: $table.restaurantName, builder: (column) => column);

  GeneratedColumn<String> get dietType =>
      $composableBuilder(column: $table.dietType, builder: (column) => column);

  GeneratedColumn<String> get menuItems =>
      $composableBuilder(column: $table.menuItems, builder: (column) => column);

  GeneratedColumn<int> get numberOfPeople => $composableBuilder(
      column: $table.numberOfPeople, builder: (column) => column);

  GeneratedColumn<double> get estimatedCost => $composableBuilder(
      column: $table.estimatedCost, builder: (column) => column);

  GeneratedColumn<bool> get isDelivery => $composableBuilder(
      column: $table.isDelivery, builder: (column) => column);

  GeneratedColumn<String> get specialRequests => $composableBuilder(
      column: $table.specialRequests, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$BaseScheduleTableAnnotationComposer get id {
    final $$BaseScheduleTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.baseSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BaseScheduleTableAnnotationComposer(
              $db: $db,
              $table: $db.baseSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MealScheduleTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MealScheduleTable,
    MealScheduleData,
    $$MealScheduleTableFilterComposer,
    $$MealScheduleTableOrderingComposer,
    $$MealScheduleTableAnnotationComposer,
    $$MealScheduleTableCreateCompanionBuilder,
    $$MealScheduleTableUpdateCompanionBuilder,
    (MealScheduleData, $$MealScheduleTableReferences),
    MealScheduleData,
    PrefetchHooks Function({bool id})> {
  $$MealScheduleTableTableManager(_$AppDatabase db, $MealScheduleTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealScheduleTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MealScheduleTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MealScheduleTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> mealType = const Value.absent(),
            Value<String?> cuisine = const Value.absent(),
            Value<String?> location = const Value.absent(),
            Value<String?> restaurantName = const Value.absent(),
            Value<String?> dietType = const Value.absent(),
            Value<String?> menuItems = const Value.absent(),
            Value<int> numberOfPeople = const Value.absent(),
            Value<double?> estimatedCost = const Value.absent(),
            Value<bool> isDelivery = const Value.absent(),
            Value<String?> specialRequests = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MealScheduleCompanion(
            id: id,
            mealType: mealType,
            cuisine: cuisine,
            location: location,
            restaurantName: restaurantName,
            dietType: dietType,
            menuItems: menuItems,
            numberOfPeople: numberOfPeople,
            estimatedCost: estimatedCost,
            isDelivery: isDelivery,
            specialRequests: specialRequests,
            notes: notes,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required String mealType,
            Value<String?> cuisine = const Value.absent(),
            Value<String?> location = const Value.absent(),
            Value<String?> restaurantName = const Value.absent(),
            Value<String?> dietType = const Value.absent(),
            Value<String?> menuItems = const Value.absent(),
            Value<int> numberOfPeople = const Value.absent(),
            Value<double?> estimatedCost = const Value.absent(),
            Value<bool> isDelivery = const Value.absent(),
            Value<String?> specialRequests = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MealScheduleCompanion.insert(
            id: id,
            mealType: mealType,
            cuisine: cuisine,
            location: location,
            restaurantName: restaurantName,
            dietType: dietType,
            menuItems: menuItems,
            numberOfPeople: numberOfPeople,
            estimatedCost: estimatedCost,
            isDelivery: isDelivery,
            specialRequests: specialRequests,
            notes: notes,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MealScheduleTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({id = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (id) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.id,
                    referencedTable: $$MealScheduleTableReferences._idTable(db),
                    referencedColumn:
                        $$MealScheduleTableReferences._idTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$MealScheduleTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MealScheduleTable,
    MealScheduleData,
    $$MealScheduleTableFilterComposer,
    $$MealScheduleTableOrderingComposer,
    $$MealScheduleTableAnnotationComposer,
    $$MealScheduleTableCreateCompanionBuilder,
    $$MealScheduleTableUpdateCompanionBuilder,
    (MealScheduleData, $$MealScheduleTableReferences),
    MealScheduleData,
    PrefetchHooks Function({bool id})>;
typedef $$MeetingScheduleTableCreateCompanionBuilder = MeetingScheduleCompanion
    Function({
  required int id,
  required String location,
  required String attendees,
  required String organizer,
  Value<String?> agenda,
  required String meetingType,
  Value<bool> isVirtual,
  Value<String?> platform,
  Value<String?> link,
  Value<String?> notes,
  Value<String?> attachments,
  Value<int> rowid,
});
typedef $$MeetingScheduleTableUpdateCompanionBuilder = MeetingScheduleCompanion
    Function({
  Value<int> id,
  Value<String> location,
  Value<String> attendees,
  Value<String> organizer,
  Value<String?> agenda,
  Value<String> meetingType,
  Value<bool> isVirtual,
  Value<String?> platform,
  Value<String?> link,
  Value<String?> notes,
  Value<String?> attachments,
  Value<int> rowid,
});

final class $$MeetingScheduleTableReferences extends BaseReferences<
    _$AppDatabase, $MeetingScheduleTable, MeetingScheduleData> {
  $$MeetingScheduleTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $BaseScheduleTable _idTable(_$AppDatabase db) =>
      db.baseSchedule.createAlias(
          $_aliasNameGenerator(db.meetingSchedule.id, db.baseSchedule.id));

  $$BaseScheduleTableProcessedTableManager get id {
    final $_column = $_itemColumn<int>('id')!;

    final manager = $$BaseScheduleTableTableManager($_db, $_db.baseSchedule)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$MeetingScheduleTableFilterComposer
    extends Composer<_$AppDatabase, $MeetingScheduleTable> {
  $$MeetingScheduleTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get attendees => $composableBuilder(
      column: $table.attendees, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get organizer => $composableBuilder(
      column: $table.organizer, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get agenda => $composableBuilder(
      column: $table.agenda, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get meetingType => $composableBuilder(
      column: $table.meetingType, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isVirtual => $composableBuilder(
      column: $table.isVirtual, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get platform => $composableBuilder(
      column: $table.platform, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get link => $composableBuilder(
      column: $table.link, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get attachments => $composableBuilder(
      column: $table.attachments, builder: (column) => ColumnFilters(column));

  $$BaseScheduleTableFilterComposer get id {
    final $$BaseScheduleTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.baseSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BaseScheduleTableFilterComposer(
              $db: $db,
              $table: $db.baseSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MeetingScheduleTableOrderingComposer
    extends Composer<_$AppDatabase, $MeetingScheduleTable> {
  $$MeetingScheduleTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get attendees => $composableBuilder(
      column: $table.attendees, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get organizer => $composableBuilder(
      column: $table.organizer, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get agenda => $composableBuilder(
      column: $table.agenda, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get meetingType => $composableBuilder(
      column: $table.meetingType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isVirtual => $composableBuilder(
      column: $table.isVirtual, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get platform => $composableBuilder(
      column: $table.platform, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get link => $composableBuilder(
      column: $table.link, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get attachments => $composableBuilder(
      column: $table.attachments, builder: (column) => ColumnOrderings(column));

  $$BaseScheduleTableOrderingComposer get id {
    final $$BaseScheduleTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.baseSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BaseScheduleTableOrderingComposer(
              $db: $db,
              $table: $db.baseSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MeetingScheduleTableAnnotationComposer
    extends Composer<_$AppDatabase, $MeetingScheduleTable> {
  $$MeetingScheduleTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get attendees =>
      $composableBuilder(column: $table.attendees, builder: (column) => column);

  GeneratedColumn<String> get organizer =>
      $composableBuilder(column: $table.organizer, builder: (column) => column);

  GeneratedColumn<String> get agenda =>
      $composableBuilder(column: $table.agenda, builder: (column) => column);

  GeneratedColumn<String> get meetingType => $composableBuilder(
      column: $table.meetingType, builder: (column) => column);

  GeneratedColumn<bool> get isVirtual =>
      $composableBuilder(column: $table.isVirtual, builder: (column) => column);

  GeneratedColumn<String> get platform =>
      $composableBuilder(column: $table.platform, builder: (column) => column);

  GeneratedColumn<String> get link =>
      $composableBuilder(column: $table.link, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get attachments => $composableBuilder(
      column: $table.attachments, builder: (column) => column);

  $$BaseScheduleTableAnnotationComposer get id {
    final $$BaseScheduleTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.baseSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BaseScheduleTableAnnotationComposer(
              $db: $db,
              $table: $db.baseSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MeetingScheduleTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MeetingScheduleTable,
    MeetingScheduleData,
    $$MeetingScheduleTableFilterComposer,
    $$MeetingScheduleTableOrderingComposer,
    $$MeetingScheduleTableAnnotationComposer,
    $$MeetingScheduleTableCreateCompanionBuilder,
    $$MeetingScheduleTableUpdateCompanionBuilder,
    (MeetingScheduleData, $$MeetingScheduleTableReferences),
    MeetingScheduleData,
    PrefetchHooks Function({bool id})> {
  $$MeetingScheduleTableTableManager(
      _$AppDatabase db, $MeetingScheduleTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MeetingScheduleTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MeetingScheduleTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MeetingScheduleTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> location = const Value.absent(),
            Value<String> attendees = const Value.absent(),
            Value<String> organizer = const Value.absent(),
            Value<String?> agenda = const Value.absent(),
            Value<String> meetingType = const Value.absent(),
            Value<bool> isVirtual = const Value.absent(),
            Value<String?> platform = const Value.absent(),
            Value<String?> link = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String?> attachments = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MeetingScheduleCompanion(
            id: id,
            location: location,
            attendees: attendees,
            organizer: organizer,
            agenda: agenda,
            meetingType: meetingType,
            isVirtual: isVirtual,
            platform: platform,
            link: link,
            notes: notes,
            attachments: attachments,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required String location,
            required String attendees,
            required String organizer,
            Value<String?> agenda = const Value.absent(),
            required String meetingType,
            Value<bool> isVirtual = const Value.absent(),
            Value<String?> platform = const Value.absent(),
            Value<String?> link = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String?> attachments = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MeetingScheduleCompanion.insert(
            id: id,
            location: location,
            attendees: attendees,
            organizer: organizer,
            agenda: agenda,
            meetingType: meetingType,
            isVirtual: isVirtual,
            platform: platform,
            link: link,
            notes: notes,
            attachments: attachments,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MeetingScheduleTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({id = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (id) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.id,
                    referencedTable:
                        $$MeetingScheduleTableReferences._idTable(db),
                    referencedColumn:
                        $$MeetingScheduleTableReferences._idTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$MeetingScheduleTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MeetingScheduleTable,
    MeetingScheduleData,
    $$MeetingScheduleTableFilterComposer,
    $$MeetingScheduleTableOrderingComposer,
    $$MeetingScheduleTableAnnotationComposer,
    $$MeetingScheduleTableCreateCompanionBuilder,
    $$MeetingScheduleTableUpdateCompanionBuilder,
    (MeetingScheduleData, $$MeetingScheduleTableReferences),
    MeetingScheduleData,
    PrefetchHooks Function({bool id})>;
typedef $$PersonalScheduleTableCreateCompanionBuilder
    = PersonalScheduleCompanion Function({
  required int id,
  required String personalType,
  required String providerName,
  Value<String?> location,
  Value<String?> contactPhone,
  Value<String?> confirmationNumber,
  Value<double?> estimatedCost,
  Value<String?> specialInstructions,
  Value<bool> requiresPreparation,
  Value<String?> preparationNotes,
  Value<String?> notes,
  Value<int> rowid,
});
typedef $$PersonalScheduleTableUpdateCompanionBuilder
    = PersonalScheduleCompanion Function({
  Value<int> id,
  Value<String> personalType,
  Value<String> providerName,
  Value<String?> location,
  Value<String?> contactPhone,
  Value<String?> confirmationNumber,
  Value<double?> estimatedCost,
  Value<String?> specialInstructions,
  Value<bool> requiresPreparation,
  Value<String?> preparationNotes,
  Value<String?> notes,
  Value<int> rowid,
});

final class $$PersonalScheduleTableReferences extends BaseReferences<
    _$AppDatabase, $PersonalScheduleTable, PersonalScheduleData> {
  $$PersonalScheduleTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $BaseScheduleTable _idTable(_$AppDatabase db) =>
      db.baseSchedule.createAlias(
          $_aliasNameGenerator(db.personalSchedule.id, db.baseSchedule.id));

  $$BaseScheduleTableProcessedTableManager get id {
    final $_column = $_itemColumn<int>('id')!;

    final manager = $$BaseScheduleTableTableManager($_db, $_db.baseSchedule)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PersonalScheduleTableFilterComposer
    extends Composer<_$AppDatabase, $PersonalScheduleTable> {
  $$PersonalScheduleTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get personalType => $composableBuilder(
      column: $table.personalType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get providerName => $composableBuilder(
      column: $table.providerName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contactPhone => $composableBuilder(
      column: $table.contactPhone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get confirmationNumber => $composableBuilder(
      column: $table.confirmationNumber,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get estimatedCost => $composableBuilder(
      column: $table.estimatedCost, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get specialInstructions => $composableBuilder(
      column: $table.specialInstructions,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get requiresPreparation => $composableBuilder(
      column: $table.requiresPreparation,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get preparationNotes => $composableBuilder(
      column: $table.preparationNotes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  $$BaseScheduleTableFilterComposer get id {
    final $$BaseScheduleTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.baseSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BaseScheduleTableFilterComposer(
              $db: $db,
              $table: $db.baseSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PersonalScheduleTableOrderingComposer
    extends Composer<_$AppDatabase, $PersonalScheduleTable> {
  $$PersonalScheduleTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get personalType => $composableBuilder(
      column: $table.personalType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get providerName => $composableBuilder(
      column: $table.providerName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contactPhone => $composableBuilder(
      column: $table.contactPhone,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get confirmationNumber => $composableBuilder(
      column: $table.confirmationNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get estimatedCost => $composableBuilder(
      column: $table.estimatedCost,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get specialInstructions => $composableBuilder(
      column: $table.specialInstructions,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get requiresPreparation => $composableBuilder(
      column: $table.requiresPreparation,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get preparationNotes => $composableBuilder(
      column: $table.preparationNotes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  $$BaseScheduleTableOrderingComposer get id {
    final $$BaseScheduleTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.baseSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BaseScheduleTableOrderingComposer(
              $db: $db,
              $table: $db.baseSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PersonalScheduleTableAnnotationComposer
    extends Composer<_$AppDatabase, $PersonalScheduleTable> {
  $$PersonalScheduleTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get personalType => $composableBuilder(
      column: $table.personalType, builder: (column) => column);

  GeneratedColumn<String> get providerName => $composableBuilder(
      column: $table.providerName, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get contactPhone => $composableBuilder(
      column: $table.contactPhone, builder: (column) => column);

  GeneratedColumn<String> get confirmationNumber => $composableBuilder(
      column: $table.confirmationNumber, builder: (column) => column);

  GeneratedColumn<double> get estimatedCost => $composableBuilder(
      column: $table.estimatedCost, builder: (column) => column);

  GeneratedColumn<String> get specialInstructions => $composableBuilder(
      column: $table.specialInstructions, builder: (column) => column);

  GeneratedColumn<bool> get requiresPreparation => $composableBuilder(
      column: $table.requiresPreparation, builder: (column) => column);

  GeneratedColumn<String> get preparationNotes => $composableBuilder(
      column: $table.preparationNotes, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$BaseScheduleTableAnnotationComposer get id {
    final $$BaseScheduleTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.baseSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BaseScheduleTableAnnotationComposer(
              $db: $db,
              $table: $db.baseSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PersonalScheduleTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PersonalScheduleTable,
    PersonalScheduleData,
    $$PersonalScheduleTableFilterComposer,
    $$PersonalScheduleTableOrderingComposer,
    $$PersonalScheduleTableAnnotationComposer,
    $$PersonalScheduleTableCreateCompanionBuilder,
    $$PersonalScheduleTableUpdateCompanionBuilder,
    (PersonalScheduleData, $$PersonalScheduleTableReferences),
    PersonalScheduleData,
    PrefetchHooks Function({bool id})> {
  $$PersonalScheduleTableTableManager(
      _$AppDatabase db, $PersonalScheduleTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PersonalScheduleTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PersonalScheduleTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PersonalScheduleTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> personalType = const Value.absent(),
            Value<String> providerName = const Value.absent(),
            Value<String?> location = const Value.absent(),
            Value<String?> contactPhone = const Value.absent(),
            Value<String?> confirmationNumber = const Value.absent(),
            Value<double?> estimatedCost = const Value.absent(),
            Value<String?> specialInstructions = const Value.absent(),
            Value<bool> requiresPreparation = const Value.absent(),
            Value<String?> preparationNotes = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PersonalScheduleCompanion(
            id: id,
            personalType: personalType,
            providerName: providerName,
            location: location,
            contactPhone: contactPhone,
            confirmationNumber: confirmationNumber,
            estimatedCost: estimatedCost,
            specialInstructions: specialInstructions,
            requiresPreparation: requiresPreparation,
            preparationNotes: preparationNotes,
            notes: notes,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required String personalType,
            required String providerName,
            Value<String?> location = const Value.absent(),
            Value<String?> contactPhone = const Value.absent(),
            Value<String?> confirmationNumber = const Value.absent(),
            Value<double?> estimatedCost = const Value.absent(),
            Value<String?> specialInstructions = const Value.absent(),
            Value<bool> requiresPreparation = const Value.absent(),
            Value<String?> preparationNotes = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PersonalScheduleCompanion.insert(
            id: id,
            personalType: personalType,
            providerName: providerName,
            location: location,
            contactPhone: contactPhone,
            confirmationNumber: confirmationNumber,
            estimatedCost: estimatedCost,
            specialInstructions: specialInstructions,
            requiresPreparation: requiresPreparation,
            preparationNotes: preparationNotes,
            notes: notes,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PersonalScheduleTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({id = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (id) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.id,
                    referencedTable:
                        $$PersonalScheduleTableReferences._idTable(db),
                    referencedColumn:
                        $$PersonalScheduleTableReferences._idTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$PersonalScheduleTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PersonalScheduleTable,
    PersonalScheduleData,
    $$PersonalScheduleTableFilterComposer,
    $$PersonalScheduleTableOrderingComposer,
    $$PersonalScheduleTableAnnotationComposer,
    $$PersonalScheduleTableCreateCompanionBuilder,
    $$PersonalScheduleTableUpdateCompanionBuilder,
    (PersonalScheduleData, $$PersonalScheduleTableReferences),
    PersonalScheduleData,
    PrefetchHooks Function({bool id})>;
typedef $$ShoppingScheduleTableCreateCompanionBuilder
    = ShoppingScheduleCompanion Function({
  required int id,
  Value<bool> isOnline,
  required String storeName,
  required String storeType,
  Value<String?> location,
  Value<String?> itemIds,
  Value<String?> itemQuantities,
  Value<String?> itemNotes,
  Value<double?> budget,
  Value<String> priority,
  Value<String?> notes,
  Value<int> rowid,
});
typedef $$ShoppingScheduleTableUpdateCompanionBuilder
    = ShoppingScheduleCompanion Function({
  Value<int> id,
  Value<bool> isOnline,
  Value<String> storeName,
  Value<String> storeType,
  Value<String?> location,
  Value<String?> itemIds,
  Value<String?> itemQuantities,
  Value<String?> itemNotes,
  Value<double?> budget,
  Value<String> priority,
  Value<String?> notes,
  Value<int> rowid,
});

final class $$ShoppingScheduleTableReferences extends BaseReferences<
    _$AppDatabase, $ShoppingScheduleTable, ShoppingScheduleData> {
  $$ShoppingScheduleTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $BaseScheduleTable _idTable(_$AppDatabase db) =>
      db.baseSchedule.createAlias(
          $_aliasNameGenerator(db.shoppingSchedule.id, db.baseSchedule.id));

  $$BaseScheduleTableProcessedTableManager get id {
    final $_column = $_itemColumn<int>('id')!;

    final manager = $$BaseScheduleTableTableManager($_db, $_db.baseSchedule)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ShoppingScheduleTableFilterComposer
    extends Composer<_$AppDatabase, $ShoppingScheduleTable> {
  $$ShoppingScheduleTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<bool> get isOnline => $composableBuilder(
      column: $table.isOnline, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get storeName => $composableBuilder(
      column: $table.storeName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get storeType => $composableBuilder(
      column: $table.storeType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get itemIds => $composableBuilder(
      column: $table.itemIds, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get itemQuantities => $composableBuilder(
      column: $table.itemQuantities,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get itemNotes => $composableBuilder(
      column: $table.itemNotes, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get budget => $composableBuilder(
      column: $table.budget, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  $$BaseScheduleTableFilterComposer get id {
    final $$BaseScheduleTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.baseSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BaseScheduleTableFilterComposer(
              $db: $db,
              $table: $db.baseSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ShoppingScheduleTableOrderingComposer
    extends Composer<_$AppDatabase, $ShoppingScheduleTable> {
  $$ShoppingScheduleTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<bool> get isOnline => $composableBuilder(
      column: $table.isOnline, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get storeName => $composableBuilder(
      column: $table.storeName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get storeType => $composableBuilder(
      column: $table.storeType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get itemIds => $composableBuilder(
      column: $table.itemIds, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get itemQuantities => $composableBuilder(
      column: $table.itemQuantities,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get itemNotes => $composableBuilder(
      column: $table.itemNotes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get budget => $composableBuilder(
      column: $table.budget, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  $$BaseScheduleTableOrderingComposer get id {
    final $$BaseScheduleTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.baseSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BaseScheduleTableOrderingComposer(
              $db: $db,
              $table: $db.baseSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ShoppingScheduleTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShoppingScheduleTable> {
  $$ShoppingScheduleTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<bool> get isOnline =>
      $composableBuilder(column: $table.isOnline, builder: (column) => column);

  GeneratedColumn<String> get storeName =>
      $composableBuilder(column: $table.storeName, builder: (column) => column);

  GeneratedColumn<String> get storeType =>
      $composableBuilder(column: $table.storeType, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get itemIds =>
      $composableBuilder(column: $table.itemIds, builder: (column) => column);

  GeneratedColumn<String> get itemQuantities => $composableBuilder(
      column: $table.itemQuantities, builder: (column) => column);

  GeneratedColumn<String> get itemNotes =>
      $composableBuilder(column: $table.itemNotes, builder: (column) => column);

  GeneratedColumn<double> get budget =>
      $composableBuilder(column: $table.budget, builder: (column) => column);

  GeneratedColumn<String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$BaseScheduleTableAnnotationComposer get id {
    final $$BaseScheduleTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.baseSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BaseScheduleTableAnnotationComposer(
              $db: $db,
              $table: $db.baseSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ShoppingScheduleTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ShoppingScheduleTable,
    ShoppingScheduleData,
    $$ShoppingScheduleTableFilterComposer,
    $$ShoppingScheduleTableOrderingComposer,
    $$ShoppingScheduleTableAnnotationComposer,
    $$ShoppingScheduleTableCreateCompanionBuilder,
    $$ShoppingScheduleTableUpdateCompanionBuilder,
    (ShoppingScheduleData, $$ShoppingScheduleTableReferences),
    ShoppingScheduleData,
    PrefetchHooks Function({bool id})> {
  $$ShoppingScheduleTableTableManager(
      _$AppDatabase db, $ShoppingScheduleTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShoppingScheduleTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShoppingScheduleTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShoppingScheduleTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> isOnline = const Value.absent(),
            Value<String> storeName = const Value.absent(),
            Value<String> storeType = const Value.absent(),
            Value<String?> location = const Value.absent(),
            Value<String?> itemIds = const Value.absent(),
            Value<String?> itemQuantities = const Value.absent(),
            Value<String?> itemNotes = const Value.absent(),
            Value<double?> budget = const Value.absent(),
            Value<String> priority = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ShoppingScheduleCompanion(
            id: id,
            isOnline: isOnline,
            storeName: storeName,
            storeType: storeType,
            location: location,
            itemIds: itemIds,
            itemQuantities: itemQuantities,
            itemNotes: itemNotes,
            budget: budget,
            priority: priority,
            notes: notes,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            Value<bool> isOnline = const Value.absent(),
            required String storeName,
            required String storeType,
            Value<String?> location = const Value.absent(),
            Value<String?> itemIds = const Value.absent(),
            Value<String?> itemQuantities = const Value.absent(),
            Value<String?> itemNotes = const Value.absent(),
            Value<double?> budget = const Value.absent(),
            Value<String> priority = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ShoppingScheduleCompanion.insert(
            id: id,
            isOnline: isOnline,
            storeName: storeName,
            storeType: storeType,
            location: location,
            itemIds: itemIds,
            itemQuantities: itemQuantities,
            itemNotes: itemNotes,
            budget: budget,
            priority: priority,
            notes: notes,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ShoppingScheduleTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({id = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (id) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.id,
                    referencedTable:
                        $$ShoppingScheduleTableReferences._idTable(db),
                    referencedColumn:
                        $$ShoppingScheduleTableReferences._idTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ShoppingScheduleTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ShoppingScheduleTable,
    ShoppingScheduleData,
    $$ShoppingScheduleTableFilterComposer,
    $$ShoppingScheduleTableOrderingComposer,
    $$ShoppingScheduleTableAnnotationComposer,
    $$ShoppingScheduleTableCreateCompanionBuilder,
    $$ShoppingScheduleTableUpdateCompanionBuilder,
    (ShoppingScheduleData, $$ShoppingScheduleTableReferences),
    ShoppingScheduleData,
    PrefetchHooks Function({bool id})>;
typedef $$TravelScheduleTableCreateCompanionBuilder = TravelScheduleCompanion
    Function({
  required int id,
  required String destination,
  required String travelType,
  Value<String?> departureLocation,
  Value<DateTime?> departureTime,
  Value<DateTime?> arrivalTime,
  Value<String?> transportationNumber,
  Value<String?> seatNumber,
  Value<String?> bookingReference,
  Value<double?> cost,
  Value<String?> luggageInfo,
  Value<String?> notes,
  Value<int> rowid,
});
typedef $$TravelScheduleTableUpdateCompanionBuilder = TravelScheduleCompanion
    Function({
  Value<int> id,
  Value<String> destination,
  Value<String> travelType,
  Value<String?> departureLocation,
  Value<DateTime?> departureTime,
  Value<DateTime?> arrivalTime,
  Value<String?> transportationNumber,
  Value<String?> seatNumber,
  Value<String?> bookingReference,
  Value<double?> cost,
  Value<String?> luggageInfo,
  Value<String?> notes,
  Value<int> rowid,
});

final class $$TravelScheduleTableReferences extends BaseReferences<
    _$AppDatabase, $TravelScheduleTable, TravelScheduleData> {
  $$TravelScheduleTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $BaseScheduleTable _idTable(_$AppDatabase db) =>
      db.baseSchedule.createAlias(
          $_aliasNameGenerator(db.travelSchedule.id, db.baseSchedule.id));

  $$BaseScheduleTableProcessedTableManager get id {
    final $_column = $_itemColumn<int>('id')!;

    final manager = $$BaseScheduleTableTableManager($_db, $_db.baseSchedule)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TravelScheduleTableFilterComposer
    extends Composer<_$AppDatabase, $TravelScheduleTable> {
  $$TravelScheduleTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get destination => $composableBuilder(
      column: $table.destination, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get travelType => $composableBuilder(
      column: $table.travelType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get departureLocation => $composableBuilder(
      column: $table.departureLocation,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get departureTime => $composableBuilder(
      column: $table.departureTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get arrivalTime => $composableBuilder(
      column: $table.arrivalTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get transportationNumber => $composableBuilder(
      column: $table.transportationNumber,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get seatNumber => $composableBuilder(
      column: $table.seatNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bookingReference => $composableBuilder(
      column: $table.bookingReference,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get cost => $composableBuilder(
      column: $table.cost, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get luggageInfo => $composableBuilder(
      column: $table.luggageInfo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  $$BaseScheduleTableFilterComposer get id {
    final $$BaseScheduleTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.baseSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BaseScheduleTableFilterComposer(
              $db: $db,
              $table: $db.baseSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TravelScheduleTableOrderingComposer
    extends Composer<_$AppDatabase, $TravelScheduleTable> {
  $$TravelScheduleTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get destination => $composableBuilder(
      column: $table.destination, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get travelType => $composableBuilder(
      column: $table.travelType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get departureLocation => $composableBuilder(
      column: $table.departureLocation,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get departureTime => $composableBuilder(
      column: $table.departureTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get arrivalTime => $composableBuilder(
      column: $table.arrivalTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get transportationNumber => $composableBuilder(
      column: $table.transportationNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get seatNumber => $composableBuilder(
      column: $table.seatNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bookingReference => $composableBuilder(
      column: $table.bookingReference,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get cost => $composableBuilder(
      column: $table.cost, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get luggageInfo => $composableBuilder(
      column: $table.luggageInfo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  $$BaseScheduleTableOrderingComposer get id {
    final $$BaseScheduleTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.baseSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BaseScheduleTableOrderingComposer(
              $db: $db,
              $table: $db.baseSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TravelScheduleTableAnnotationComposer
    extends Composer<_$AppDatabase, $TravelScheduleTable> {
  $$TravelScheduleTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get destination => $composableBuilder(
      column: $table.destination, builder: (column) => column);

  GeneratedColumn<String> get travelType => $composableBuilder(
      column: $table.travelType, builder: (column) => column);

  GeneratedColumn<String> get departureLocation => $composableBuilder(
      column: $table.departureLocation, builder: (column) => column);

  GeneratedColumn<DateTime> get departureTime => $composableBuilder(
      column: $table.departureTime, builder: (column) => column);

  GeneratedColumn<DateTime> get arrivalTime => $composableBuilder(
      column: $table.arrivalTime, builder: (column) => column);

  GeneratedColumn<String> get transportationNumber => $composableBuilder(
      column: $table.transportationNumber, builder: (column) => column);

  GeneratedColumn<String> get seatNumber => $composableBuilder(
      column: $table.seatNumber, builder: (column) => column);

  GeneratedColumn<String> get bookingReference => $composableBuilder(
      column: $table.bookingReference, builder: (column) => column);

  GeneratedColumn<double> get cost =>
      $composableBuilder(column: $table.cost, builder: (column) => column);

  GeneratedColumn<String> get luggageInfo => $composableBuilder(
      column: $table.luggageInfo, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$BaseScheduleTableAnnotationComposer get id {
    final $$BaseScheduleTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.baseSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BaseScheduleTableAnnotationComposer(
              $db: $db,
              $table: $db.baseSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TravelScheduleTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TravelScheduleTable,
    TravelScheduleData,
    $$TravelScheduleTableFilterComposer,
    $$TravelScheduleTableOrderingComposer,
    $$TravelScheduleTableAnnotationComposer,
    $$TravelScheduleTableCreateCompanionBuilder,
    $$TravelScheduleTableUpdateCompanionBuilder,
    (TravelScheduleData, $$TravelScheduleTableReferences),
    TravelScheduleData,
    PrefetchHooks Function({bool id})> {
  $$TravelScheduleTableTableManager(
      _$AppDatabase db, $TravelScheduleTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TravelScheduleTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TravelScheduleTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TravelScheduleTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> destination = const Value.absent(),
            Value<String> travelType = const Value.absent(),
            Value<String?> departureLocation = const Value.absent(),
            Value<DateTime?> departureTime = const Value.absent(),
            Value<DateTime?> arrivalTime = const Value.absent(),
            Value<String?> transportationNumber = const Value.absent(),
            Value<String?> seatNumber = const Value.absent(),
            Value<String?> bookingReference = const Value.absent(),
            Value<double?> cost = const Value.absent(),
            Value<String?> luggageInfo = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TravelScheduleCompanion(
            id: id,
            destination: destination,
            travelType: travelType,
            departureLocation: departureLocation,
            departureTime: departureTime,
            arrivalTime: arrivalTime,
            transportationNumber: transportationNumber,
            seatNumber: seatNumber,
            bookingReference: bookingReference,
            cost: cost,
            luggageInfo: luggageInfo,
            notes: notes,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required String destination,
            required String travelType,
            Value<String?> departureLocation = const Value.absent(),
            Value<DateTime?> departureTime = const Value.absent(),
            Value<DateTime?> arrivalTime = const Value.absent(),
            Value<String?> transportationNumber = const Value.absent(),
            Value<String?> seatNumber = const Value.absent(),
            Value<String?> bookingReference = const Value.absent(),
            Value<double?> cost = const Value.absent(),
            Value<String?> luggageInfo = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TravelScheduleCompanion.insert(
            id: id,
            destination: destination,
            travelType: travelType,
            departureLocation: departureLocation,
            departureTime: departureTime,
            arrivalTime: arrivalTime,
            transportationNumber: transportationNumber,
            seatNumber: seatNumber,
            bookingReference: bookingReference,
            cost: cost,
            luggageInfo: luggageInfo,
            notes: notes,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TravelScheduleTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({id = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (id) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.id,
                    referencedTable:
                        $$TravelScheduleTableReferences._idTable(db),
                    referencedColumn:
                        $$TravelScheduleTableReferences._idTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TravelScheduleTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TravelScheduleTable,
    TravelScheduleData,
    $$TravelScheduleTableFilterComposer,
    $$TravelScheduleTableOrderingComposer,
    $$TravelScheduleTableAnnotationComposer,
    $$TravelScheduleTableCreateCompanionBuilder,
    $$TravelScheduleTableUpdateCompanionBuilder,
    (TravelScheduleData, $$TravelScheduleTableReferences),
    TravelScheduleData,
    PrefetchHooks Function({bool id})>;
typedef $$WorkoutScheduleTableCreateCompanionBuilder = WorkoutScheduleCompanion
    Function({
  required int id,
  required String workoutType,
  required String locationType,
  required double durationMinutes,
  required String intensity,
  Value<String?> exercises,
  Value<double?> distanceKm,
  Value<double?> caloriesBurned,
  Value<String?> equipment,
  Value<String?> notes,
  Value<int> rowid,
});
typedef $$WorkoutScheduleTableUpdateCompanionBuilder = WorkoutScheduleCompanion
    Function({
  Value<int> id,
  Value<String> workoutType,
  Value<String> locationType,
  Value<double> durationMinutes,
  Value<String> intensity,
  Value<String?> exercises,
  Value<double?> distanceKm,
  Value<double?> caloriesBurned,
  Value<String?> equipment,
  Value<String?> notes,
  Value<int> rowid,
});

final class $$WorkoutScheduleTableReferences extends BaseReferences<
    _$AppDatabase, $WorkoutScheduleTable, WorkoutScheduleData> {
  $$WorkoutScheduleTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $BaseScheduleTable _idTable(_$AppDatabase db) =>
      db.baseSchedule.createAlias(
          $_aliasNameGenerator(db.workoutSchedule.id, db.baseSchedule.id));

  $$BaseScheduleTableProcessedTableManager get id {
    final $_column = $_itemColumn<int>('id')!;

    final manager = $$BaseScheduleTableTableManager($_db, $_db.baseSchedule)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$WorkoutScheduleTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutScheduleTable> {
  $$WorkoutScheduleTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get workoutType => $composableBuilder(
      column: $table.workoutType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get locationType => $composableBuilder(
      column: $table.locationType, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get intensity => $composableBuilder(
      column: $table.intensity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get exercises => $composableBuilder(
      column: $table.exercises, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get distanceKm => $composableBuilder(
      column: $table.distanceKm, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get caloriesBurned => $composableBuilder(
      column: $table.caloriesBurned,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get equipment => $composableBuilder(
      column: $table.equipment, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  $$BaseScheduleTableFilterComposer get id {
    final $$BaseScheduleTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.baseSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BaseScheduleTableFilterComposer(
              $db: $db,
              $table: $db.baseSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WorkoutScheduleTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutScheduleTable> {
  $$WorkoutScheduleTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get workoutType => $composableBuilder(
      column: $table.workoutType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get locationType => $composableBuilder(
      column: $table.locationType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get intensity => $composableBuilder(
      column: $table.intensity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get exercises => $composableBuilder(
      column: $table.exercises, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get distanceKm => $composableBuilder(
      column: $table.distanceKm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get caloriesBurned => $composableBuilder(
      column: $table.caloriesBurned,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get equipment => $composableBuilder(
      column: $table.equipment, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  $$BaseScheduleTableOrderingComposer get id {
    final $$BaseScheduleTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.baseSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BaseScheduleTableOrderingComposer(
              $db: $db,
              $table: $db.baseSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WorkoutScheduleTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutScheduleTable> {
  $$WorkoutScheduleTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get workoutType => $composableBuilder(
      column: $table.workoutType, builder: (column) => column);

  GeneratedColumn<String> get locationType => $composableBuilder(
      column: $table.locationType, builder: (column) => column);

  GeneratedColumn<double> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes, builder: (column) => column);

  GeneratedColumn<String> get intensity =>
      $composableBuilder(column: $table.intensity, builder: (column) => column);

  GeneratedColumn<String> get exercises =>
      $composableBuilder(column: $table.exercises, builder: (column) => column);

  GeneratedColumn<double> get distanceKm => $composableBuilder(
      column: $table.distanceKm, builder: (column) => column);

  GeneratedColumn<double> get caloriesBurned => $composableBuilder(
      column: $table.caloriesBurned, builder: (column) => column);

  GeneratedColumn<String> get equipment =>
      $composableBuilder(column: $table.equipment, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$BaseScheduleTableAnnotationComposer get id {
    final $$BaseScheduleTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.baseSchedule,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BaseScheduleTableAnnotationComposer(
              $db: $db,
              $table: $db.baseSchedule,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WorkoutScheduleTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkoutScheduleTable,
    WorkoutScheduleData,
    $$WorkoutScheduleTableFilterComposer,
    $$WorkoutScheduleTableOrderingComposer,
    $$WorkoutScheduleTableAnnotationComposer,
    $$WorkoutScheduleTableCreateCompanionBuilder,
    $$WorkoutScheduleTableUpdateCompanionBuilder,
    (WorkoutScheduleData, $$WorkoutScheduleTableReferences),
    WorkoutScheduleData,
    PrefetchHooks Function({bool id})> {
  $$WorkoutScheduleTableTableManager(
      _$AppDatabase db, $WorkoutScheduleTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutScheduleTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutScheduleTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutScheduleTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> workoutType = const Value.absent(),
            Value<String> locationType = const Value.absent(),
            Value<double> durationMinutes = const Value.absent(),
            Value<String> intensity = const Value.absent(),
            Value<String?> exercises = const Value.absent(),
            Value<double?> distanceKm = const Value.absent(),
            Value<double?> caloriesBurned = const Value.absent(),
            Value<String?> equipment = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutScheduleCompanion(
            id: id,
            workoutType: workoutType,
            locationType: locationType,
            durationMinutes: durationMinutes,
            intensity: intensity,
            exercises: exercises,
            distanceKm: distanceKm,
            caloriesBurned: caloriesBurned,
            equipment: equipment,
            notes: notes,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required String workoutType,
            required String locationType,
            required double durationMinutes,
            required String intensity,
            Value<String?> exercises = const Value.absent(),
            Value<double?> distanceKm = const Value.absent(),
            Value<double?> caloriesBurned = const Value.absent(),
            Value<String?> equipment = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutScheduleCompanion.insert(
            id: id,
            workoutType: workoutType,
            locationType: locationType,
            durationMinutes: durationMinutes,
            intensity: intensity,
            exercises: exercises,
            distanceKm: distanceKm,
            caloriesBurned: caloriesBurned,
            equipment: equipment,
            notes: notes,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$WorkoutScheduleTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({id = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (id) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.id,
                    referencedTable:
                        $$WorkoutScheduleTableReferences._idTable(db),
                    referencedColumn:
                        $$WorkoutScheduleTableReferences._idTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$WorkoutScheduleTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WorkoutScheduleTable,
    WorkoutScheduleData,
    $$WorkoutScheduleTableFilterComposer,
    $$WorkoutScheduleTableOrderingComposer,
    $$WorkoutScheduleTableAnnotationComposer,
    $$WorkoutScheduleTableCreateCompanionBuilder,
    $$WorkoutScheduleTableUpdateCompanionBuilder,
    (WorkoutScheduleData, $$WorkoutScheduleTableReferences),
    WorkoutScheduleData,
    PrefetchHooks Function({bool id})>;
typedef $$ShoppingItemTableCreateCompanionBuilder = ShoppingItemCompanion
    Function({
  Value<int> id,
  required String name,
  Value<String?> description,
  Value<double> defaultQuantity,
  Value<String> unit,
  Value<String?> category,
  Value<String?> brand,
  Value<double?> estimatedPrice,
  Value<String?> size,
  Value<String?> color,
  Value<String?> imagePath,
  Value<bool> isFavorite,
  required DateTime createdAt,
  Value<DateTime?> lastUsed,
  Value<int> usageCount,
});
typedef $$ShoppingItemTableUpdateCompanionBuilder = ShoppingItemCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String?> description,
  Value<double> defaultQuantity,
  Value<String> unit,
  Value<String?> category,
  Value<String?> brand,
  Value<double?> estimatedPrice,
  Value<String?> size,
  Value<String?> color,
  Value<String?> imagePath,
  Value<bool> isFavorite,
  Value<DateTime> createdAt,
  Value<DateTime?> lastUsed,
  Value<int> usageCount,
});

class $$ShoppingItemTableFilterComposer
    extends Composer<_$AppDatabase, $ShoppingItemTable> {
  $$ShoppingItemTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get defaultQuantity => $composableBuilder(
      column: $table.defaultQuantity,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get brand => $composableBuilder(
      column: $table.brand, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get estimatedPrice => $composableBuilder(
      column: $table.estimatedPrice,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get size => $composableBuilder(
      column: $table.size, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isFavorite => $composableBuilder(
      column: $table.isFavorite, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastUsed => $composableBuilder(
      column: $table.lastUsed, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get usageCount => $composableBuilder(
      column: $table.usageCount, builder: (column) => ColumnFilters(column));
}

class $$ShoppingItemTableOrderingComposer
    extends Composer<_$AppDatabase, $ShoppingItemTable> {
  $$ShoppingItemTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get defaultQuantity => $composableBuilder(
      column: $table.defaultQuantity,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get brand => $composableBuilder(
      column: $table.brand, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get estimatedPrice => $composableBuilder(
      column: $table.estimatedPrice,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get size => $composableBuilder(
      column: $table.size, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
      column: $table.isFavorite, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastUsed => $composableBuilder(
      column: $table.lastUsed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get usageCount => $composableBuilder(
      column: $table.usageCount, builder: (column) => ColumnOrderings(column));
}

class $$ShoppingItemTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShoppingItemTable> {
  $$ShoppingItemTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<double> get defaultQuantity => $composableBuilder(
      column: $table.defaultQuantity, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get brand =>
      $composableBuilder(column: $table.brand, builder: (column) => column);

  GeneratedColumn<double> get estimatedPrice => $composableBuilder(
      column: $table.estimatedPrice, builder: (column) => column);

  GeneratedColumn<String> get size =>
      $composableBuilder(column: $table.size, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
      column: $table.isFavorite, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUsed =>
      $composableBuilder(column: $table.lastUsed, builder: (column) => column);

  GeneratedColumn<int> get usageCount => $composableBuilder(
      column: $table.usageCount, builder: (column) => column);
}

class $$ShoppingItemTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ShoppingItemTable,
    ShoppingItemData,
    $$ShoppingItemTableFilterComposer,
    $$ShoppingItemTableOrderingComposer,
    $$ShoppingItemTableAnnotationComposer,
    $$ShoppingItemTableCreateCompanionBuilder,
    $$ShoppingItemTableUpdateCompanionBuilder,
    (
      ShoppingItemData,
      BaseReferences<_$AppDatabase, $ShoppingItemTable, ShoppingItemData>
    ),
    ShoppingItemData,
    PrefetchHooks Function()> {
  $$ShoppingItemTableTableManager(_$AppDatabase db, $ShoppingItemTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShoppingItemTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShoppingItemTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShoppingItemTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<double> defaultQuantity = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<String?> category = const Value.absent(),
            Value<String?> brand = const Value.absent(),
            Value<double?> estimatedPrice = const Value.absent(),
            Value<String?> size = const Value.absent(),
            Value<String?> color = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<bool> isFavorite = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> lastUsed = const Value.absent(),
            Value<int> usageCount = const Value.absent(),
          }) =>
              ShoppingItemCompanion(
            id: id,
            name: name,
            description: description,
            defaultQuantity: defaultQuantity,
            unit: unit,
            category: category,
            brand: brand,
            estimatedPrice: estimatedPrice,
            size: size,
            color: color,
            imagePath: imagePath,
            isFavorite: isFavorite,
            createdAt: createdAt,
            lastUsed: lastUsed,
            usageCount: usageCount,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            Value<double> defaultQuantity = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<String?> category = const Value.absent(),
            Value<String?> brand = const Value.absent(),
            Value<double?> estimatedPrice = const Value.absent(),
            Value<String?> size = const Value.absent(),
            Value<String?> color = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<bool> isFavorite = const Value.absent(),
            required DateTime createdAt,
            Value<DateTime?> lastUsed = const Value.absent(),
            Value<int> usageCount = const Value.absent(),
          }) =>
              ShoppingItemCompanion.insert(
            id: id,
            name: name,
            description: description,
            defaultQuantity: defaultQuantity,
            unit: unit,
            category: category,
            brand: brand,
            estimatedPrice: estimatedPrice,
            size: size,
            color: color,
            imagePath: imagePath,
            isFavorite: isFavorite,
            createdAt: createdAt,
            lastUsed: lastUsed,
            usageCount: usageCount,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ShoppingItemTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ShoppingItemTable,
    ShoppingItemData,
    $$ShoppingItemTableFilterComposer,
    $$ShoppingItemTableOrderingComposer,
    $$ShoppingItemTableAnnotationComposer,
    $$ShoppingItemTableCreateCompanionBuilder,
    $$ShoppingItemTableUpdateCompanionBuilder,
    (
      ShoppingItemData,
      BaseReferences<_$AppDatabase, $ShoppingItemTable, ShoppingItemData>
    ),
    ShoppingItemData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BaseScheduleTableTableManager get baseSchedule =>
      $$BaseScheduleTableTableManager(_db, _db.baseSchedule);
  $$EntertainmentScheduleTableTableManager get entertainmentSchedule =>
      $$EntertainmentScheduleTableTableManager(_db, _db.entertainmentSchedule);
  $$LectureScheduleTableTableManager get lectureSchedule =>
      $$LectureScheduleTableTableManager(_db, _db.lectureSchedule);
  $$MealScheduleTableTableManager get mealSchedule =>
      $$MealScheduleTableTableManager(_db, _db.mealSchedule);
  $$MeetingScheduleTableTableManager get meetingSchedule =>
      $$MeetingScheduleTableTableManager(_db, _db.meetingSchedule);
  $$PersonalScheduleTableTableManager get personalSchedule =>
      $$PersonalScheduleTableTableManager(_db, _db.personalSchedule);
  $$ShoppingScheduleTableTableManager get shoppingSchedule =>
      $$ShoppingScheduleTableTableManager(_db, _db.shoppingSchedule);
  $$TravelScheduleTableTableManager get travelSchedule =>
      $$TravelScheduleTableTableManager(_db, _db.travelSchedule);
  $$WorkoutScheduleTableTableManager get workoutSchedule =>
      $$WorkoutScheduleTableTableManager(_db, _db.workoutSchedule);
  $$ShoppingItemTableTableManager get shoppingItem =>
      $$ShoppingItemTableTableManager(_db, _db.shoppingItem);
}
