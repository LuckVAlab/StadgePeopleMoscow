import 'package:dio/dio.dart';
import '../../core/constants/api_constants.dart';
import '../api/dio_client.dart';
import '../models/order_model.dart';

/// Order API service.
///
/// Replace mock implementations with real API calls when backend is ready.
class OrderService {
  final Dio _dio = DioClient().dio;

  Future<List<OrderModel>> getOrders() async {
    // TODO: Replace with real API call
    // final response = await _dio.get(ApiConstants.orders);
    // return (response.data as List).map((e) => OrderModel.fromJson(e)).toList();

    // Mock data for now
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      OrderModel(
        id: 'order_001',
        title: 'FOH-инженер, фестиваль',
        description: 'Работа на большом фестивале, 3 сцены',
        category: 'Звукорежиссёр',
        price: '25 000 ₽',
        date: '15 авг',
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
        date: '20–22 авг',
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
        date: '18 авг',
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
  }

  Future<OrderModel> createOrder(OrderModel order) async {
    // TODO: Replace with real API call
    // final response = await _dio.post(ApiConstants.orders, data: order.toJson());
    // return OrderModel.fromJson(response.data);

    await Future.delayed(const Duration(milliseconds: 500));
    return order.copyWith(
      id: 'order_${DateTime.now().millisecondsSinceEpoch}',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  Future<OrderModel> respondToOrder(String orderId, String specialistId) async {
    // TODO: Replace with real API call
    await Future.delayed(const Duration(milliseconds: 300));
    return OrderModel(
      id: orderId,
      title: 'Mock Order',
      description: 'Mock',
      category: 'Техник',
      price: '0 ₽',
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
