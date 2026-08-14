import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
sealed class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String name,
    required String email,
    required String phoneNumber,
    required String specialty,
    @Default(0.0) double rating,
    @Default(0) int reviewsCount,
    @Default([]) List<String> equipment,
    @Default([]) List<String> skills,
    Map<int, bool?>? calendar,
    @Default('Free') String subscription,
    DateTime? subscriptionExpiresAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
