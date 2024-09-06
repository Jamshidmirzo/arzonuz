// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String address;
  String createdAt;
  String email;
  String fullname;
  String id;
  String phone;
  String photo;
  String role;
  UserModel({
    required this.address,
    required this.createdAt,
    required this.email,
    required this.fullname,
    required this.id,
    required this.phone,
    required this.photo,
    required this.role,
  });

  UserModel copyWith({
    String? address,
    String? createdAt,
    String? email,
    String? fullname,
    String? id,
    String? phone,
    String? photo,
    String? role,
  }) {
    return UserModel(
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
      email: email ?? this.email,
      fullname: fullname ?? this.fullname,
      id: id ?? this.id,
      phone: phone ?? this.phone,
      photo: photo ?? this.photo,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address,
      'createdAt': createdAt,
      'email': email,
      'fullname': fullname,
      'id': id,
      'phone': phone,
      'photo': photo,
      'role': role,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      address: map['address'] ?? 'Not Selected',
      createdAt: map['createdAt'] ?? '',
      email: map['email'] ?? '',
      fullname: map['fullname'] ?? '',
      id: map['id'] ?? '',
      phone: map['phone'] ?? '',
      photo: map['photo'] ??
          'https://i.pinimg.com/736x/61/f7/5e/61f75ea9a680def2ed1c6929fe75aeee.jpg',
      role: map['role'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(address: $address, createdAt: $createdAt, email: $email, fullname: $fullname, id: $id, phone: $phone, photo: $photo, role: $role)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.address == address &&
        other.createdAt == createdAt &&
        other.email == email &&
        other.fullname == fullname &&
        other.id == id &&
        other.phone == phone &&
        other.photo == photo &&
        other.role == role;
  }

  @override
  int get hashCode {
    return address.hashCode ^
        createdAt.hashCode ^
        email.hashCode ^
        fullname.hashCode ^
        id.hashCode ^
        phone.hashCode ^
        photo.hashCode ^
        role.hashCode;
  }
}
