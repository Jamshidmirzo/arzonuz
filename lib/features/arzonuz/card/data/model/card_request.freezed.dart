// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CardRequest _$CardRequestFromJson(Map<String, dynamic> json) {
  return _CardRequest.fromJson(json);
}

/// @nodoc
mixin _$CardRequest {
  String get card_number => throw _privateConstructorUsedError;
  String get ccv => throw _privateConstructorUsedError;
  String get expiration_date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardRequestCopyWith<CardRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardRequestCopyWith<$Res> {
  factory $CardRequestCopyWith(
          CardRequest value, $Res Function(CardRequest) then) =
      _$CardRequestCopyWithImpl<$Res, CardRequest>;
  @useResult
  $Res call({String card_number, String ccv, String expiration_date});
}

/// @nodoc
class _$CardRequestCopyWithImpl<$Res, $Val extends CardRequest>
    implements $CardRequestCopyWith<$Res> {
  _$CardRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? card_number = null,
    Object? ccv = null,
    Object? expiration_date = null,
  }) {
    return _then(_value.copyWith(
      card_number: null == card_number
          ? _value.card_number
          : card_number // ignore: cast_nullable_to_non_nullable
              as String,
      ccv: null == ccv
          ? _value.ccv
          : ccv // ignore: cast_nullable_to_non_nullable
              as String,
      expiration_date: null == expiration_date
          ? _value.expiration_date
          : expiration_date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CardRequestImplCopyWith<$Res>
    implements $CardRequestCopyWith<$Res> {
  factory _$$CardRequestImplCopyWith(
          _$CardRequestImpl value, $Res Function(_$CardRequestImpl) then) =
      __$$CardRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String card_number, String ccv, String expiration_date});
}

/// @nodoc
class __$$CardRequestImplCopyWithImpl<$Res>
    extends _$CardRequestCopyWithImpl<$Res, _$CardRequestImpl>
    implements _$$CardRequestImplCopyWith<$Res> {
  __$$CardRequestImplCopyWithImpl(
      _$CardRequestImpl _value, $Res Function(_$CardRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? card_number = null,
    Object? ccv = null,
    Object? expiration_date = null,
  }) {
    return _then(_$CardRequestImpl(
      card_number: null == card_number
          ? _value.card_number
          : card_number // ignore: cast_nullable_to_non_nullable
              as String,
      ccv: null == ccv
          ? _value.ccv
          : ccv // ignore: cast_nullable_to_non_nullable
              as String,
      expiration_date: null == expiration_date
          ? _value.expiration_date
          : expiration_date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CardRequestImpl implements _CardRequest {
  _$CardRequestImpl(
      {required this.card_number,
      required this.ccv,
      required this.expiration_date});

  factory _$CardRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardRequestImplFromJson(json);

  @override
  final String card_number;
  @override
  final String ccv;
  @override
  final String expiration_date;

  @override
  String toString() {
    return 'CardRequest(card_number: $card_number, ccv: $ccv, expiration_date: $expiration_date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardRequestImpl &&
            (identical(other.card_number, card_number) ||
                other.card_number == card_number) &&
            (identical(other.ccv, ccv) || other.ccv == ccv) &&
            (identical(other.expiration_date, expiration_date) ||
                other.expiration_date == expiration_date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, card_number, ccv, expiration_date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardRequestImplCopyWith<_$CardRequestImpl> get copyWith =>
      __$$CardRequestImplCopyWithImpl<_$CardRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardRequestImplToJson(
      this,
    );
  }
}

abstract class _CardRequest implements CardRequest {
  factory _CardRequest(
      {required final String card_number,
      required final String ccv,
      required final String expiration_date}) = _$CardRequestImpl;

  factory _CardRequest.fromJson(Map<String, dynamic> json) =
      _$CardRequestImpl.fromJson;

  @override
  String get card_number;
  @override
  String get ccv;
  @override
  String get expiration_date;
  @override
  @JsonKey(ignore: true)
  _$$CardRequestImplCopyWith<_$CardRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
