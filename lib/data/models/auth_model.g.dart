// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginRequestImpl _$$LoginRequestImplFromJson(Map<String, dynamic> json) =>
    _$LoginRequestImpl(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$LoginRequestImplToJson(_$LoginRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

_$RegisterRequestImpl _$$RegisterRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterRequestImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
      specialty: json['specialty'] as String,
    );

Map<String, dynamic> _$$RegisterRequestImplToJson(
        _$RegisterRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'specialty': instance.specialty,
    };

_$AuthResponseImpl _$$AuthResponseImplFromJson(Map<String, dynamic> json) =>
    _$AuthResponseImpl(
      token: json['token'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$$AuthResponseImplToJson(_$AuthResponseImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'userId': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
    };
