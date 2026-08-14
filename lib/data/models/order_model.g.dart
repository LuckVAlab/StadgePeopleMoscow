// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => _OrderModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      price: json['price'] as String,
      priceCents: (json['priceCents'] as num?)?.toInt(),
      date: json['date'] as String,
      orderDate: json['orderDate'] == null
          ? null
          : DateTime.parse(json['orderDate'] as String),
      location: json['location'] as String,
      time: json['time'] as String,
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => OrderTagModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      clientId: json['clientId'] as String,
      clientName: json['clientName'] as String,
      clientPhone: json['clientPhone'] as String,
      clientRating: (json['clientRating'] as num?)?.toDouble(),
      applicants: (json['applicants'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      selectedSpecialistId: json['selectedSpecialistId'] as String?,
      status: json['status'] as String? ?? 'open',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      isUrgent: json['isUrgent'] as bool? ?? false,
    );

Map<String, dynamic> _$OrderModelToJson(_OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'price': instance.price,
      'priceCents': instance.priceCents,
      'date': instance.date,
      'orderDate': instance.orderDate?.toIso8601String(),
      'location': instance.location,
      'time': instance.time,
      'tags': instance.tags,
      'clientId': instance.clientId,
      'clientName': instance.clientName,
      'clientPhone': instance.clientPhone,
      'clientRating': instance.clientRating,
      'applicants': instance.applicants,
      'selectedSpecialistId': instance.selectedSpecialistId,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'isUrgent': instance.isUrgent,
    };

_OrderTagModel _$OrderTagModelFromJson(Map<String, dynamic> json) =>
    _OrderTagModel(
      text: json['text'] as String,
      isUrgent: json['isUrgent'] as bool? ?? false,
      isGreen: json['isGreen'] as bool? ?? false,
    );

Map<String, dynamic> _$OrderTagModelToJson(_OrderTagModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'isUrgent': instance.isUrgent,
      'isGreen': instance.isGreen,
    };
