import 'package:shared_preferences/shared_preferences.dart';

/// Persistent storage for auth token and user data.
///
/// Singleton — always access via [StorageService.instance] to ensure
/// a single [SharedPreferences] instance is shared across the app.
class StorageService {
  static const _tokenKey = 'auth_token';
  static const _userKey = 'auth_user';

  static final StorageService _instance = StorageService._internal();
  static StorageService get instance => _instance;

  StorageService._internal();

  SharedPreferences? _prefs;
  bool _initialized = false;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    _initialized = true;
  }

  void setToken(String token) {
    _checkInitialized();
    _prefs?.setString(_tokenKey, token);
  }

  String? getToken() {
    _checkInitialized();
    return _prefs?.getString(_tokenKey);
  }

  void clearToken() {
    _prefs?.remove(_tokenKey);
    _prefs?.remove(_userKey);
  }

  void setUser(String json) {
    _checkInitialized();
    _prefs?.setString(_userKey, json);
  }

  String? getUser() {
    _checkInitialized();
    return _prefs?.getString(_userKey);
  }

  void _checkInitialized() {
    if (!_initialized) {
      throw StateError(
        'StorageService is not initialized. Call StorageService.instance.init() '
        'before using any storage methods.',
      );
    }
  }
}
