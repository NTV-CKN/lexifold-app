import 'package:firebase_auth/firebase_auth.dart';
import 'package:lexifold/data/model/result/base_result.dart';

import '../../model/result/result_wrapper.dart';

abstract class AuthSourceRemote {
  Future<Result<BaseResult>> signUpAccount(
    String email,
    String password,
  );
}

class AuthSourceRemoteImpl implements AuthSourceRemote {
  final FirebaseAuth _firebaseAuth;

  AuthSourceRemoteImpl(this._firebaseAuth);

  @override
  Future<Result<BaseResult>> signUpAccount(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
      final user = userCredential.user;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        return Success(
          BaseResult(success: true, message: "SignUp success!"),
        );
      } else {
        return Success(
          BaseResult(success: false, message: "SignUp failed!!"),
        );
      }
    } on FirebaseAuthException catch (e) {
      Exception exception;

      if (e.code == 'weak-password') {
        exception = Exception("Weak password, pls try again");
      } else if (e.code == 'email-already-in-use') {
        exception = Exception("Email already in use");
      } else {
        exception = Exception(e.message);
      }

      return Error<BaseResult>(exception);
    } catch (e) {
      return Error<BaseResult>(Exception("Unknown error"));
    }
  }
}
