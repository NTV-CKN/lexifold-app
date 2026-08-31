import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexifold/data/model/result/base_result.dart';
import 'package:lexifold/data/model/result/result_wrapper.dart';
import 'package:lexifold/providers/auth/auth_core_provider.dart';

class AuthNotifier extends AsyncNotifier<Result<BaseResult>?> {
  @override
  FutureOr<Result<BaseResult>?> build() {
    return null;
  }

  Future<void> signUpAccount(String email, password) async {
    final authRepository = ref.read(authRepositoryProvider);
    state = AsyncLoading();

    //Trả về Async error nếu thất bại
    state = await AsyncValue.guard(() async {
      return authRepository.signUpAccount(email, password);
    });
  }
}

final authNotifierProvider =
    AsyncNotifierProvider<AuthNotifier, Result<BaseResult>?>(() {
      return AuthNotifier();
    });
