// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ForgotPassRequest {
  String code;
  String email;
  String password;
  ForgotPassRequest({
    required this.code,
    required this.email,
    required this.password,
  });


  ForgotPassRequest copyWith({
    String? code,
    String? email,
    String? password,
  }) {
    return ForgotPassRequest(
      code: code ?? this.code,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'email': email,
      'password': password,
    };
  }

  factory ForgotPassRequest.fromMap(Map<String, dynamic> map) {
    return ForgotPassRequest(
      code: map['code'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ForgotPassRequest.fromJson(String source) => ForgotPassRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ForgotPassRequest(code: $code, email: $email, password: $password)';

  @override
  bool operator ==(covariant ForgotPassRequest other) {
    if (identical(this, other)) return true;
  
    return 
      other.code == code &&
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode => code.hashCode ^ email.hashCode ^ password.hashCode;
}
