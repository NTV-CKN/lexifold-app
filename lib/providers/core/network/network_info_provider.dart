import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final networkStatusProvider =
    StreamProvider<List<ConnectivityResult>>((ref) {
      return Connectivity().onConnectivityChanged;
    });

///Provider này cung cấp nhanh liệu thiết bị có đang kết nối mạng không?
///Chưa khẳng định thiết bị đã kết nối đến Internet hay không.
final isConnectedProvider = Provider<bool>((ref) {
  final networkState = ref.watch(networkStatusProvider);

  return networkState.when(
    data: (results) {
      return results.any(
        (result) =>
            result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile ||
            result == ConnectivityResult.ethernet ||
            result == ConnectivityResult.vpn,
      );
    },
    loading: () => true,
    error: (_, __) => false,
  );
});

///Hàm này giúp kiểm tra liệu thiết bị có thật sự kết nối Internet bằng
///việc gửi yêu cầu mạng đến tên miền Google để nhận phản hồi dữ liệu
///sau khi được phân giải.
///
/// Nếu dữ liệu là false thì khả năng Server bị lỗi hoặc thiết bị người dùng
/// không có kết nối Internet.
/// Nếu dữ liệu là true thì có kết nối Internet
final realInternetCheckerProvider = Provider<Future<bool> Function()>(
  (ref) {
    return () async {
      final isDeviceConnected = ref.read(isConnectedProvider);
      if (!isDeviceConnected) return false;

      try {
        final result = await InternetAddress.lookup(
          'dns.google',
        ).timeout(const Duration(seconds: 3));
        return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      } on SocketException catch (_) {
        return false;
      } catch (_) {
        return false;
      }
    };
  },
);
