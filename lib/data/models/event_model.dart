import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_model.freezed.dart';
part 'event_model.g.dart';

@freezed
class EventModel with _$EventModel {
  const factory EventModel({
    required String id,
    required String title,
    required String description,
    required String type,
    required String location,
    required DateTime startDate,
    required DateTime endDate,
    required String organizer,
    @Default([]) List<String> requiredSpecialists,
    @Default({}) Map<String, List<String>> teamMembers,
    @Default(0.0) double budget,
    @Default('planning') String status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _EventModel;

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);
}
