/// API configuration constants.
///
/// Update [baseUrl] with your production backend address when ready.
class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://api.stadgepeople.moscow/v1';

  // Endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String users = '/users';
  static const String orders = '/orders';
  static const String events = '/events';
  static const String profile = '/profile';
}
