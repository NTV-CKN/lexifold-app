//data source
//remote
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexifold/data/repository/auth_repository.dart';
import 'package:lexifold/data/source/remote/auth_source_remote.dart';
import 'package:lexifold/providers/firebase_provider.dart';

final authSourceRemoteProvider = Provider<AuthSourceRemote>((ref) {
  return AuthSourceRemoteImpl(ref.read(firebaseAuthProvider));
});

//repository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.read(authSourceRemoteProvider));
});
