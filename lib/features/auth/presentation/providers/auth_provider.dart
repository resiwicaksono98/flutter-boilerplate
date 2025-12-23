import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  bool build() {
    return false; // Default to logged out
  }

  void login() {
    state = true;
  }

  void logout() {
    state = false;
  }
}
