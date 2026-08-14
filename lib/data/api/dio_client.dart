import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../core/constants/api_constants.dart';

/// Interceptor that attaches Bearer token to every request.
///
/// Token access is synchronized to prevent race conditions between
/// [onRequest] and [onError] callbacks on the event loop.
class AuthInterceptor extends Interceptor {
  String? _token;
  Future<void>? _lock;

  Future<void> _synchronized(Future<void> Function() fn) async {
    if (_lock != null) await _lock;
    var done = Completer<void>();
    _lock = done.future.whenComplete(() {
      if (_lock == done.future) _lock = null;
    });
    try {
      await fn();
    } finally {
      done.complete();
    }
  }

  void setToken(String token) {
    _token = token;
  }

  void clearToken() {
    _token = null;
  }

  String? _getToken() {
    return _token;
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    await _synchronized(() async {
      final token = _getToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    });
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    await _synchronized(() async {
      // On 401, clear the stale token so the user can re-login
      if (err.response?.statusCode == 401) {
        clearToken();
      }
    });
    handler.next(err);
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
      // LogInterceptor only in debug builds to avoid leaking sensitive data
      // (tokens, emails, passwords) in production.
      if (kDebugMode)
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
