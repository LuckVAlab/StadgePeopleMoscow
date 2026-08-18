import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stadge_people_moscow/core/utils/api_error_handler.dart';
import 'package:stadge_people_moscow/data/models/order_model.dart';
import 'package:stadge_people_moscow/data/services/order_service.dart';

/// Order state managed by Riverpod.
class OrdersNotifier extends StateNotifier<AsyncValue<List<OrderModel>>> {
  final OrderService _orderService;
  bool _initialized = false;
  bool _isInitializing = false;
  String? _currentCategory;

  OrdersNotifier(this._orderService) : super(const AsyncValue.loading());

  /// Lazily load orders on first access.
  /// Protected against concurrent calls — only one request is allowed at a time.
  Future<void> _ensureInitialized() async {
    if (_initialized) return;
    if (_isInitializing) return; // another caller is already loading
    _isInitializing = true;
    try {
      await _doLoadOrders();
    } finally {
      _isInitializing = false;
    }
  }

  /// Actual order loading logic.
  Future<void> _doLoadOrders() async {
    // Defer state update to the next frame to avoid modifying provider state
    // during widget tree building (e.g. when called from initState).
    WidgetsBinding.instance.addPostFrameCallback((_) {
      state = const AsyncValue.loading();
    });
    try {
      final orders = await _orderService.getOrders(category: _currentCategory);
      state = AsyncValue.data(orders);
      _initialized = true; // mark as initialized on success
    } catch (e, stack) {
      final message = e is ApiErrorInfo ? e.message : 'Ошибка загрузки заказов';
      state = AsyncValue.error(message, stack);
      // Reset initialization flag so retry is possible
      _initialized = false;
    }
  }

  /// Reload orders, optionally filtered by category.
  Future<void> loadOrders({String? category}) async {
    _currentCategory = category;
    _initialized = false; // force reload so the new category is applied
    await _ensureInitialized();
  }

  Future<void> addOrder(OrderModel order) async {
    try {
      final createdOrder = await _orderService.createOrder(order);
      final currentOrders = state.value;
      if (currentOrders != null) {
        state = AsyncValue.data([createdOrder, ...currentOrders]);
      } else {
        state = AsyncValue.data([createdOrder]);
      }
    } catch (e, stack) {
      final message = e is ApiErrorInfo ? e.message : 'Ошибка создания заказа';
      state = AsyncValue.error(message, stack);
    }
  }

  /// Respond to an order and update it in the list in place.
  /// Rethrows ApiErrorInfo so callers can distinguish success from failure.
  Future<void> respondToOrder(OrderModel order, String specialistId) async {
    try {
      final updatedOrder = await _orderService.respondToOrder(
        order,
        specialistId,
      );
      final currentOrders = state.value;
      if (currentOrders != null) {
        final updatedOrders = currentOrders.map((o) {
          return o.id == updatedOrder.id ? updatedOrder : o;
        }).toList();
        state = AsyncValue.data(updatedOrders);
      } else {
        state = AsyncValue.data([updatedOrder]);
      }
    } catch (e, stack) {
      final message = e is ApiErrorInfo ? e.message : 'Ошибка отклика';
      state = AsyncValue.error(message, stack);
      rethrow;
    }
  }
}

final orderServiceProvider = Provider((ref) => OrderService());

final ordersProvider =
    StateNotifierProvider<OrdersNotifier, AsyncValue<List<OrderModel>>>(
  (ref) => OrdersNotifier(ref.watch(orderServiceProvider)),
);
