import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/auth_model.dart';
import '../services/auth_service.dart';
import '../services/storage_service.dart';

/// Authentication state.
enum AuthState { unauthenticated, authenticated }

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService _authService;
  AuthResponse? _currentUser;

  AuthNotifier(this._authService) : super(AuthState.unauthenticated) {
    _restoreSession();
  }

  AuthResponse? get currentUser => _currentUser;

  Future<void> _restoreSession() async {
    final token = _authService.restoreToken();
    if (token != null) {
      state = AuthState.authenticated;
    }
  }

  Future<void> login(LoginRequest request) async {
    try {
      _currentUser = await _authService.login(request);
      state = AuthState.authenticated;
    } catch (e) {
      state = AuthState.unauthenticated;
      rethrow;
    }
  }

  Future<void> register(RegisterRequest request) async {
    try {
      _currentUser = await _authService.register(request);
      state = AuthState.authenticated;
    } catch (e) {
      state = AuthState.unauthenticated;
      rethrow;
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    _currentUser = null;
    state = AuthState.unauthenticated;
  }
}

final storageServiceProvider = Provider((ref) => StorageService());

final authServiceProvider = Provider((ref) async {
  final service = AuthService();
  await service.init();
  return service;
});

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.watch(authServiceProvider)),
);
