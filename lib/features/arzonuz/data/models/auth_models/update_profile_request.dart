// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UpdateProfileRequest {
  String address;
  String fullname;
  String id;
  String phone;
  String photo;
  UpdateProfileRequest({
    required this.address,
    required this.fullname,
    required this.id,
    required this.phone,
    required this.photo,
  });

  UpdateProfileRequest copyWith({
    String? address,
    String? fullname,
    String? id,
    String? phone,
    String? photo,
  }) {
    return UpdateProfileRequest(
      address: address ?? this.address,
      fullname: fullname ?? this.fullname,
      id: id ?? this.id,
      phone: phone ?? this.phone,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address,
      'fullname': fullname,
      'id': id,
      'phone': phone,
      'photo': photo,
    };
  }

  factory UpdateProfileRequest.fromMap(Map<String, dynamic> map) {
    return UpdateProfileRequest(
      address: map['address'] as String,
      fullname: map['fullname'] as String,
      id: map['id'] as String,
      phone: map['phone'] as String,
      photo: map['photo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateProfileRequest.fromJson(String source) =>
      UpdateProfileRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UpdateProfileRequest(address: $address, fullname: $fullname, id: $id, phone: $phone, photo: $photo)';
  }

  @override
  bool operator ==(covariant UpdateProfileRequest other) {
    if (identical(this, other)) return true;

    return other.address == address &&
        other.fullname == fullname &&
        other.id == id &&
        other.phone == phone &&
        other.photo == photo;
  }

  @override
  int get hashCode {
    return address.hashCode ^
        fullname.hashCode ^
        id.hashCode ^
        phone.hashCode ^
        photo.hashCode;
  }
}
