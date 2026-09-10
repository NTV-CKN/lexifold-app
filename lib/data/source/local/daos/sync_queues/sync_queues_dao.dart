import 'package:drift/drift.dart';

import '../../../../entities/sync_queues.dart';
import '../../lexi_fold_database.dart';

part 'sync_queues_dao.g.dart';

@DriftAccessor(tables: const [SyncQueues])
class SyncQueuesDao extends DatabaseAccessor<LexiFoldDatabase>
    with _$SyncQueuesDaoMixin {
  SyncQueuesDao(LexiFoldDatabase db) : super(db);

  Future<void> addSyncQueueTask(SyncQueuesCompanion syncQueue) async {
    await into(syncQueues).insert(syncQueue);
  }
}
