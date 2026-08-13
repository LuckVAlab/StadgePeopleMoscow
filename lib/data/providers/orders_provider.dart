import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/order_model.dart';
import '../services/order_service.dart';
import '../core/utils/api_error_handler.dart';

/// Order state managed by Riverpod.
class OrdersNotifier extends StateNotifier<AsyncValue<List<OrderModel>>> {
  final OrderService _orderService;

  OrdersNotifier(this._orderService) : super(const AsyncValue.loading()) {
    loadOrders();
  }

  Future<void> loadOrders() async {
    state = const AsyncValue.loading();
    try {
      final orders = await _orderService.getOrders();
      state = AsyncValue.data(orders);
    } catch (e) {
      final message = e is ApiErrorInfo ? e.message : 'Ошибка загрузки заказов';
      state = AsyncValue.error(message, StackTrace.current);
    }
  }

  Future<void> addOrder(OrderModel order) async {
    try {
      final createdOrder = await _orderService.createOrder(order);
      state.whenData(
          (orders) => state = AsyncValue.data([createdOrder, ...orders]));
    } catch (e) {
      final message = e is ApiErrorInfo ? e.message : 'Ошибка создания заказа';
      state = AsyncValue.error(message, StackTrace.current);
    }
  }

  Future<void> respondToOrder(String orderId, String specialistId) async {
    try {
      final updatedOrder =
          await _orderService.respondToOrder(orderId, specialistId);
      state.whenData((orders) {
        final updatedOrders = orders.map((o) {
          return o.id == orderId ? updatedOrder : o;
        }).toList();
        state = AsyncValue.data(updatedOrders);
      });
    } catch (e) {
      final message = e is ApiErrorInfo ? e.message : 'Ошибка отклика';
      state = AsyncValue.error(message, StackTrace.current);
    }
  }
}

final orderServiceProvider = Provider((ref) => OrderService());

final ordersProvider =
    StateNotifierProvider<OrdersNotifier, AsyncValue<List<OrderModel>>>(
  (ref) => OrdersNotifier(ref.watch(orderServiceProvider)),
);
