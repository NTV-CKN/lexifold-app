import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexifold/env/env.dart';
import 'package:lexifold/providers/core/firebase_provider.dart';
import 'package:lexifold/utils/api_client.dart';

final apiClientProvider = Provider((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);

  return ApiClient(firebaseAuth: firebaseAuth, baseUrl: Env.baseUrl);
});
