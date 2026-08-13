import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/order_model.dart';
import '../services/order_service.dart';

/// Order state managed by Riverpod.
/// Replace with real API integration later.
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
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> addOrder(OrderModel order) async {
    try {
      final createdOrder = await _orderService.createOrder(order);
      state.whenData(
          (orders) => state = AsyncValue.data([createdOrder, ...orders]));
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
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
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

final orderServiceProvider = Provider((ref) => OrderService());

final ordersProvider =
    StateNotifierProvider<OrdersNotifier, AsyncValue<List<OrderModel>>>(
  (ref) => OrdersNotifier(ref.watch(orderServiceProvider)),
);
