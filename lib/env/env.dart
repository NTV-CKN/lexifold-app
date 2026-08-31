import 'package:envied/envied.dart';

part 'env.g.dart';

//dart run build_runner build --delete-conflicting-outputs
@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'BASE_URL', obfuscate: true)
  static final String baseUrl = _Env.baseUrl;
}
