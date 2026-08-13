import 'package:dio/dio.dart';
import '../../core/constants/api_constants.dart';

/// Interceptor that attaches Bearer token to every request.
class AuthInterceptor extends Interceptor {
  String? _token;

  void setToken(String token) => _token = token;
  void clearToken() => _token = null;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_token != null) {
      options.headers['Authorization'] = 'Bearer $_token';
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // On 401, clear the stale token so the user can re-login
    if (err.response?.statusCode == 401) {
      _token = null;
    }
    return handler.next(err);
  }
}

/// Pre-configured Dio instance for all API calls.
class DioClient {
  static final AuthInterceptor _authInterceptor = AuthInterceptor();

  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _dio.interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
      ),
      _authInterceptor,
    ]);
  }

  Dio get dio => _dio;
  AuthInterceptor get authInterceptor => _authInterceptor;
}
