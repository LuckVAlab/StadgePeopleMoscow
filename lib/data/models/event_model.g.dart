// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventModelImpl _$$EventModelImplFromJson(Map<String, dynamic> json) =>
    _$EventModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      location: json['location'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      organizer: json['organizer'] as String,
      requiredSpecialists: (json['requiredSpecialists'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      teamMembers: (json['teamMembers'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k, (e as List<dynamic>).map((e) => e as String).toList()),
          ) ??
          const {},
      budget: (json['budget'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] as String? ?? 'planning',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$EventModelImplToJson(_$EventModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'location': instance.location,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'organizer': instance.organizer,
      'requiredSpecialists': instance.requiredSpecialists,
      'teamMembers': instance.teamMembers,
      'budget': instance.budget,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
