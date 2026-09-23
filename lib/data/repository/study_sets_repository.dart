import 'package:lexifold/data/model/result/base_result.dart';
import 'package:lexifold/data/source/local/vocab/study_sets_source_local.dart';
import 'package:lexifold/data/source/remote/study_set_source_remote.dart';

import '../source/local/lexi_fold_database.dart';

abstract class StudySetsRepository {
  /// Hàm này sẽ gọi xuống dưới Database cục bổ để lưu hoặc cập nhật các học phần
  Future<bool> addOrUpdateStudySets(
    List<Vocabulary> vocabulariesLst,
    StudySet studySet,
    bool isUpdate,
  );

  ///Hàm này sẽ gọi lên Server để thực hiện việc gọi API thêm hoặc cập
  ///nhật dữ liệu học phần và từ vựng với payload cho trước.
  Future<BaseResult> addOrUpdateStudySetsToServer(
    bool isUpdate,
    String payload,
  );
}

class StudySetsRepositoryImpl implements StudySetsRepository {
  final StudySetsSourceLocal _local;
  final StudySetSourceRemote _remote;

  const StudySetsRepositoryImpl({
    required this._local,
    required this._remote,
  });

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

  @override
  Future<BaseResult> addOrUpdateStudySetsToServer(
    bool isUpdate,
    String payload,
  ) async {
    return await _remote.addOrUpdateWithVocabs(isUpdate, payload);
  }
}
