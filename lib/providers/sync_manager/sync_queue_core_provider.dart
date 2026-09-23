import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexifold/data/repository/sync_queue_repository.dart';
import 'package:lexifold/data/source/local/daos/sync_queues/sync_queue_local_source.dart';
import 'package:lexifold/providers/core/local_db/lexi_fold_db_provider.dart';

//local source
final syncQueueLocalSourceProvider = Provider((ref) {
  final syncQueueDao = ref.read(lexifoldDbProvider).syncQueuesDao;

  return SyncQueueLocalSourceImpl(syncQueuesDao: syncQueueDao);
});

//sync queue repository
final syncQueueRepositoryProvider = Provider((ref) {
  final local = ref.read(syncQueueLocalSourceProvider);

  return SyncQueueRepositoryImpl(local: local);
});
