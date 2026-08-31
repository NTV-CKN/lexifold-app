import 'package:lexifold/data/model/result/base_result.dart';
import 'package:lexifold/data/model/result/result_wrapper.dart';
import 'package:lexifold/data/source/remote/auth_source_remote.dart';

import '../../l10n/app_localizations.dart';

abstract class AuthRepository {
  Future<Result<BaseResult>> signUpAccount(
    String email,
    String password,
  );

  Future<Result<BaseResult>> signInWithEmailPassword(
    String email,
    String password,
  );

  Future<Result<BaseResult>> signInWithGoogle();

  Future<Result<BaseResult>> resetPassword(
    String email,
    AppLocalizations l10n,
  );
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthSourceRemote _authSourceRemote;

  AuthRepositoryImpl(this._authSourceRemote);

  @override
  Future<Result<BaseResult>> signUpAccount(
    String email,
    String password,
  ) async {
    return await _authSourceRemote.signUpAccount(email, password);
  }

  @override
  Future<Result<BaseResult>> signInWithEmailPassword(
    String email,
    String password,
  ) async {
    return await _authSourceRemote.signInWithEmailPassword(
      email,
      password,
    );
  }

  @override
  Future<Result<BaseResult>> signInWithGoogle() async {
    return await _authSourceRemote.signInWithGoogle();
  }

  @override
  Future<Result<BaseResult>> resetPassword(
    String email,
    AppLocalizations l10n,
  ) async {
    return await _authSourceRemote.resetPassword(email, l10n);
  }
}
