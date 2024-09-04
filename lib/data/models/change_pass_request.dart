// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChangePassRequest {
  String id;
  String newpassword;
  String oldpassword;
  ChangePassRequest({
    required this.id,
    required this.newpassword,
    required this.oldpassword,
  });

  ChangePassRequest copyWith({
    String? id,
    String? newpassword,
    String? oldpassword,
  }) {
    return ChangePassRequest(
      id: id ?? this.id,
      newpassword: newpassword ?? this.newpassword,
      oldpassword: oldpassword ?? this.oldpassword,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'newpassword': newpassword,
      'oldpassword': oldpassword,
    };
  }

  factory ChangePassRequest.fromMap(Map<String, dynamic> map) {
    return ChangePassRequest(
      id: map['id'] as String,
      newpassword: map['newpassword'] as String,
      oldpassword: map['oldpassword'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChangePassRequest.fromJson(String source) =>
      ChangePassRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ChangePassRequest(id: $id, newpassword: $newpassword, oldpassword: $oldpassword)';

  @override
  bool operator ==(covariant ChangePassRequest other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.newpassword == newpassword &&
        other.oldpassword == oldpassword;
  }

  @override
  int get hashCode => id.hashCode ^ newpassword.hashCode ^ oldpassword.hashCode;
}
