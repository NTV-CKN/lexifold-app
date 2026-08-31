import 'package:firebase_auth/firebase_auth.dart';
import 'package:lexifold/data/model/result/base_result.dart';
import 'package:lexifold/env/api_endpoints.dart';
import 'package:lexifold/utils/api_client.dart';

import 'package:lexifold/data/model/user.dart' as user_model;
import '../../model/result/result_wrapper.dart';

abstract class AuthSourceRemote {
  ///Hàm này gọi đến dịch vụ createUserWithEmailAndPassword của Firebase
  ///để tiến hành tạo tài khoản cho người dùng.
  ///
  ///Các tham số:
  ///[email] email của người dùng nhập vào
  ///[password] mật khẩu người dùng thiết lập cho [email]
  ///
  /// Trả về lớp [Result] với generic [BaseResult] để xác định kết quả đăng
  /// kí tài khoản có diễn ra thành công hay không (Trường hợp: Tài khoản đã tồn tại,
  /// mật khẩu yếu, ...).
  Future<Result<BaseResult>> signUpAccount(
    String email,
    String password,
  );

  ///Hàm này đảm nhận vai trò gọi logic signInWithEmailPassword của Firebase
  ///để lấy ra idToken lưu cache vào thiết bị và gọi hàm [_requestLoginToServer]
  ///để gửi idToken lên server kiểm tra và đăng nhập
  Future<Result<BaseResult>> signInWithEmailPassword(
    String email,
    String password,
  );
}

class AuthSourceRemoteImpl implements AuthSourceRemote {
  final FirebaseAuth _firebaseAuth;
  final ApiClient _apiClient;

  AuthSourceRemoteImpl(this._firebaseAuth, this._apiClient);

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

  ///Được gọi từ các hàm [signInWithEmailPassword] nhằm tận dụng cơ chế
  ///lấy idToken trong logic ApiClient để gọi lên Server xác thực token đó
  ///
  /// Trả về null nếu `userData` từ Server là null
  Future<user_model.User?> _requestLoginToServer() async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.loginWithFirebaseAuth,
      );
      final responseData = response.data as Map<String, dynamic>;

      if (responseData["success"] == true) {
        return user_model.User.fromJson(responseData["userData"]);
      } else {
        throw Exception(responseData["message"] ?? "Auth-Error");
      }
    } catch (err) {
      throw Exception(err);
    }
  }

  @override
  Future<Result<BaseResult>> signInWithEmailPassword(
    String email,
    String password,
  ) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = await _requestLoginToServer();
      if (user == null) {
        throw Exception("User from Server is null");
      }

      return Success(
        BaseResult(
          success: true,
          message: "Welcome: ${user.displayName}",
        ),
      );
    } on Exception catch (err) {
      return Error(
        Exception("Sign in failed cause: ${err.toString()}"),
      );
    }
  }
}
