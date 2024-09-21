// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CardRequest cardRequest) cardAddEvent,
    required TResult Function() cardGetEvent,
    required TResult Function(String cardId) carddeleteEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CardRequest cardRequest)? cardAddEvent,
    TResult? Function()? cardGetEvent,
    TResult? Function(String cardId)? carddeleteEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CardRequest cardRequest)? cardAddEvent,
    TResult Function()? cardGetEvent,
    TResult Function(String cardId)? carddeleteEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CardAddEvent value) cardAddEvent,
    required TResult Function(_CardGetEvent value) cardGetEvent,
    required TResult Function(_CardDeleteEvent value) carddeleteEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CardAddEvent value)? cardAddEvent,
    TResult? Function(_CardGetEvent value)? cardGetEvent,
    TResult? Function(_CardDeleteEvent value)? carddeleteEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CardAddEvent value)? cardAddEvent,
    TResult Function(_CardGetEvent value)? cardGetEvent,
    TResult Function(_CardDeleteEvent value)? carddeleteEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardEventCopyWith<$Res> {
  factory $CardEventCopyWith(CardEvent value, $Res Function(CardEvent) then) =
      _$CardEventCopyWithImpl<$Res, CardEvent>;
}

/// @nodoc
class _$CardEventCopyWithImpl<$Res, $Val extends CardEvent>
    implements $CardEventCopyWith<$Res> {
  _$CardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CardAddEventImplCopyWith<$Res> {
  factory _$$CardAddEventImplCopyWith(
          _$CardAddEventImpl value, $Res Function(_$CardAddEventImpl) then) =
      __$$CardAddEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CardRequest cardRequest});

  $CardRequestCopyWith<$Res> get cardRequest;
}

/// @nodoc
class __$$CardAddEventImplCopyWithImpl<$Res>
    extends _$CardEventCopyWithImpl<$Res, _$CardAddEventImpl>
    implements _$$CardAddEventImplCopyWith<$Res> {
  __$$CardAddEventImplCopyWithImpl(
      _$CardAddEventImpl _value, $Res Function(_$CardAddEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardRequest = null,
  }) {
    return _then(_$CardAddEventImpl(
      null == cardRequest
          ? _value.cardRequest
          : cardRequest // ignore: cast_nullable_to_non_nullable
              as CardRequest,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CardRequestCopyWith<$Res> get cardRequest {
    return $CardRequestCopyWith<$Res>(_value.cardRequest, (value) {
      return _then(_value.copyWith(cardRequest: value));
    });
  }
}

/// @nodoc

class _$CardAddEventImpl implements _CardAddEvent {
  _$CardAddEventImpl(this.cardRequest);

  @override
  final CardRequest cardRequest;

  @override
  String toString() {
    return 'CardEvent.cardAddEvent(cardRequest: $cardRequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardAddEventImpl &&
            (identical(other.cardRequest, cardRequest) ||
                other.cardRequest == cardRequest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cardRequest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardAddEventImplCopyWith<_$CardAddEventImpl> get copyWith =>
      __$$CardAddEventImplCopyWithImpl<_$CardAddEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CardRequest cardRequest) cardAddEvent,
    required TResult Function() cardGetEvent,
    required TResult Function(String cardId) carddeleteEvent,
  }) {
    return cardAddEvent(cardRequest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CardRequest cardRequest)? cardAddEvent,
    TResult? Function()? cardGetEvent,
    TResult? Function(String cardId)? carddeleteEvent,
  }) {
    return cardAddEvent?.call(cardRequest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CardRequest cardRequest)? cardAddEvent,
    TResult Function()? cardGetEvent,
    TResult Function(String cardId)? carddeleteEvent,
    required TResult orElse(),
  }) {
    if (cardAddEvent != null) {
      return cardAddEvent(cardRequest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CardAddEvent value) cardAddEvent,
    required TResult Function(_CardGetEvent value) cardGetEvent,
    required TResult Function(_CardDeleteEvent value) carddeleteEvent,
  }) {
    return cardAddEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CardAddEvent value)? cardAddEvent,
    TResult? Function(_CardGetEvent value)? cardGetEvent,
    TResult? Function(_CardDeleteEvent value)? carddeleteEvent,
  }) {
    return cardAddEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CardAddEvent value)? cardAddEvent,
    TResult Function(_CardGetEvent value)? cardGetEvent,
    TResult Function(_CardDeleteEvent value)? carddeleteEvent,
    required TResult orElse(),
  }) {
    if (cardAddEvent != null) {
      return cardAddEvent(this);
    }
    return orElse();
  }
}

abstract class _CardAddEvent implements CardEvent {
  factory _CardAddEvent(final CardRequest cardRequest) = _$CardAddEventImpl;

  CardRequest get cardRequest;
  @JsonKey(ignore: true)
  _$$CardAddEventImplCopyWith<_$CardAddEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CardGetEventImplCopyWith<$Res> {
  factory _$$CardGetEventImplCopyWith(
          _$CardGetEventImpl value, $Res Function(_$CardGetEventImpl) then) =
      __$$CardGetEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CardGetEventImplCopyWithImpl<$Res>
    extends _$CardEventCopyWithImpl<$Res, _$CardGetEventImpl>
    implements _$$CardGetEventImplCopyWith<$Res> {
  __$$CardGetEventImplCopyWithImpl(
      _$CardGetEventImpl _value, $Res Function(_$CardGetEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CardGetEventImpl implements _CardGetEvent {
  _$CardGetEventImpl();

  @override
  String toString() {
    return 'CardEvent.cardGetEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CardGetEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CardRequest cardRequest) cardAddEvent,
    required TResult Function() cardGetEvent,
    required TResult Function(String cardId) carddeleteEvent,
  }) {
    return cardGetEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CardRequest cardRequest)? cardAddEvent,
    TResult? Function()? cardGetEvent,
    TResult? Function(String cardId)? carddeleteEvent,
  }) {
    return cardGetEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CardRequest cardRequest)? cardAddEvent,
    TResult Function()? cardGetEvent,
    TResult Function(String cardId)? carddeleteEvent,
    required TResult orElse(),
  }) {
    if (cardGetEvent != null) {
      return cardGetEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CardAddEvent value) cardAddEvent,
    required TResult Function(_CardGetEvent value) cardGetEvent,
    required TResult Function(_CardDeleteEvent value) carddeleteEvent,
  }) {
    return cardGetEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CardAddEvent value)? cardAddEvent,
    TResult? Function(_CardGetEvent value)? cardGetEvent,
    TResult? Function(_CardDeleteEvent value)? carddeleteEvent,
  }) {
    return cardGetEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CardAddEvent value)? cardAddEvent,
    TResult Function(_CardGetEvent value)? cardGetEvent,
    TResult Function(_CardDeleteEvent value)? carddeleteEvent,
    required TResult orElse(),
  }) {
    if (cardGetEvent != null) {
      return cardGetEvent(this);
    }
    return orElse();
  }
}

abstract class _CardGetEvent implements CardEvent {
  factory _CardGetEvent() = _$CardGetEventImpl;
}

/// @nodoc
abstract class _$$CardDeleteEventImplCopyWith<$Res> {
  factory _$$CardDeleteEventImplCopyWith(_$CardDeleteEventImpl value,
          $Res Function(_$CardDeleteEventImpl) then) =
      __$$CardDeleteEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cardId});
}

/// @nodoc
class __$$CardDeleteEventImplCopyWithImpl<$Res>
    extends _$CardEventCopyWithImpl<$Res, _$CardDeleteEventImpl>
    implements _$$CardDeleteEventImplCopyWith<$Res> {
  __$$CardDeleteEventImplCopyWithImpl(
      _$CardDeleteEventImpl _value, $Res Function(_$CardDeleteEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = null,
  }) {
    return _then(_$CardDeleteEventImpl(
      null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CardDeleteEventImpl implements _CardDeleteEvent {
  _$CardDeleteEventImpl(this.cardId);

  @override
  final String cardId;

  @override
  String toString() {
    return 'CardEvent.carddeleteEvent(cardId: $cardId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardDeleteEventImpl &&
            (identical(other.cardId, cardId) || other.cardId == cardId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cardId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardDeleteEventImplCopyWith<_$CardDeleteEventImpl> get copyWith =>
      __$$CardDeleteEventImplCopyWithImpl<_$CardDeleteEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CardRequest cardRequest) cardAddEvent,
    required TResult Function() cardGetEvent,
    required TResult Function(String cardId) carddeleteEvent,
  }) {
    return carddeleteEvent(cardId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CardRequest cardRequest)? cardAddEvent,
    TResult? Function()? cardGetEvent,
    TResult? Function(String cardId)? carddeleteEvent,
  }) {
    return carddeleteEvent?.call(cardId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CardRequest cardRequest)? cardAddEvent,
    TResult Function()? cardGetEvent,
    TResult Function(String cardId)? carddeleteEvent,
    required TResult orElse(),
  }) {
    if (carddeleteEvent != null) {
      return carddeleteEvent(cardId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CardAddEvent value) cardAddEvent,
    required TResult Function(_CardGetEvent value) cardGetEvent,
    required TResult Function(_CardDeleteEvent value) carddeleteEvent,
  }) {
    return carddeleteEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CardAddEvent value)? cardAddEvent,
    TResult? Function(_CardGetEvent value)? cardGetEvent,
    TResult? Function(_CardDeleteEvent value)? carddeleteEvent,
  }) {
    return carddeleteEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CardAddEvent value)? cardAddEvent,
    TResult Function(_CardGetEvent value)? cardGetEvent,
    TResult Function(_CardDeleteEvent value)? carddeleteEvent,
    required TResult orElse(),
  }) {
    if (carddeleteEvent != null) {
      return carddeleteEvent(this);
    }
    return orElse();
  }
}

abstract class _CardDeleteEvent implements CardEvent {
  factory _CardDeleteEvent(final String cardId) = _$CardDeleteEventImpl;

  String get cardId;
  @JsonKey(ignore: true)
  _$$CardDeleteEventImplCopyWith<_$CardDeleteEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CardState {
  String? get message => throw _privateConstructorUsedError;
  List<CardModel>? get cards => throw _privateConstructorUsedError;
  StatusCard get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardStateCopyWith<CardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardStateCopyWith<$Res> {
  factory $CardStateCopyWith(CardState value, $Res Function(CardState) then) =
      _$CardStateCopyWithImpl<$Res, CardState>;
  @useResult
  $Res call({String? message, List<CardModel>? cards, StatusCard status});
}

/// @nodoc
class _$CardStateCopyWithImpl<$Res, $Val extends CardState>
    implements $CardStateCopyWith<$Res> {
  _$CardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? cards = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      cards: freezed == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CardModel>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusCard,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CardStateImplCopyWith<$Res>
    implements $CardStateCopyWith<$Res> {
  factory _$$CardStateImplCopyWith(
          _$CardStateImpl value, $Res Function(_$CardStateImpl) then) =
      __$$CardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, List<CardModel>? cards, StatusCard status});
}

/// @nodoc
class __$$CardStateImplCopyWithImpl<$Res>
    extends _$CardStateCopyWithImpl<$Res, _$CardStateImpl>
    implements _$$CardStateImplCopyWith<$Res> {
  __$$CardStateImplCopyWithImpl(
      _$CardStateImpl _value, $Res Function(_$CardStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? cards = freezed,
    Object? status = null,
  }) {
    return _then(_$CardStateImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      cards: freezed == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CardModel>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusCard,
    ));
  }
}

/// @nodoc

class _$CardStateImpl implements _CardState {
  _$CardStateImpl(
      {this.message,
      final List<CardModel>? cards,
      this.status = StatusCard.LOADING})
      : _cards = cards;

  @override
  final String? message;
  final List<CardModel>? _cards;
  @override
  List<CardModel>? get cards {
    final value = _cards;
    if (value == null) return null;
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final StatusCard status;

  @override
  String toString() {
    return 'CardState(message: $message, cards: $cards, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardStateImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message,
      const DeepCollectionEquality().hash(_cards), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardStateImplCopyWith<_$CardStateImpl> get copyWith =>
      __$$CardStateImplCopyWithImpl<_$CardStateImpl>(this, _$identity);
}

abstract class _CardState implements CardState {
  factory _CardState(
      {final String? message,
      final List<CardModel>? cards,
      final StatusCard status}) = _$CardStateImpl;

  @override
  String? get message;
  @override
  List<CardModel>? get cards;
  @override
  StatusCard get status;
  @override
  @JsonKey(ignore: true)
  _$$CardStateImplCopyWith<_$CardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
