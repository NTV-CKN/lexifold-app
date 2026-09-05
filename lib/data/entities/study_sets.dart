import 'package:drift/drift.dart';
import 'package:lexifold/data/enums/sync_option.dart';

class StudySets extends Table {
  TextColumn get id => text().unique()();

  TextColumn get title => text().withLength(min: 3, max: 60)();

  TextColumn get subDescription =>
      text().nullable().withLength(min: 5, max: 150)();

  BoolColumn get isPublic =>
      boolean().withDefault(const Constant(false))();

  TextColumn get sourceLanguage =>
      text().withDefault(const Constant("en"))();

  TextColumn get targetLanguage =>
      text().withDefault(const Constant("vi"))();

  TextColumn get syncStatus => text().withDefault(
    Constant(SyncOption.pending_created.typeName),
  )();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
