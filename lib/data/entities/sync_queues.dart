import 'package:drift/drift.dart';
import 'package:lexifold/data/enums/sync_option.dart';

class SyncQueues extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get entityType => text()();

  TextColumn get entityId => text()();

  TextColumn get syncQueueOption => text()();

  //Dùng để lưu lại JSON của thực thể đó và đưa lên Server
  TextColumn get payload => text()();

  TextColumn get syncState =>
      text().withDefault(Constant(SyncState.pending.name))();

  //Số lần đã thử gửi lại nếu gặp lỗi (dùng để chặn vòng lặp lỗi vô tận)
  IntColumn get countRequest =>
      integer().withDefault(const Constant(0))();

  //Message lỗi gần nhất nếu API bị đứt/sự cố
  TextColumn get lastError => text().nullable()();

  //Đánh dấu thời điểm tạo request
  DateTimeColumn get createdAt => dateTime()();

  //Đánh dấu thời gian cuối bị failed request, dựa vào đó để xác định reset
  DateTimeColumn get lastRequestFailedAt => dateTime().nullable()();
}
