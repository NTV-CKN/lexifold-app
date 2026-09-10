import 'package:lexifold/data/source/local/vocab/study_sets_source_local.dart';

import '../source/local/lexi_fold_database.dart';

abstract class StudySetsRepository {
  Future<bool> addOrUpdateStudySets(
    List<Vocabulary> vocabulariesLst,
    StudySet studySet,
    bool isUpdate,
  );
}

class StudySetsRepositoryImpl implements StudySetsRepository {
  final StudySetsSourceLocal _local;

  const StudySetsRepositoryImpl({required this._local});

  @override
  Future<bool> addOrUpdateStudySets(
    List<Vocabulary> vocabulariesLst,
    StudySet studySet,
    bool isUpdate,
  ) async {
    try {
      return await _local.addOrUpdateStudySet(
        vocabulariesLst,
        studySet,
        isUpdate,
      );
    } catch (err) {
      return false;
    }
  }
}
