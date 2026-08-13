import 'package:shared_preferences/shared_preferences.dart';

/// Persistent storage for auth token.
class StorageService {
  static const _tokenKey = 'auth_token';

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void setToken(String token) {
    _prefs?.setString(_tokenKey, token);
  }

  String? getToken() {
    return _prefs?.getString(_tokenKey);
  }

  void clearToken() {
    _prefs?.remove(_tokenKey);
  }
}
