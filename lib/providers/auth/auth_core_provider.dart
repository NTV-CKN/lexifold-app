//data source
//remote
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexifold/data/repository/auth_repository.dart';
import 'package:lexifold/data/source/remote/auth_source_remote.dart';
import 'package:lexifold/providers/core/api_client_provider.dart';
import 'package:lexifold/providers/core/firebase_provider.dart';

final authSourceRemoteProvider = Provider<AuthSourceRemote>((ref) {
  final apiClient = ref.watch(apiClientProvider);

  return AuthSourceRemoteImpl(
    ref.read(firebaseAuthProvider),
    apiClient,
    ref.read(googleSignIn),
  );
});

//repository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.read(authSourceRemoteProvider));
});
