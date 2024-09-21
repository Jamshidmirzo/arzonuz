// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardModelImpl _$$CardModelImplFromJson(Map<String, dynamic> json) =>
    _$CardModelImpl(
      card_number: json['card_number'] as String,
      expiration_date: json['expiration_date'] as String,
      user_id: json['user_id'] as String,
      card_type: json['card_type'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$$CardModelImplToJson(_$CardModelImpl instance) =>
    <String, dynamic>{
      'card_number': instance.card_number,
      'expiration_date': instance.expiration_date,
      'user_id': instance.user_id,
      'card_type': instance.card_type,
      'id': instance.id,
    };
