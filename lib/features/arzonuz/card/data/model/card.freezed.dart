// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CardModel _$CardModelFromJson(Map<String, dynamic> json) {
  return _CardModel.fromJson(json);
}

/// @nodoc
mixin _$CardModel {
  String get card_number => throw _privateConstructorUsedError;
  String get expiration_date => throw _privateConstructorUsedError;
  String get user_id => throw _privateConstructorUsedError;
  String get card_type => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardModelCopyWith<CardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardModelCopyWith<$Res> {
  factory $CardModelCopyWith(CardModel value, $Res Function(CardModel) then) =
      _$CardModelCopyWithImpl<$Res, CardModel>;
  @useResult
  $Res call(
      {String card_number,
      String expiration_date,
      String user_id,
      String card_type,
      String id});
}

/// @nodoc
class _$CardModelCopyWithImpl<$Res, $Val extends CardModel>
    implements $CardModelCopyWith<$Res> {
  _$CardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? card_number = null,
    Object? expiration_date = null,
    Object? user_id = null,
    Object? card_type = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      card_number: null == card_number
          ? _value.card_number
          : card_number // ignore: cast_nullable_to_non_nullable
              as String,
      expiration_date: null == expiration_date
          ? _value.expiration_date
          : expiration_date // ignore: cast_nullable_to_non_nullable
              as String,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
      card_type: null == card_type
          ? _value.card_type
          : card_type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CardModelImplCopyWith<$Res>
    implements $CardModelCopyWith<$Res> {
  factory _$$CardModelImplCopyWith(
          _$CardModelImpl value, $Res Function(_$CardModelImpl) then) =
      __$$CardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String card_number,
      String expiration_date,
      String user_id,
      String card_type,
      String id});
}

/// @nodoc
class __$$CardModelImplCopyWithImpl<$Res>
    extends _$CardModelCopyWithImpl<$Res, _$CardModelImpl>
    implements _$$CardModelImplCopyWith<$Res> {
  __$$CardModelImplCopyWithImpl(
      _$CardModelImpl _value, $Res Function(_$CardModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? card_number = null,
    Object? expiration_date = null,
    Object? user_id = null,
    Object? card_type = null,
    Object? id = null,
  }) {
    return _then(_$CardModelImpl(
      card_number: null == card_number
          ? _value.card_number
          : card_number // ignore: cast_nullable_to_non_nullable
              as String,
      expiration_date: null == expiration_date
          ? _value.expiration_date
          : expiration_date // ignore: cast_nullable_to_non_nullable
              as String,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
      card_type: null == card_type
          ? _value.card_type
          : card_type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CardModelImpl implements _CardModel {
  _$CardModelImpl(
      {required this.card_number,
      required this.expiration_date,
      required this.user_id,
      required this.card_type,
      required this.id});

  factory _$CardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardModelImplFromJson(json);

  @override
  final String card_number;
  @override
  final String expiration_date;
  @override
  final String user_id;
  @override
  final String card_type;
  @override
  final String id;

  @override
  String toString() {
    return 'CardModel(card_number: $card_number, expiration_date: $expiration_date, user_id: $user_id, card_type: $card_type, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardModelImpl &&
            (identical(other.card_number, card_number) ||
                other.card_number == card_number) &&
            (identical(other.expiration_date, expiration_date) ||
                other.expiration_date == expiration_date) &&
            (identical(other.user_id, user_id) || other.user_id == user_id) &&
            (identical(other.card_type, card_type) ||
                other.card_type == card_type) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, card_number, expiration_date, user_id, card_type, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardModelImplCopyWith<_$CardModelImpl> get copyWith =>
      __$$CardModelImplCopyWithImpl<_$CardModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardModelImplToJson(
      this,
    );
  }
}

abstract class _CardModel implements CardModel {
  factory _CardModel(
      {required final String card_number,
      required final String expiration_date,
      required final String user_id,
      required final String card_type,
      required final String id}) = _$CardModelImpl;

  factory _CardModel.fromJson(Map<String, dynamic> json) =
      _$CardModelImpl.fromJson;

  @override
  String get card_number;
  @override
  String get expiration_date;
  @override
  String get user_id;
  @override
  String get card_type;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$CardModelImplCopyWith<_$CardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
