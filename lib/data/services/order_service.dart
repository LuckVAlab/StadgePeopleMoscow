import 'package:dio/dio.dart';
import 'package:stadge_people_moscow/core/constants/api_constants.dart';
import 'package:stadge_people_moscow/core/utils/api_error_handler.dart';
import 'package:stadge_people_moscow/data/api/dio_client.dart';
import 'package:stadge_people_moscow/data/models/order_model.dart';

/// Order API service.
class OrderService {
  // Set via --dart-define=USE_MOCK=true when building for development
  static const bool _useMock =
      bool.fromEnvironment('USE_MOCK', defaultValue: false);

  Future<List<OrderModel>> getOrders({String? category}) async {
    if (_useMock) return _mockGetOrders(category: category);

    try {
      final dio = DioClient.instance.dio;
      final response = await dio.get(
        ApiConstants.orders,
        queryParameters: category != null ? {'category': category} : null,
      );
      return (response.data as List)
          .map((e) => OrderModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      final info = ApiErrorHandler.info(e);
      throw ApiErrorInfo(
        type: info.type,
        message: info.message,
      );
    }
  }

  Future<OrderModel> createOrder(OrderModel order) async {
    if (_useMock) return _mockCreateOrder(order);

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
    if (_useMock) return _mockRespondToOrder(orderId, specialistId);

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

  // ─── Mock implementations ───

  Future<List<OrderModel>> _mockGetOrders({String? category}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final allOrders = <OrderModel>[
      OrderModel(
        id: 'order_001',
        title: 'FOH-инженер, фестиваль',
        description: 'Работа на большом фестивале, 3 сцены',
        category: 'Звукорежиссёр',
        price: '25 000 ₽',
        priceCents: 2500000,
        date: '15 авг',
        orderDate: DateTime(2026, 8, 15),
        location: 'Москва',
        time: '12:00–02:00',
        tags: [
          const OrderTagModel(text: 'Срочно', isUrgent: true),
          const OrderTagModel(text: 'DiGiCo SD5'),
          const OrderTagModel(text: 'Опыт 3+ года'),
        ],
        clientId: 'client_001',
        clientName: 'EventPro LLC',
        clientPhone: '+7 (999) 123-45-67',
        clientRating: 4.8,
        status: 'open',
        isUrgent: true,
      ),
      OrderModel(
        id: 'order_002',
        title: 'Бэклайнер, клубный тур',
        description: 'Тур по клубам России, 5 городов',
        category: 'Бэклайнер',
        price: '18 000 ₽',
        priceCents: 1800000,
        date: '20–22 авг',
        orderDate: DateTime(2026, 8, 20),
        location: 'СПб',
        time: '3 дня',
        tags: [
          const OrderTagModel(text: 'Fender, Marshall'),
          const OrderTagModel(text: 'Свой сетап', isGreen: true),
        ],
        clientId: 'client_002',
        clientName: 'RockBand Manager',
        clientPhone: '+7 (999) 987-65-43',
        status: 'open',
      ),
      OrderModel(
        id: 'order_003',
        title: 'Monitor-инженер',
        description: 'Корпоративное мероприятие',
        category: 'Техник',
        price: '20 000 ₽',
        priceCents: 2000000,
        date: '18 авг',
        orderDate: DateTime(2026, 8, 18),
        location: 'Москва',
        time: '16:00–00:00',
        tags: [
          const OrderTagModel(text: 'Yamaha Rivage'),
          const OrderTagModel(text: 'In-Ear'),
        ],
        clientId: 'client_003',
        clientName: 'Корпорация А',
        clientPhone: '+7 (999) 555-44-33',
        status: 'open',
      ),
    ];

    // Server-side category filter
    if (category != null && category != 'Все') {
      return allOrders.where((o) => o.category == category).toList();
    }
    return allOrders;
  }

  Future<OrderModel> _mockCreateOrder(OrderModel order) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return order.copyWith(
      id: 'order_${DateTime.now().millisecondsSinceEpoch}',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  Future<OrderModel> _mockRespondToOrder(
      String orderId, String specialistId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return OrderModel(
      id: orderId,
      title: 'Mock Order',
      description: 'Mock',
      category: 'Техник',
      price: '0 ₽',
      priceCents: 0,
      date: '---',
      location: '---',
      time: '---',
      clientId: '---',
      clientName: '---',
      clientPhone: '---',
      applicants: [specialistId],
      status: 'in_progress',
    );
  }
}
