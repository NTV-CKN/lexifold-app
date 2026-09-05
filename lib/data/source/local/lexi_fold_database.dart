import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../entities/study_sets.dart';
import '../../entities/vocabularies.dart';
import '../../enums/sync_option.dart';

part 'lexi_fold_database.g.dart';

//flutter pub run build_runner build --delete-conflicting-outputs

@DriftDatabase(tables: [StudySets, Vocabularies])
class LexiFoldDatabase extends _$LexiFoldDatabase {
  LexiFoldDatabase({QueryExecutor? executor})
    : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, "lexifold.sqlite"));
    return NativeDatabase(file);
  });
}
