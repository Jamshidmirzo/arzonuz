// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authLogout,
    required TResult Function(AuthRegisterParams registerRequest) authRegister,
    required TResult Function(ResetPassRequestParams forgotPassRequest)
        authReset,
    required TResult Function(AuthForgotParams email) authForgot,
    required TResult Function(AuthLoginParams loginRequest) authLogin,
    required TResult Function(String? refreshToken, String? userId) authCheck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authLogout,
    TResult? Function(AuthRegisterParams registerRequest)? authRegister,
    TResult? Function(ResetPassRequestParams forgotPassRequest)? authReset,
    TResult? Function(AuthForgotParams email)? authForgot,
    TResult? Function(AuthLoginParams loginRequest)? authLogin,
    TResult? Function(String? refreshToken, String? userId)? authCheck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authLogout,
    TResult Function(AuthRegisterParams registerRequest)? authRegister,
    TResult Function(ResetPassRequestParams forgotPassRequest)? authReset,
    TResult Function(AuthForgotParams email)? authForgot,
    TResult Function(AuthLoginParams loginRequest)? authLogin,
    TResult Function(String? refreshToken, String? userId)? authCheck,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthLogoutEvent value) authLogout,
    required TResult Function(_AuthRegisterEvent value) authRegister,
    required TResult Function(_AuthResetEvent value) authReset,
    required TResult Function(_AuthForgotEvent value) authForgot,
    required TResult Function(_AuthLoginEvent value) authLogin,
    required TResult Function(_AuthCheckStatusEvent value) authCheck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthLogoutEvent value)? authLogout,
    TResult? Function(_AuthRegisterEvent value)? authRegister,
    TResult? Function(_AuthResetEvent value)? authReset,
    TResult? Function(_AuthForgotEvent value)? authForgot,
    TResult? Function(_AuthLoginEvent value)? authLogin,
    TResult? Function(_AuthCheckStatusEvent value)? authCheck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthLogoutEvent value)? authLogout,
    TResult Function(_AuthRegisterEvent value)? authRegister,
    TResult Function(_AuthResetEvent value)? authReset,
    TResult Function(_AuthForgotEvent value)? authForgot,
    TResult Function(_AuthLoginEvent value)? authLogin,
    TResult Function(_AuthCheckStatusEvent value)? authCheck,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthLogoutEventImplCopyWith<$Res> {
  factory _$$AuthLogoutEventImplCopyWith(_$AuthLogoutEventImpl value,
          $Res Function(_$AuthLogoutEventImpl) then) =
      __$$AuthLogoutEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLogoutEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthLogoutEventImpl>
    implements _$$AuthLogoutEventImplCopyWith<$Res> {
  __$$AuthLogoutEventImplCopyWithImpl(
      _$AuthLogoutEventImpl _value, $Res Function(_$AuthLogoutEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthLogoutEventImpl
    with DiagnosticableTreeMixin
    implements _AuthLogoutEvent {
  const _$AuthLogoutEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.authLogout()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthEvent.authLogout'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLogoutEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authLogout,
    required TResult Function(AuthRegisterParams registerRequest) authRegister,
    required TResult Function(ResetPassRequestParams forgotPassRequest)
        authReset,
    required TResult Function(AuthForgotParams email) authForgot,
    required TResult Function(AuthLoginParams loginRequest) authLogin,
    required TResult Function(String? refreshToken, String? userId) authCheck,
  }) {
    return authLogout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authLogout,
    TResult? Function(AuthRegisterParams registerRequest)? authRegister,
    TResult? Function(ResetPassRequestParams forgotPassRequest)? authReset,
    TResult? Function(AuthForgotParams email)? authForgot,
    TResult? Function(AuthLoginParams loginRequest)? authLogin,
    TResult? Function(String? refreshToken, String? userId)? authCheck,
  }) {
    return authLogout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authLogout,
    TResult Function(AuthRegisterParams registerRequest)? authRegister,
    TResult Function(ResetPassRequestParams forgotPassRequest)? authReset,
    TResult Function(AuthForgotParams email)? authForgot,
    TResult Function(AuthLoginParams loginRequest)? authLogin,
    TResult Function(String? refreshToken, String? userId)? authCheck,
    required TResult orElse(),
  }) {
    if (authLogout != null) {
      return authLogout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthLogoutEvent value) authLogout,
    required TResult Function(_AuthRegisterEvent value) authRegister,
    required TResult Function(_AuthResetEvent value) authReset,
    required TResult Function(_AuthForgotEvent value) authForgot,
    required TResult Function(_AuthLoginEvent value) authLogin,
    required TResult Function(_AuthCheckStatusEvent value) authCheck,
  }) {
    return authLogout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthLogoutEvent value)? authLogout,
    TResult? Function(_AuthRegisterEvent value)? authRegister,
    TResult? Function(_AuthResetEvent value)? authReset,
    TResult? Function(_AuthForgotEvent value)? authForgot,
    TResult? Function(_AuthLoginEvent value)? authLogin,
    TResult? Function(_AuthCheckStatusEvent value)? authCheck,
  }) {
    return authLogout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthLogoutEvent value)? authLogout,
    TResult Function(_AuthRegisterEvent value)? authRegister,
    TResult Function(_AuthResetEvent value)? authReset,
    TResult Function(_AuthForgotEvent value)? authForgot,
    TResult Function(_AuthLoginEvent value)? authLogin,
    TResult Function(_AuthCheckStatusEvent value)? authCheck,
    required TResult orElse(),
  }) {
    if (authLogout != null) {
      return authLogout(this);
    }
    return orElse();
  }
}

abstract class _AuthLogoutEvent implements AuthEvent {
  const factory _AuthLogoutEvent() = _$AuthLogoutEventImpl;
}

/// @nodoc
abstract class _$$AuthRegisterEventImplCopyWith<$Res> {
  factory _$$AuthRegisterEventImplCopyWith(_$AuthRegisterEventImpl value,
          $Res Function(_$AuthRegisterEventImpl) then) =
      __$$AuthRegisterEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthRegisterParams registerRequest});
}

/// @nodoc
class __$$AuthRegisterEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthRegisterEventImpl>
    implements _$$AuthRegisterEventImplCopyWith<$Res> {
  __$$AuthRegisterEventImplCopyWithImpl(_$AuthRegisterEventImpl _value,
      $Res Function(_$AuthRegisterEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerRequest = null,
  }) {
    return _then(_$AuthRegisterEventImpl(
      null == registerRequest
          ? _value.registerRequest
          : registerRequest // ignore: cast_nullable_to_non_nullable
              as AuthRegisterParams,
    ));
  }
}

/// @nodoc

class _$AuthRegisterEventImpl
    with DiagnosticableTreeMixin
    implements _AuthRegisterEvent {
  const _$AuthRegisterEventImpl(this.registerRequest);

  @override
  final AuthRegisterParams registerRequest;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.authRegister(registerRequest: $registerRequest)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.authRegister'))
      ..add(DiagnosticsProperty('registerRequest', registerRequest));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthRegisterEventImpl &&
            (identical(other.registerRequest, registerRequest) ||
                other.registerRequest == registerRequest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, registerRequest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthRegisterEventImplCopyWith<_$AuthRegisterEventImpl> get copyWith =>
      __$$AuthRegisterEventImplCopyWithImpl<_$AuthRegisterEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authLogout,
    required TResult Function(AuthRegisterParams registerRequest) authRegister,
    required TResult Function(ResetPassRequestParams forgotPassRequest)
        authReset,
    required TResult Function(AuthForgotParams email) authForgot,
    required TResult Function(AuthLoginParams loginRequest) authLogin,
    required TResult Function(String? refreshToken, String? userId) authCheck,
  }) {
    return authRegister(registerRequest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authLogout,
    TResult? Function(AuthRegisterParams registerRequest)? authRegister,
    TResult? Function(ResetPassRequestParams forgotPassRequest)? authReset,
    TResult? Function(AuthForgotParams email)? authForgot,
    TResult? Function(AuthLoginParams loginRequest)? authLogin,
    TResult? Function(String? refreshToken, String? userId)? authCheck,
  }) {
    return authRegister?.call(registerRequest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authLogout,
    TResult Function(AuthRegisterParams registerRequest)? authRegister,
    TResult Function(ResetPassRequestParams forgotPassRequest)? authReset,
    TResult Function(AuthForgotParams email)? authForgot,
    TResult Function(AuthLoginParams loginRequest)? authLogin,
    TResult Function(String? refreshToken, String? userId)? authCheck,
    required TResult orElse(),
  }) {
    if (authRegister != null) {
      return authRegister(registerRequest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthLogoutEvent value) authLogout,
    required TResult Function(_AuthRegisterEvent value) authRegister,
    required TResult Function(_AuthResetEvent value) authReset,
    required TResult Function(_AuthForgotEvent value) authForgot,
    required TResult Function(_AuthLoginEvent value) authLogin,
    required TResult Function(_AuthCheckStatusEvent value) authCheck,
  }) {
    return authRegister(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthLogoutEvent value)? authLogout,
    TResult? Function(_AuthRegisterEvent value)? authRegister,
    TResult? Function(_AuthResetEvent value)? authReset,
    TResult? Function(_AuthForgotEvent value)? authForgot,
    TResult? Function(_AuthLoginEvent value)? authLogin,
    TResult? Function(_AuthCheckStatusEvent value)? authCheck,
  }) {
    return authRegister?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthLogoutEvent value)? authLogout,
    TResult Function(_AuthRegisterEvent value)? authRegister,
    TResult Function(_AuthResetEvent value)? authReset,
    TResult Function(_AuthForgotEvent value)? authForgot,
    TResult Function(_AuthLoginEvent value)? authLogin,
    TResult Function(_AuthCheckStatusEvent value)? authCheck,
    required TResult orElse(),
  }) {
    if (authRegister != null) {
      return authRegister(this);
    }
    return orElse();
  }
}

abstract class _AuthRegisterEvent implements AuthEvent {
  const factory _AuthRegisterEvent(final AuthRegisterParams registerRequest) =
      _$AuthRegisterEventImpl;

  AuthRegisterParams get registerRequest;
  @JsonKey(ignore: true)
  _$$AuthRegisterEventImplCopyWith<_$AuthRegisterEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthResetEventImplCopyWith<$Res> {
  factory _$$AuthResetEventImplCopyWith(_$AuthResetEventImpl value,
          $Res Function(_$AuthResetEventImpl) then) =
      __$$AuthResetEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ResetPassRequestParams forgotPassRequest});
}

/// @nodoc
class __$$AuthResetEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthResetEventImpl>
    implements _$$AuthResetEventImplCopyWith<$Res> {
  __$$AuthResetEventImplCopyWithImpl(
      _$AuthResetEventImpl _value, $Res Function(_$AuthResetEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forgotPassRequest = null,
  }) {
    return _then(_$AuthResetEventImpl(
      null == forgotPassRequest
          ? _value.forgotPassRequest
          : forgotPassRequest // ignore: cast_nullable_to_non_nullable
              as ResetPassRequestParams,
    ));
  }
}

/// @nodoc

class _$AuthResetEventImpl
    with DiagnosticableTreeMixin
    implements _AuthResetEvent {
  const _$AuthResetEventImpl(this.forgotPassRequest);

  @override
  final ResetPassRequestParams forgotPassRequest;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.authReset(forgotPassRequest: $forgotPassRequest)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.authReset'))
      ..add(DiagnosticsProperty('forgotPassRequest', forgotPassRequest));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthResetEventImpl &&
            (identical(other.forgotPassRequest, forgotPassRequest) ||
                other.forgotPassRequest == forgotPassRequest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, forgotPassRequest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthResetEventImplCopyWith<_$AuthResetEventImpl> get copyWith =>
      __$$AuthResetEventImplCopyWithImpl<_$AuthResetEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authLogout,
    required TResult Function(AuthRegisterParams registerRequest) authRegister,
    required TResult Function(ResetPassRequestParams forgotPassRequest)
        authReset,
    required TResult Function(AuthForgotParams email) authForgot,
    required TResult Function(AuthLoginParams loginRequest) authLogin,
    required TResult Function(String? refreshToken, String? userId) authCheck,
  }) {
    return authReset(forgotPassRequest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authLogout,
    TResult? Function(AuthRegisterParams registerRequest)? authRegister,
    TResult? Function(ResetPassRequestParams forgotPassRequest)? authReset,
    TResult? Function(AuthForgotParams email)? authForgot,
    TResult? Function(AuthLoginParams loginRequest)? authLogin,
    TResult? Function(String? refreshToken, String? userId)? authCheck,
  }) {
    return authReset?.call(forgotPassRequest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authLogout,
    TResult Function(AuthRegisterParams registerRequest)? authRegister,
    TResult Function(ResetPassRequestParams forgotPassRequest)? authReset,
    TResult Function(AuthForgotParams email)? authForgot,
    TResult Function(AuthLoginParams loginRequest)? authLogin,
    TResult Function(String? refreshToken, String? userId)? authCheck,
    required TResult orElse(),
  }) {
    if (authReset != null) {
      return authReset(forgotPassRequest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthLogoutEvent value) authLogout,
    required TResult Function(_AuthRegisterEvent value) authRegister,
    required TResult Function(_AuthResetEvent value) authReset,
    required TResult Function(_AuthForgotEvent value) authForgot,
    required TResult Function(_AuthLoginEvent value) authLogin,
    required TResult Function(_AuthCheckStatusEvent value) authCheck,
  }) {
    return authReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthLogoutEvent value)? authLogout,
    TResult? Function(_AuthRegisterEvent value)? authRegister,
    TResult? Function(_AuthResetEvent value)? authReset,
    TResult? Function(_AuthForgotEvent value)? authForgot,
    TResult? Function(_AuthLoginEvent value)? authLogin,
    TResult? Function(_AuthCheckStatusEvent value)? authCheck,
  }) {
    return authReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthLogoutEvent value)? authLogout,
    TResult Function(_AuthRegisterEvent value)? authRegister,
    TResult Function(_AuthResetEvent value)? authReset,
    TResult Function(_AuthForgotEvent value)? authForgot,
    TResult Function(_AuthLoginEvent value)? authLogin,
    TResult Function(_AuthCheckStatusEvent value)? authCheck,
    required TResult orElse(),
  }) {
    if (authReset != null) {
      return authReset(this);
    }
    return orElse();
  }
}

abstract class _AuthResetEvent implements AuthEvent {
  const factory _AuthResetEvent(
      final ResetPassRequestParams forgotPassRequest) = _$AuthResetEventImpl;

  ResetPassRequestParams get forgotPassRequest;
  @JsonKey(ignore: true)
  _$$AuthResetEventImplCopyWith<_$AuthResetEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthForgotEventImplCopyWith<$Res> {
  factory _$$AuthForgotEventImplCopyWith(_$AuthForgotEventImpl value,
          $Res Function(_$AuthForgotEventImpl) then) =
      __$$AuthForgotEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthForgotParams email});
}

/// @nodoc
class __$$AuthForgotEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthForgotEventImpl>
    implements _$$AuthForgotEventImplCopyWith<$Res> {
  __$$AuthForgotEventImplCopyWithImpl(
      _$AuthForgotEventImpl _value, $Res Function(_$AuthForgotEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$AuthForgotEventImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as AuthForgotParams,
    ));
  }
}

/// @nodoc

class _$AuthForgotEventImpl
    with DiagnosticableTreeMixin
    implements _AuthForgotEvent {
  const _$AuthForgotEventImpl(this.email);

  @override
  final AuthForgotParams email;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.authForgot(email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.authForgot'))
      ..add(DiagnosticsProperty('email', email));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthForgotEventImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthForgotEventImplCopyWith<_$AuthForgotEventImpl> get copyWith =>
      __$$AuthForgotEventImplCopyWithImpl<_$AuthForgotEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authLogout,
    required TResult Function(AuthRegisterParams registerRequest) authRegister,
    required TResult Function(ResetPassRequestParams forgotPassRequest)
        authReset,
    required TResult Function(AuthForgotParams email) authForgot,
    required TResult Function(AuthLoginParams loginRequest) authLogin,
    required TResult Function(String? refreshToken, String? userId) authCheck,
  }) {
    return authForgot(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authLogout,
    TResult? Function(AuthRegisterParams registerRequest)? authRegister,
    TResult? Function(ResetPassRequestParams forgotPassRequest)? authReset,
    TResult? Function(AuthForgotParams email)? authForgot,
    TResult? Function(AuthLoginParams loginRequest)? authLogin,
    TResult? Function(String? refreshToken, String? userId)? authCheck,
  }) {
    return authForgot?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authLogout,
    TResult Function(AuthRegisterParams registerRequest)? authRegister,
    TResult Function(ResetPassRequestParams forgotPassRequest)? authReset,
    TResult Function(AuthForgotParams email)? authForgot,
    TResult Function(AuthLoginParams loginRequest)? authLogin,
    TResult Function(String? refreshToken, String? userId)? authCheck,
    required TResult orElse(),
  }) {
    if (authForgot != null) {
      return authForgot(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthLogoutEvent value) authLogout,
    required TResult Function(_AuthRegisterEvent value) authRegister,
    required TResult Function(_AuthResetEvent value) authReset,
    required TResult Function(_AuthForgotEvent value) authForgot,
    required TResult Function(_AuthLoginEvent value) authLogin,
    required TResult Function(_AuthCheckStatusEvent value) authCheck,
  }) {
    return authForgot(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthLogoutEvent value)? authLogout,
    TResult? Function(_AuthRegisterEvent value)? authRegister,
    TResult? Function(_AuthResetEvent value)? authReset,
    TResult? Function(_AuthForgotEvent value)? authForgot,
    TResult? Function(_AuthLoginEvent value)? authLogin,
    TResult? Function(_AuthCheckStatusEvent value)? authCheck,
  }) {
    return authForgot?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthLogoutEvent value)? authLogout,
    TResult Function(_AuthRegisterEvent value)? authRegister,
    TResult Function(_AuthResetEvent value)? authReset,
    TResult Function(_AuthForgotEvent value)? authForgot,
    TResult Function(_AuthLoginEvent value)? authLogin,
    TResult Function(_AuthCheckStatusEvent value)? authCheck,
    required TResult orElse(),
  }) {
    if (authForgot != null) {
      return authForgot(this);
    }
    return orElse();
  }
}

abstract class _AuthForgotEvent implements AuthEvent {
  const factory _AuthForgotEvent(final AuthForgotParams email) =
      _$AuthForgotEventImpl;

  AuthForgotParams get email;
  @JsonKey(ignore: true)
  _$$AuthForgotEventImplCopyWith<_$AuthForgotEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthLoginEventImplCopyWith<$Res> {
  factory _$$AuthLoginEventImplCopyWith(_$AuthLoginEventImpl value,
          $Res Function(_$AuthLoginEventImpl) then) =
      __$$AuthLoginEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthLoginParams loginRequest});
}

/// @nodoc
class __$$AuthLoginEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthLoginEventImpl>
    implements _$$AuthLoginEventImplCopyWith<$Res> {
  __$$AuthLoginEventImplCopyWithImpl(
      _$AuthLoginEventImpl _value, $Res Function(_$AuthLoginEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginRequest = null,
  }) {
    return _then(_$AuthLoginEventImpl(
      null == loginRequest
          ? _value.loginRequest
          : loginRequest // ignore: cast_nullable_to_non_nullable
              as AuthLoginParams,
    ));
  }
}

/// @nodoc

class _$AuthLoginEventImpl
    with DiagnosticableTreeMixin
    implements _AuthLoginEvent {
  const _$AuthLoginEventImpl(this.loginRequest);

  @override
  final AuthLoginParams loginRequest;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.authLogin(loginRequest: $loginRequest)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.authLogin'))
      ..add(DiagnosticsProperty('loginRequest', loginRequest));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthLoginEventImpl &&
            (identical(other.loginRequest, loginRequest) ||
                other.loginRequest == loginRequest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loginRequest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthLoginEventImplCopyWith<_$AuthLoginEventImpl> get copyWith =>
      __$$AuthLoginEventImplCopyWithImpl<_$AuthLoginEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authLogout,
    required TResult Function(AuthRegisterParams registerRequest) authRegister,
    required TResult Function(ResetPassRequestParams forgotPassRequest)
        authReset,
    required TResult Function(AuthForgotParams email) authForgot,
    required TResult Function(AuthLoginParams loginRequest) authLogin,
    required TResult Function(String? refreshToken, String? userId) authCheck,
  }) {
    return authLogin(loginRequest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authLogout,
    TResult? Function(AuthRegisterParams registerRequest)? authRegister,
    TResult? Function(ResetPassRequestParams forgotPassRequest)? authReset,
    TResult? Function(AuthForgotParams email)? authForgot,
    TResult? Function(AuthLoginParams loginRequest)? authLogin,
    TResult? Function(String? refreshToken, String? userId)? authCheck,
  }) {
    return authLogin?.call(loginRequest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authLogout,
    TResult Function(AuthRegisterParams registerRequest)? authRegister,
    TResult Function(ResetPassRequestParams forgotPassRequest)? authReset,
    TResult Function(AuthForgotParams email)? authForgot,
    TResult Function(AuthLoginParams loginRequest)? authLogin,
    TResult Function(String? refreshToken, String? userId)? authCheck,
    required TResult orElse(),
  }) {
    if (authLogin != null) {
      return authLogin(loginRequest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthLogoutEvent value) authLogout,
    required TResult Function(_AuthRegisterEvent value) authRegister,
    required TResult Function(_AuthResetEvent value) authReset,
    required TResult Function(_AuthForgotEvent value) authForgot,
    required TResult Function(_AuthLoginEvent value) authLogin,
    required TResult Function(_AuthCheckStatusEvent value) authCheck,
  }) {
    return authLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthLogoutEvent value)? authLogout,
    TResult? Function(_AuthRegisterEvent value)? authRegister,
    TResult? Function(_AuthResetEvent value)? authReset,
    TResult? Function(_AuthForgotEvent value)? authForgot,
    TResult? Function(_AuthLoginEvent value)? authLogin,
    TResult? Function(_AuthCheckStatusEvent value)? authCheck,
  }) {
    return authLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthLogoutEvent value)? authLogout,
    TResult Function(_AuthRegisterEvent value)? authRegister,
    TResult Function(_AuthResetEvent value)? authReset,
    TResult Function(_AuthForgotEvent value)? authForgot,
    TResult Function(_AuthLoginEvent value)? authLogin,
    TResult Function(_AuthCheckStatusEvent value)? authCheck,
    required TResult orElse(),
  }) {
    if (authLogin != null) {
      return authLogin(this);
    }
    return orElse();
  }
}

abstract class _AuthLoginEvent implements AuthEvent {
  const factory _AuthLoginEvent(final AuthLoginParams loginRequest) =
      _$AuthLoginEventImpl;

  AuthLoginParams get loginRequest;
  @JsonKey(ignore: true)
  _$$AuthLoginEventImplCopyWith<_$AuthLoginEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthCheckStatusEventImplCopyWith<$Res> {
  factory _$$AuthCheckStatusEventImplCopyWith(_$AuthCheckStatusEventImpl value,
          $Res Function(_$AuthCheckStatusEventImpl) then) =
      __$$AuthCheckStatusEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? refreshToken, String? userId});
}

/// @nodoc
class __$$AuthCheckStatusEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthCheckStatusEventImpl>
    implements _$$AuthCheckStatusEventImplCopyWith<$Res> {
  __$$AuthCheckStatusEventImplCopyWithImpl(_$AuthCheckStatusEventImpl _value,
      $Res Function(_$AuthCheckStatusEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshToken = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$AuthCheckStatusEventImpl(
      freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthCheckStatusEventImpl
    with DiagnosticableTreeMixin
    implements _AuthCheckStatusEvent {
  const _$AuthCheckStatusEventImpl(this.refreshToken, this.userId);

  @override
  final String? refreshToken;
  @override
  final String? userId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.authCheck(refreshToken: $refreshToken, userId: $userId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.authCheck'))
      ..add(DiagnosticsProperty('refreshToken', refreshToken))
      ..add(DiagnosticsProperty('userId', userId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthCheckStatusEventImpl &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, refreshToken, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthCheckStatusEventImplCopyWith<_$AuthCheckStatusEventImpl>
      get copyWith =>
          __$$AuthCheckStatusEventImplCopyWithImpl<_$AuthCheckStatusEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authLogout,
    required TResult Function(AuthRegisterParams registerRequest) authRegister,
    required TResult Function(ResetPassRequestParams forgotPassRequest)
        authReset,
    required TResult Function(AuthForgotParams email) authForgot,
    required TResult Function(AuthLoginParams loginRequest) authLogin,
    required TResult Function(String? refreshToken, String? userId) authCheck,
  }) {
    return authCheck(refreshToken, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authLogout,
    TResult? Function(AuthRegisterParams registerRequest)? authRegister,
    TResult? Function(ResetPassRequestParams forgotPassRequest)? authReset,
    TResult? Function(AuthForgotParams email)? authForgot,
    TResult? Function(AuthLoginParams loginRequest)? authLogin,
    TResult? Function(String? refreshToken, String? userId)? authCheck,
  }) {
    return authCheck?.call(refreshToken, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authLogout,
    TResult Function(AuthRegisterParams registerRequest)? authRegister,
    TResult Function(ResetPassRequestParams forgotPassRequest)? authReset,
    TResult Function(AuthForgotParams email)? authForgot,
    TResult Function(AuthLoginParams loginRequest)? authLogin,
    TResult Function(String? refreshToken, String? userId)? authCheck,
    required TResult orElse(),
  }) {
    if (authCheck != null) {
      return authCheck(refreshToken, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthLogoutEvent value) authLogout,
    required TResult Function(_AuthRegisterEvent value) authRegister,
    required TResult Function(_AuthResetEvent value) authReset,
    required TResult Function(_AuthForgotEvent value) authForgot,
    required TResult Function(_AuthLoginEvent value) authLogin,
    required TResult Function(_AuthCheckStatusEvent value) authCheck,
  }) {
    return authCheck(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthLogoutEvent value)? authLogout,
    TResult? Function(_AuthRegisterEvent value)? authRegister,
    TResult? Function(_AuthResetEvent value)? authReset,
    TResult? Function(_AuthForgotEvent value)? authForgot,
    TResult? Function(_AuthLoginEvent value)? authLogin,
    TResult? Function(_AuthCheckStatusEvent value)? authCheck,
  }) {
    return authCheck?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthLogoutEvent value)? authLogout,
    TResult Function(_AuthRegisterEvent value)? authRegister,
    TResult Function(_AuthResetEvent value)? authReset,
    TResult Function(_AuthForgotEvent value)? authForgot,
    TResult Function(_AuthLoginEvent value)? authLogin,
    TResult Function(_AuthCheckStatusEvent value)? authCheck,
    required TResult orElse(),
  }) {
    if (authCheck != null) {
      return authCheck(this);
    }
    return orElse();
  }
}

abstract class _AuthCheckStatusEvent implements AuthEvent {
  const factory _AuthCheckStatusEvent(
          final String? refreshToken, final String? userId) =
      _$AuthCheckStatusEventImpl;

  String? get refreshToken;
  String? get userId;
  @JsonKey(ignore: true)
  _$$AuthCheckStatusEventImplCopyWith<_$AuthCheckStatusEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  String? get message => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call({String? message, Status status});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, Status status});
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? status = null,
  }) {
    return _then(_$AuthStateImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl with DiagnosticableTreeMixin implements _AuthState {
  const _$AuthStateImpl({this.message, this.status = Status.LOADING});

  @override
  final String? message;
  @override
  @JsonKey()
  final Status status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState(message: $message, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState'))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState({final String? message, final Status status}) =
      _$AuthStateImpl;

  @override
  String? get message;
  @override
  Status get status;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
