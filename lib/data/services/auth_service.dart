import '../../core/constants/api_constants.dart';
import '../models/auth_model.dart';
import '../api/dio_client.dart';

/// Authentication API service.
class AuthService {
  final DioClient _dioClient = DioClient();

  DioClient get dioClient => _dioClient;

  Future<AuthResponse> login(LoginRequest request) async {
    final dio = _dioClient.dio;
    final response = await dio.post(
      ApiConstants.login,
      data: request.toJson(),
    );
    final data = AuthResponse.fromJson(response.data);

    // Attach token to all subsequent requests
    _dioClient.authInterceptor.setToken(data.token);

    return data;
  }

  Future<AuthResponse> register(RegisterRequest request) async {
    final dio = _dioClient.dio;
    final response = await dio.post(
      ApiConstants.register,
      data: request.toJson(),
    );
    final data = AuthResponse.fromJson(response.data);

    // Attach token to all subsequent requests
    _dioClient.authInterceptor.setToken(data.token);

    return data;
  }

  Future<void> logout() async {
    try {
      final dio = _dioClient.dio;
      await dio.post(ApiConstants.profile);
    } finally {
      _dioClient.authInterceptor.clearToken();
    }
  }
}
