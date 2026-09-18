import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:lexifold/data/dto/study_set_dto.dart';
import 'package:lexifold/data/entities/vocabularies.dart';
import 'package:lexifold/data/enums/sync_option.dart';
import 'package:lexifold/data/source/local/lexi_fold_database.dart';

import '../../../../entities/study_sets.dart';

part 'study_sets_dao.g.dart';

@DriftAccessor(tables: const [StudySets, Vocabularies])
class StudySetsDao extends DatabaseAccessor<LexiFoldDatabase>
    with _$StudySetsDaoMixin {
  StudySetsDao(LexiFoldDatabase db) : super(db);

  Future<bool> addOrUpdateStudySets(
    List<Vocabulary> vocabulariesLst,
    StudySet studySet,
    bool isUpdate,
  ) async {
    try {
      await transaction(() async {
        //Cập nhật thông tin về học phần
        await into(studySets).insertOnConflictUpdate(studySet);

        //Xóa danh sách từ vựng cũ của học phần cùng id
        if (isUpdate) {
          await (delete(
            vocabularies,
          )..where((tbl) => tbl.studySetId.equals(studySet.id))).go();
        }

        //Tạo hoặc cập nhật từ vựng
        await batch(
          (batch) => batch.insertAllOnConflictUpdate(
            vocabularies,
            vocabulariesLst,
          ),
        );

        //Ghi lại công việc cần đồng bộ lên Server
        final syncQueue = SyncQueuesCompanion.insert(
          createdAt: DateTime.now(),
          entityId: studySet.id,
          entityType: EntitySyncType.study_sets.name,
          syncQueueOption: isUpdate
              ? SyncOption.pending_updated.typeName
              : SyncOption.pending_created.typeName,
          payload: jsonEncode(
            StudySetDto.fromEntity(
              studySet,
              vocabulariesLst,
            ).toJson(),
          ),
        );

        await db.syncQueuesDao.addSyncQueueTask(syncQueue);
      });

      return true;
    } catch (err) {
      print("Transaction failed & rolled back: $err");
      return false;
    }
  }
}
