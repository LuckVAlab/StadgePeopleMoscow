import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    required String id,
    required String title,
    required String description,
    required String category,
    required String price,
    required String date,
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
class OrderTagModel with _$OrderTagModel {
  const factory OrderTagModel({
    required String text,
    @Default(false) bool isUrgent,
    @Default(false) bool isGreen,
  }) = _OrderTagModel;

  factory OrderTagModel.fromJson(Map<String, dynamic> json) =>
      _$OrderTagModelFromJson(json);
}
