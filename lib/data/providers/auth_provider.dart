import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stadge_people_moscow/data/models/auth_model.dart';
import 'package:stadge_people_moscow/data/services/auth_service.dart';

/// Authentication state.
enum AuthStatus { initial, loading, authenticated, unauthenticated }

class AuthNotifier extends StateNotifier<AsyncValue<AuthStatus>> {
  final AuthService _authService;
  AuthResponse? _currentUser;

  AuthNotifier(this._authService)
      : super(const AsyncValue.data(AuthStatus.initial)) {
    _restoreSession();
  }

  AuthResponse? get currentUser => _currentUser;

  Future<void> _restoreSession() async {
    final token = _authService.restoreToken();
    if (token != null) {
      final userJson = AuthService.storage.getUser();
      if (userJson != null) {
        try {
          _currentUser = AuthResponse.fromJson(
            (jsonDecode(userJson) as Map<String, dynamic>),
          );
        } catch (_) {
          // Corrupted user data, just restore auth state
        }
      }
      state = const AsyncValue.data(AuthStatus.authenticated);
    }
  }

  Future<void> login(LoginRequest request) async {
    state = const AsyncValue.loading();
    try {
      _currentUser = await _authService.login(request);
      state = const AsyncValue.data(AuthStatus.authenticated);
    } catch (e, stack) {
      // Only reset to unauthenticated if we were previously initial/loading.
      // Don't flip authenticated users to unauthenticated on transient errors.
      final current = state.value;
      if (current == AuthStatus.initial || current == AuthStatus.loading) {
        state = AsyncValue.error(
          e,
          stack,
        );
      } else {
        // Authenticated user encounters a transient error — keep current state
        // and surface the error without breaking the UI.
        state = AsyncValue.data(current!);
      }
      rethrow;
    }
  }

  Future<void> register(RegisterRequest request) async {
    state = const AsyncValue.loading();
    try {
      _currentUser = await _authService.register(request);
      state = const AsyncValue.data(AuthStatus.authenticated);
    } catch (e, stack) {
      final current = state.value;
      if (current == AuthStatus.initial || current == AuthStatus.loading) {
        state = AsyncValue.error(
          e,
          stack,
        );
      } else {
        state = AsyncValue.data(current!);
      }
      rethrow;
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    _currentUser = null;
    state = const AsyncValue.data(AuthStatus.unauthenticated);
  }

  /// Update the current user profile on the server and persist locally.
  Future<void> updateProfile(AuthResponse updates) async {
    try {
      final updated = await _authService.updateProfile(updates);
      _currentUser = updated;
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }
}

final authServiceProvider = Provider<AuthService>((ref) {
  final service = AuthService();
  return service;
});

final authProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<AuthStatus>>(
  (ref) => AuthNotifier(ref.watch(authServiceProvider)),
);
