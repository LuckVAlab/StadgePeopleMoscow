import 'package:dio/dio.dart';
import '../../core/constants/api_constants.dart';
import '../../core/utils/api_error_handler.dart';
import '../api/dio_client.dart';
import '../models/order_model.dart';

/// Order API service.
class OrderService {
  Future<List<OrderModel>> getOrders() async {
    try {
      final dio = DioClient.instance.dio;
      final response = await dio.get(ApiConstants.orders);
      return (response.data as List).map((e) => OrderModel.fromJson(e)).toList();
    } on DioException catch (e) {
      final info = ApiErrorHandler.info(e);
      throw ApiErrorInfo(
        type: info.type,
        message: info.message,
      );
    }
  }

  Future<OrderModel> createOrder(OrderModel order) async {
    try {
      final dio = DioClient.instance.dio;
      final response = await dio.post(
        ApiConstants.orders,
        data: order.toJson(),
      );
      return OrderModel.fromJson(response.data);
    } on DioException catch (e) {
      final info = ApiErrorHandler.info(e);
      throw ApiErrorInfo(
        type: info.type,
        message: info.message,
      );
    }
  }

  Future<OrderModel> respondToOrder(String orderId, String specialistId) async {
    try {
      final dio = DioClient.instance.dio;
      final response = await dio.post(
        '${ApiConstants.orders}/$orderId/respond',
        data: {'specialistId': specialistId},
      );
      return OrderModel.fromJson(response.data);
    } on DioException catch (e) {
      final info = ApiErrorHandler.info(e);
      throw ApiErrorInfo(
        type: info.type,
        message: info.message,
      );
    }
  }
}
