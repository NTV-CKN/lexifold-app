import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexifold/data/model/result/base_result.dart';
import 'package:lexifold/data/model/result/result_wrapper.dart';
import 'package:lexifold/l10n/app_localizations.dart';
import 'package:lexifold/providers/auth/auth_core_provider.dart';

class AuthNotifier extends AsyncNotifier<Result<BaseResult>?> {
  @override
  FutureOr<Result<BaseResult>?> build() {
    return null;
  }

  Future<void> signUpAccount(String email, String password) async {
    final authRepository = ref.read(authRepositoryProvider);
    state = AsyncLoading();

    //Trả về Async error nếu thất bại
    state = await AsyncValue.guard(() async {
      return await authRepository.signUpAccount(email, password);
    });
  }

  Future<void> signInWithEmailPassword(
    String email,
    String password,
  ) async {
    final authRepository = ref.read(authRepositoryProvider);
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await authRepository.signInWithEmailPassword(
        email,
        password,
      );
    });
  }

  Future<void> signInWithGoogle() async {
    final authRepository = ref.read(authRepositoryProvider);
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await authRepository.signInWithGoogle();
    });
  }

  Future<void> resetPassword(
    String email,
    AppLocalizations l10n,
  ) async {
    final authRepository = ref.read(authRepositoryProvider);
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await authRepository.resetPassword(email, l10n);
    });
  }
}

final authNotifierProvider =
    AsyncNotifierProvider<AuthNotifier, Result<BaseResult>?>(() {
      return AuthNotifier();
    });
