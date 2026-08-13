import '../models/auth_model.dart';

/// Authentication API service.
///
/// Replace mock implementations with real API calls when backend is ready.
class AuthService {
  Future<AuthResponse> login(LoginRequest request) async {
    // TODO: Replace with real API call
    // final dio = DioClient().dio;
    // final response = await dio.post(ApiConstants.login, data: request.toJson());
    // return AuthResponse.fromJson(response.data);

    // Mock response for now
    await Future.delayed(const Duration(seconds: 1));
    return AuthResponse(
      token: 'mock_token_12345',
      userId: 'user_001',
      name: 'Алексей Петров',
      email: 'alex@example.com',
      role: 'specialist',
    );
  }

  Future<AuthResponse> register(RegisterRequest request) async {
    // TODO: Replace with real API call
    // final dio = DioClient().dio;
    // final response = await dio.post(ApiConstants.register, data: request.toJson());
    // return AuthResponse.fromJson(response.data);

    // Mock response for now
    await Future.delayed(const Duration(seconds: 1));
    return AuthResponse(
      token: 'mock_token_67890',
      userId: 'user_002',
      name: request.name,
      email: request.email,
      role: 'specialist',
    );
  }

  Future<void> logout() async {
    // TODO: Call logout endpoint when backend is ready
    await Future.delayed(const Duration(milliseconds: 300));
  }
}
