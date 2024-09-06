// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterRequest {
  String address;
  String email;
  String fullname;
  String password;
  String phone;
  String role;
  RegisterRequest({
    required this.address,
    required this.email,
    required this.fullname,
    required this.password,
    required this.phone,
    required this.role,
  });

  RegisterRequest copyWith({
    String? address,
    String? email,
    String? fullname,
    String? password,
    String? phone,
    String? role,
  }) {
    return RegisterRequest(
      address: address ?? this.address,
      email: email ?? this.email,
      fullname: fullname ?? this.fullname,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address,
      'email': email,
      'fullname': fullname,
      'password': password,
      'phone': phone,
      'role': role,
    };
  }

  factory RegisterRequest.fromMap(Map<String, dynamic> map) {
    return RegisterRequest(
      address: map['address'] as String,
      email: map['email'] as String,
      fullname: map['fullname'] as String,
      password: map['password'] as String,
      phone: map['phone'] as String,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterRequest.fromJson(String source) => RegisterRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegisterRequest(address: $address, email: $email, fullname: $fullname, password: $password, phone: $phone, role: $role)';
  }

  @override
  bool operator ==(covariant RegisterRequest other) {
    if (identical(this, other)) return true;
  
    return 
      other.address == address &&
      other.email == email &&
      other.fullname == fullname &&
      other.password == password &&
      other.phone == phone &&
      other.role == role;
  }

  @override
  int get hashCode {
    return address.hashCode ^
      email.hashCode ^
      fullname.hashCode ^
      password.hashCode ^
      phone.hashCode ^
      role.hashCode;
  }
}
