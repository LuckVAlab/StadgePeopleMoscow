import 'package:dio/dio.dart';
import '../../core/constants/api_constants.dart';
import '../api/dio_client.dart';
import '../models/order_model.dart';

/// Order API service.
class OrderService {
  final DioClient _dioClient = DioClient();

  Future<List<OrderModel>> getOrders() async {
    final dio = _dioClient.dio;
    final response = await dio.get(ApiConstants.orders);
    return (response.data as List).map((e) => OrderModel.fromJson(e)).toList();
  }

  Future<OrderModel> createOrder(OrderModel order) async {
    final dio = _dioClient.dio;
    final response = await dio.post(
      ApiConstants.orders,
      data: order.toJson(),
    );
    return OrderModel.fromJson(response.data);
  }

  Future<OrderModel> respondToOrder(String orderId, String specialistId) async {
    final dio = _dioClient.dio;
    final response = await dio.post(
      '${ApiConstants.orders}/$orderId/respond',
      data: {'specialistId': specialistId},
    );
    return OrderModel.fromJson(response.data);
  }
}
