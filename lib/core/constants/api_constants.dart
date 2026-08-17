/// API configuration constants.
///
/// Update [baseUrl] with your production backend address when ready.
class ApiConstants {
  ApiConstants._();

  // Local development backend (Express + SQLite).
  // For production, replace with https://api.stadgepeople.moscow/v1
  static const String baseUrl = 'http://localhost:8080/v1';

  // Endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String orders = '/orders';
  static const String profile = '/profile';
  static const String logout = '/auth/logout';
}
