// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardRequestImpl _$$CardRequestImplFromJson(Map<String, dynamic> json) =>
    _$CardRequestImpl(
      card_number: json['card_number'] as String,
      ccv: json['ccv'] as String,
      expiration_date: json['expiration_date'] as String,
    );

Map<String, dynamic> _$$CardRequestImplToJson(_$CardRequestImpl instance) =>
    <String, dynamic>{
      'card_number': instance.card_number,
      'ccv': instance.ccv,
      'expiration_date': instance.expiration_date,
    };
