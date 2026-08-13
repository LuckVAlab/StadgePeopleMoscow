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
///
/// Uses a singleton pattern so the [AuthInterceptor] is shared across all
/// service instances.
class DioClient {
  static final DioClient _instance = DioClient._internal();
  static AuthInterceptor get authInterceptor => _instance._authInterceptor;

  static DioClient get instance => _instance;

  final AuthInterceptor _authInterceptor = AuthInterceptor();
  late final Dio _dio;

  DioClient._internal() {
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
}
