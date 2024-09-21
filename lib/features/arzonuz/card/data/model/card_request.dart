// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';
part 'card_request.freezed.dart';
part 'card_request.g.dart';

@freezed
class CardRequest with _$CardRequest {
  factory CardRequest(
      {required String card_number,
      required String ccv,
      required String expiration_date}) = _CardRequest;

  factory CardRequest.fromJson(Map<String, Object> json) =>
      _$CardRequestImpl.fromJson(json);
}
