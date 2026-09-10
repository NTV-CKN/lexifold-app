///Được dùng trong bảng SyncQueues, giúp đánh dấu loại hành động
///để dựa vào đó thực hiện logic cập nhật đồng bộ lên Server
enum SyncOption {
  synced("synced"),
  initialize("initialize"),
  pending_created("pending_created"),
  pending_updated("pending_updated");

  final String typeName;

  const SyncOption(this.typeName);
}

///Được dùng trong bảng SyncQueues giúp đánh dấu lại record đó
///sẽ thực hiện cho thực thể (bảng nào)
enum EntitySyncType { study_sets }
