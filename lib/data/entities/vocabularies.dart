import 'package:drift/drift.dart';
import 'package:lexifold/data/entities/study_sets.dart';

class Vocabularies extends Table {
  TextColumn get id => text()();

  TextColumn get studySetId => text().references(
    StudySets,
    #id,
    onDelete: KeyAction.cascade,
  )();

  TextColumn get term => text()();

  TextColumn get definition => text()();

  TextColumn get example => text().nullable()();

  TextColumn get imageUrl => text().nullable()();

  TextColumn get termLanguage =>
      text().withDefault(const Constant('en'))();

  TextColumn get definitionLanguage =>
      text().withDefault(const Constant('vi'))();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  Vocabularies();

  @override
  Set<Column> get primaryKey => {id};
}
