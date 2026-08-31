import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lexifold/data/model/result/base_result.dart';
import 'package:lexifold/env/api_endpoints.dart';
import 'package:lexifold/l10n/app_localizations.dart';
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
    AppLocalizations l10n,
  );

  ///Hàm này đảm nhận vai trò gọi logic signInWithEmailPassword của Firebase
  ///để lấy ra idToken lưu cache vào thiết bị và gọi hàm [_requestLoginToServer]
  ///để gửi idToken lên server kiểm tra và đăng nhập
  Future<Result<BaseResult>> signInWithEmailPassword(
    String email,
    String password,
    AppLocalizations l10n,
  );

  ///Hàm này đảm nhận vai trò gọi logic đăng nhập Google của Firebase
  ///để lấy ra idToken lưu cache vào thiết bị và gọi hàm [_requestLoginToServer]
  ///để gửi idToken lên server kiểm tra và đăng nhập
  Future<Result<BaseResult>> signInWithGoogle(AppLocalizations l10n);

  ///Hàm này sẽ nhận nhiệm vụ gọi logic sendPasswordResetEmail từ của Firebase
  ///giúp gửi Email đến người dùng để tiến hành khôi phục mật khẩu
  Future<Result<BaseResult>> resetPassword(
    String email,
    AppLocalizations l10n,
  );
}

class AuthSourceRemoteImpl implements AuthSourceRemote {
  final FirebaseAuth _firebaseAuth;
  final ApiClient _apiClient;
  final GoogleSignIn _googleSignIn;

  AuthSourceRemoteImpl(
    this._firebaseAuth,
    this._apiClient,
    this._googleSignIn,
  );

  @override
  Future<Result<BaseResult>> signUpAccount(
    String email,
    String password,
    AppLocalizations l10n,
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
      String error = _mapFirebaseAuthError(e.code, l10n);

      return Error<BaseResult>(Exception(error));
    } catch (e) {
      return Error<BaseResult>(
        Exception(l10n.textErrorDuringProgress),
      );
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
    AppLocalizations l10n,
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
    } on FirebaseAuthException catch (e) {
      String error = _mapFirebaseAuthError(e.code, l10n);

      return Error<BaseResult>(Exception(error));
    } catch (e) {
      return Error<BaseResult>(
        Exception(l10n.textErrorDuringProgress),
      );
    }
  }

  @override
  Future<Result<BaseResult>> signInWithGoogle(
    AppLocalizations l10n,
  ) async {
    try {
      //Mở luồng đăng nhập Google (Chọn tài khoản)
      final GoogleSignInAccount? googleUser = await _googleSignIn
          .signIn();

      if (googleUser == null) {
        return Error<BaseResult>(
          Exception("Google Sign In was cancelled by user"),
        );
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential =
          GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );

      await _firebaseAuth.signInWithCredential(credential);
      final user = await _requestLoginToServer();
      if (user == null) {
        throw Exception("User from Server is null");
      }

      return Success(
        BaseResult(
          success: true,
          message: "Welcome: ${user.displayName ?? user.email}",
        ),
      );
    } on FirebaseAuthException catch (e) {
      String error = _mapFirebaseAuthError(e.code, l10n);

      return Error<BaseResult>(Exception(error));
    } catch (e) {
      return Error<BaseResult>(
        Exception(l10n.textErrorDuringProgress),
      );
    }
  }

  @override
  Future<Result<BaseResult>> resetPassword(
    String email,
    AppLocalizations l10n,
  ) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);

      return Success(
        BaseResult(
          success: true,
          message: l10n.textSuccessResetPassword,
        ),
      );
    } on FirebaseAuthException catch (e) {
      return Error<BaseResult>(
        Exception(_mapFirebaseAuthError(e.code, l10n)),
      );
    } catch (err) {
      return Error(Exception(l10n.textErrorResetPassword));
    }
  }

  String _mapFirebaseAuthError(String code, AppLocalizations l10n) {
    switch (code) {
      case 'invalid-email':
        return l10n.errorEmailFormat;
      case 'user-not-found':
        return l10n.textEmailNotExistsInSystem;
      case 'user-disabled':
        return l10n.textUserDisabled;

      case 'wrong-password':
      case 'invalid-credential':
        return l10n.textWrongPasswordOrCredential;
      case 'weak-password':
        return l10n.textWeakPassword;

      case 'email-already-in-use':
        return l10n.textEmailAlreadyInUse;

      case 'account-exists-with-different-credential':
        return l10n.textAccountExistsWithDifferentCredential;
      case 'operation-not-allowed':
        return l10n.textOperationNotAllowed;

      case 'too-many-requests':
        return l10n.textTooManyRequests;
      case 'network-request-failed':
        return l10n.textNetworkRequestFailed;

      default:
        return l10n.textErrorDuringProgress;
    }
  }
}
