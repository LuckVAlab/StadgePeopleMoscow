import 'package:dio/dio.dart';

/// Centralized API error handler.
///
/// Converts DioException and other errors into user-friendly messages
/// and provides structured error info for the UI layer.
class ApiErrorHandler {
  const ApiErrorHandler._();

  /// Returns a user-friendly error message based on the exception.
  static String userMessage(Object error) {
    if (error is DioException) {
      return _dioMessage(error);
    }
    return 'Произошла ошибка. Попробуйте позже.';
  }

  /// Returns structured error info for the UI layer.
  static ApiErrorInfo info(Object error) {
    if (error is DioException) {
      return _dioInfo(error);
    }
    return const ApiErrorInfo(
      type: ApiErrorType.unknown,
      message: 'Произошла ошибка. Попробуйте позже.',
    );
  }

  static String _dioMessage(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Превышено время ожидания. Проверьте соединение.';
      case DioExceptionType.connectionError:
        return 'Нет подключения к интернету.';
      case DioExceptionType.badResponse:
        return _responseMessage(error.response);
      case DioExceptionType.cancel:
        return 'Запрос отменён.';
      case DioExceptionType.unknown:
        return 'Ошибка сети. Проверьте подключение.';
      default:
        return 'Произошла ошибка. Попробуйте позже.';
    }
  }

  static String _responseMessage(Response? response) {
    final statusCode = response?.statusCode;
    final data = response?.data;

    // Extract validation errors from backend
    if (data is Map<String, dynamic>) {
      final errors = data['errors'] as Map<String, dynamic>?;
      if (errors != null && errors.isNotEmpty) {
        final firstError = errors.values.first;
        if (firstError is String) return firstError;
        if (firstError is List && firstError.isNotEmpty) {
          return firstError.first;
        }
      }
      final message = data['message'] as String?;
      if (message != null) return message;
    }

    switch (statusCode) {
      case 400:
        return 'Неверный запрос. Проверьте данные.';
      case 401:
        return 'Сессия истекла. Войдите снова.';
      case 403:
        return 'Доступ запрещён.';
      case 404:
        return 'Сервис временно недоступен.';
      case 422:
        return 'Проверьте правильность введённых данных.';
      case 429:
        return 'Слишком много запросов. Подождите.';
      case 500:
        return 'Ошибка сервера. Попробуйте позже.';
      case 502:
      case 503:
      case 504:
        return 'Сервис временно недоступен.';
      default:
        return 'Ошибка сервера (${statusCode ?? '???'}). Попробуйте позже.';
    }
  }

  static ApiErrorInfo _dioInfo(DioException error) {
    final statusCode = error.response?.statusCode;

    if (statusCode == 401) {
      return const ApiErrorInfo(
        type: ApiErrorType.unauthorized,
        message: 'Сессия истекла. Войдите снова.',
      );
    }

    if (statusCode == 422) {
      return ApiErrorInfo(
        type: ApiErrorType.validation,
        message: _responseMessage(error.response),
        response: error.response?.data,
      );
    }

    if (statusCode != null && (statusCode >= 500)) {
      return ApiErrorInfo(
        type: ApiErrorType.server,
        message: _dioMessage(error),
      );
    }

    if (error.type == DioExceptionType.connectionError) {
      return const ApiErrorInfo(
        type: ApiErrorType.network,
        message: 'Нет подключения к интернету.',
      );
    }

    return ApiErrorInfo(
      type: ApiErrorType.unknown,
      message: _dioMessage(error),
    );
  }
}

/// Structured error information for the UI layer.
class ApiErrorInfo {
  final ApiErrorType type;
  final String message;
  final dynamic response;

  const ApiErrorInfo({
    required this.type,
    required this.message,
    this.response,
  });
}

enum ApiErrorType {
  unauthorized, // 401 — session expired
  validation, // 422 — bad input
  network, // no connection
  server, // 5xx
  unknown, // everything else
}
