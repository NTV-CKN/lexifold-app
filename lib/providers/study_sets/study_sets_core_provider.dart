import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexifold/data/repository/study_sets_repository.dart';
import 'package:lexifold/data/source/local/vocab/study_sets_source_local.dart';
import 'package:lexifold/providers/core/local_db/lexi_fold_db_provider.dart';

//source local
final studySetsLocalSourceProvider = Provider((ref) {
  final studySetsDao = ref.read(studySetsDaoProvider);

  return StudySetsSourceLocalImpl(studySetsDao: studySetsDao);
});

//repository
final studySetsRepositoryProvider = Provider((ref) {
  final studySetsLocal = ref.read(studySetsLocalSourceProvider);

  return StudySetsRepositoryImpl(local: studySetsLocal);
});
