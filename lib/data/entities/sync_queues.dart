import 'package:drift/drift.dart';

class SyncQueues extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get entityType => text()();

  TextColumn get entityId => text()();

  TextColumn get syncQueueOption => text()();

  DateTimeColumn get createdAT => dateTime()();
}
