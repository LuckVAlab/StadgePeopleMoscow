import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:stadge_people_moscow/core/constants/api_constants.dart';
import 'package:stadge_people_moscow/core/utils/api_error_handler.dart';
import 'package:stadge_people_moscow/data/api/dio_client.dart';
import 'package:stadge_people_moscow/data/models/auth_model.dart';
import 'package:stadge_people_moscow/data/services/storage_service.dart';

/// Authentication API service.
///
/// Uses [StorageService.instance] (singleton) so token persistence is
/// consistent across all service instances.
class AuthService {
  // Lazy getter — ensures StorageService.instance is accessed at call time,
  // not at class load time (before init()).
  StorageService get _storage => StorageService.instance;

  // Set via --dart-define=USE_MOCK=true when building for development
  static const bool _useMock =
      bool.fromEnvironment('USE_MOCK', defaultValue: false);

  static StorageService get storage => StorageService.instance;

  /// Initialize storage (call once at app startup).
  Future<void> init() => _storage.init();

  Future<AuthResponse> login(LoginRequest request) async {
    if (_useMock) return _mockLogin(request);

    try {
      final dio = DioClient.instance.dio;
      final response = await dio.post(
        ApiConstants.login,
        data: request.toJson(),
      );
      final data = AuthResponse.fromJson(response.data);

      // Persist token and user data
      _storage.setToken(data.token);
      _storage.setUser(jsonEncode(data.toJson()));
      DioClient.authInterceptor.setToken(data.token);

      return data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const ApiErrorInfo(
          type: ApiErrorType.unauthorized,
          message: 'Сессия истекла. Войдите снова.',
        );
      }
      final info = ApiErrorHandler.info(e);
      throw ApiErrorInfo(
        type: info.type,
        message: info.message,
      );
    }
  }

  Future<AuthResponse> register(RegisterRequest request) async {
    if (_useMock) return _mockRegister(request);

    try {
      final dio = DioClient.instance.dio;
      final response = await dio.post(
        ApiConstants.register,
        data: request.toJson(),
      );
      final data = AuthResponse.fromJson(response.data);

      // Persist token and user data
      _storage.setToken(data.token);
      _storage.setUser(jsonEncode(data.toJson()));
      DioClient.authInterceptor.setToken(data.token);

      return data;
    } on DioException catch (e) {
      final info = ApiErrorHandler.info(e);
      throw ApiErrorInfo(
        type: info.type,
        message: info.message,
      );
    }
  }

  Future<void> logout() async {
    try {
      final dio = DioClient.instance.dio;
      await dio.post(ApiConstants.logout);
    } catch (_) {
      // Server may not support logout endpoint — always clean locally
    } finally {
      _storage.clearToken();
      DioClient.authInterceptor.clearToken();
    }
  }

  /// Restore a previously saved token into the interceptor.
  /// Returns the token if one exists, null otherwise.
  String? restoreToken() {
    final token = _storage.getToken();
    if (token != null) {
      DioClient.authInterceptor.setToken(token);
    }
    return token;
  }

  // ─── Mock implementations ───

  Future<AuthResponse> _mockLogin(LoginRequest request) async {
    await Future.delayed(const Duration(seconds: 1));
    final token = 'mock_token_${DateTime.now().millisecondsSinceEpoch}';
    final user = AuthResponse(
      token: token,
      userId: 'user_001',
      name: 'Алексей Петров',
      email: request.email,
      role: 'specialist',
      specialty: 'Звукорежиссёр',
      rating: 4.9,
      reviewsCount: 23,
      equipment: [
        'DiGiCo SD10',
        'Yamaha QL5',
        'Sennheiser IEM',
      ],
      skills: [
        'Звуковой баланс',
        'Работа с мониторами',
        'Миксирование вживую',
      ],
      subscription: 'EventOS Pro',
    );
    _storage.setToken(token);
    _storage.setUser(jsonEncode(user.toJson()));
    DioClient.authInterceptor.setToken(token);
    return user;
  }

  Future<AuthResponse> _mockRegister(RegisterRequest request) async {
    await Future.delayed(const Duration(seconds: 1));
    final token = 'mock_token_${DateTime.now().millisecondsSinceEpoch}';
    final user = AuthResponse(
      token: token,
      userId: 'user_002',
      name: request.name,
      email: request.email,
      role: 'specialist',
      specialty: request.specialty,
      rating: 0.0,
      reviewsCount: 0,
      subscription: 'Free',
    );
    _storage.setToken(token);
    _storage.setUser(jsonEncode(user.toJson()));
    DioClient.authInterceptor.setToken(token);
    return user;
  }

  /// Update the current user profile on the server.
  ///
  /// Returns the updated [AuthResponse] and persists it to local storage.
  Future<AuthResponse> updateProfile(AuthResponse updates) async {
    if (_useMock) {
      // In mock mode, just return the updated data
      _storage.setUser(jsonEncode(updates.toJson()));
      return updates;
    }

    try {
      final dio = DioClient.instance.dio;
      final response = await dio.put(
        ApiConstants.profile,
        data: updates.toJson(),
      );
      final data = AuthResponse.fromJson(response.data);

      // Persist updated user data
      _storage.setUser(jsonEncode(data.toJson()));
      return data;
    } on DioException catch (e) {
      final info = ApiErrorHandler.info(e);
      throw ApiErrorInfo(
        type: info.type,
        message: info.message,
      );
    }
  }
}
