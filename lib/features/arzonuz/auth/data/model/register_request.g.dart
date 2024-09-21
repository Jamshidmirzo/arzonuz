// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterRequestImpl _$$RegisterRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterRequestImpl(
      address: json['address'] as String,
      email: json['email'] as String,
      fullname: json['fullname'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$$RegisterRequestImplToJson(
        _$RegisterRequestImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'email': instance.email,
      'fullname': instance.fullname,
      'password': instance.password,
      'phone': instance.phone,
      'role': instance.role,
    };
