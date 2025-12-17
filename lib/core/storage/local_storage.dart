import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'local_storage.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(SharedPreferencesRef ref) {
  throw UnimplementedError();
}

class LocalStorage {
  final SharedPreferences _prefs;

  LocalStorage(this._prefs);

  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';

  // Generic methods
  Future<bool> setString(String key, String value) => _prefs.setString(key, value);
  String? getString(String key) => _prefs.getString(key);
  
  Future<bool> setBool(String key, bool value) => _prefs.setBool(key, value);
  bool? getBool(String key) => _prefs.getBool(key);

  Future<bool> setInt(String key, int value) => _prefs.setInt(key, value);
  int? getInt(String key) => _prefs.getInt(key);
  
  Future<bool> remove(String key) => _prefs.remove(key);
  Future<bool> clear() => _prefs.clear();

  // Auth specific
  String? get accessToken => getString(accessTokenKey);
  String? get refreshToken => getString(refreshTokenKey);
  
  Future<void> saveTokens(String accessToken, String refreshToken) async {
    await setString(accessTokenKey, accessToken);
    await setString(refreshTokenKey, refreshToken);
  }

  Future<void> clearTokens() async {
    await remove(accessTokenKey);
    await remove(refreshTokenKey);
  }
}

@riverpod
LocalStorage localStorage(LocalStorageRef ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return LocalStorage(prefs);
}