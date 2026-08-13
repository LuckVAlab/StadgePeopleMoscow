import '../../core/constants/api_constants.dart';
import '../models/auth_model.dart';
import '../api/dio_client.dart';
import 'storage_service.dart';

/// Authentication API service.
class AuthService {
  final StorageService _storage = StorageService();

  StorageService get storage => _storage;

  /// Initialize storage (call once at app startup).
  Future<void> init() => _storage.init();

  Future<AuthResponse> login(LoginRequest request) async {
    final dio = DioClient.instance.dio;
    final response = await dio.post(
      ApiConstants.login,
      data: request.toJson(),
    );
    final data = AuthResponse.fromJson(response.data);

    // Persist token and attach to interceptor
    _storage.setToken(data.token);
    DioClient.authInterceptor.setToken(data.token);

    return data;
  }

  Future<AuthResponse> register(RegisterRequest request) async {
    final dio = DioClient.instance.dio;
    final response = await dio.post(
      ApiConstants.register,
      data: request.toJson(),
    );
    final data = AuthResponse.fromJson(response.data);

    // Persist token and attach to interceptor
    _storage.setToken(data.token);
    DioClient.authInterceptor.setToken(data.token);

    return data;
  }

  Future<void> logout() async {
    try {
      final dio = DioClient.instance.dio;
      await dio.post(ApiConstants.profile);
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
}
