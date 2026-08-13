// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      specialty: json['specialty'] as String,
      specialties: json['specialties'] as String,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewsCount: (json['reviewsCount'] as num?)?.toInt() ?? 0,
      equipment: (json['equipment'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      skills: (json['skills'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      calendar: (json['calendar'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(int.parse(k), e as bool?),
      ),
      subscription: json['subscription'] as String? ?? 'Free',
      subscriptionExpiresAt: json['subscriptionExpiresAt'] == null
          ? null
          : DateTime.parse(json['subscriptionExpiresAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'specialty': instance.specialty,
      'specialties': instance.specialties,
      'rating': instance.rating,
      'reviewsCount': instance.reviewsCount,
      'equipment': instance.equipment,
      'skills': instance.skills,
      'calendar': instance.calendar?.map((k, e) => MapEntry(k.toString(), e)),
      'subscription': instance.subscription,
      'subscriptionExpiresAt':
          instance.subscriptionExpiresAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
