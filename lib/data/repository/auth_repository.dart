import 'package:firebase_auth/firebase_auth.dart';
import 'package:lexifold/data/model/result/base_result.dart';
import 'package:lexifold/data/model/result/result_wrapper.dart';
import 'package:lexifold/data/source/remote/auth_source_remote.dart';

abstract class AuthRepository {
  Future<Result<BaseResult>> signUpAccount(
    String email,
    String password,
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
}
