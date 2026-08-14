import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
sealed class OrderModel with _$OrderModel {
  const factory OrderModel({
    required String id,
    required String title,
    required String description,
    required String category,

    /// Raw price string for display (e.g. "25 000 ₽").
    required String price,

    /// Price in smallest currency unit for sorting/comparison.
    /// Defaults to 0 if the backend omits it.
    int? priceCents,

    /// Raw date string for display (e.g. "15 авг").
    required String date,

    /// Parsed date for sorting/filtering.
    DateTime? orderDate,
    required String location,
    required String time,
    @Default([]) List<OrderTagModel> tags,
    required String clientId,
    required String clientName,
    required String clientPhone,
    double? clientRating,
    @Default([]) List<String> applicants,
    String? selectedSpecialistId,
    @Default('open') String status,
    DateTime? createdAt,
    DateTime? updatedAt,
    @Default(false) bool isUrgent,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

@freezed
sealed class OrderTagModel with _$OrderTagModel {
  const factory OrderTagModel({
    required String text,
    @Default(false) bool isUrgent,
    @Default(false) bool isGreen,
  }) = _OrderTagModel;

  factory OrderTagModel.fromJson(Map<String, dynamic> json) =>
      _$OrderTagModelFromJson(json);
}
