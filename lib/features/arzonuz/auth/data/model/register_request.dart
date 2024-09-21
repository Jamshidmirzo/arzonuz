// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_request.freezed.dart';
part 'register_request.g.dart';

@freezed
class RegisterRequest with _$RegisterRequest {
  factory RegisterRequest({
    required String address,
    required String email,
    required String fullname,
    required String password,
    required String phone,
    required String role,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, Object> json) =>
      _$RegisterRequestFromJson(json);
}
