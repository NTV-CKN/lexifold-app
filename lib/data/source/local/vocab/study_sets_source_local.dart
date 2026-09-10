import 'package:lexifold/data/source/local/daos/study_sets/study_sets_dao.dart';
import 'package:lexifold/data/source/local/lexi_fold_database.dart';

///Lớp này đảm nhận vai trò thao tác học phần và từ vựng của học phần
///ở phía local database - thông qua Drift
abstract class StudySetsSourceLocal {
  const StudySetsSourceLocal();

  Future<bool> addOrUpdateStudySet(
    List<Vocabulary> vocabulariesLst,
    StudySet studySet,
    bool isUpdate,
  );
}

class StudySetsSourceLocalImpl extends StudySetsSourceLocal {
  final StudySetsDao _studySetsDao;

  const StudySetsSourceLocalImpl({required this._studySetsDao});

  @override
  Future<bool> addOrUpdateStudySet(
    List<Vocabulary> vocabulariesLst,
    StudySet studySet,
    bool isUpdate,
  ) async {
    try {
      return await _studySetsDao.addOrUpdateStudySets(
        vocabulariesLst,
        studySet,
        isUpdate,
      );
    } catch (error) {
      return false;
    }
  }
}
