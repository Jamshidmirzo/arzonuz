// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'card.freezed.dart';
part 'card.g.dart';

@freezed
class CardModel with _$CardModel {
  factory CardModel({
    required String card_number,
    required String expiration_date,
    required String user_id,
    required String card_type,
    required String id,
  }) = _CardModel;

  
  factory CardModel.fromJson(Map<String, Object> json) =>
      _$CardModelImpl.fromJson(json);


}
