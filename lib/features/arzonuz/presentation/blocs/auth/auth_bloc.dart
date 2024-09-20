import 'package:arzonuz/features/arzonuz/domain/usecases/auth_forgot_pass_usecases.dart';
import 'package:arzonuz/features/arzonuz/domain/usecases/auth_login_usecases.dart';
import 'package:arzonuz/features/arzonuz/domain/usecases/auth_logout_usecases.dart';
import 'package:arzonuz/features/arzonuz/domain/usecases/auth_register_usecases.dart';
import 'package:arzonuz/features/arzonuz/domain/usecases/auth_reset_usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthLoginUsecases authLoginUsecases;
  AuthRegisterUsecases authRegisterUsecase;
  AuthLogoutUsecases authLogoutUsecases;
  AuthForgotPassUsecases authForgotPassUsecases;
  AuthResetUsecases authResetUsecases;
  AuthBloc(
      {required this.authLoginUsecases,
      required this.authResetUsecases,
      required this.authForgotPassUsecases,
      required this.authRegisterUsecase,
      required this.authLogoutUsecases})
      : super(
          const AuthState(status: Status.LOADING),
        ) {
    on<AuthEvent>((event, emit) {});
    on<_AuthRegisterEvent>(_register);
    on<_AuthLoginrEvent>(_login);
    on<_AuthCheckStatusEvent>(_checkStatus);
    on<AuthLogoutEvent>(_logOut);
    on<AuthForgotEvent>(_forgotPass);
    on<_AuthResetEvent>(_resetPass);
  }

  Future _resetPass(_AuthResetEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: Status.LOADING));
    final authReset = await authResetUsecases(event.forgotPassRequest);
    authReset.fold(
      (error) {
        emit(
          state.copyWith(status: Status.ERROR),
        );
      },
      (resetData) {
        emit(
          state.copyWith(status: Status.SUCCESS),
        );
      },
    );
  }

  _forgotPass(AuthForgotEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: Status.LOADING));
    final authForgotData = await authForgotPassUsecases(event.email);
    authForgotData.fold(
      (error) {
        emit(
          state.copyWith(status: Status.ERROR, message: 'Erorororor'),
        );
      },
      (data) {
        emit(state.copyWith(status: Status.AUTHICATED));
      },
    );
  }

  _checkStatus(_AuthCheckStatusEvent event, Emitter<AuthState> emit) async {
    if (event.refreshToken != null && event.refreshToken!.isNotEmpty ||
        event.userId != null && event.userId!.isNotEmpty) {
      emit(state.copyWith(status: Status.AUTHICATED));
    } else {
      emit(state.copyWith(status: Status.UNAUTHICATED));
    }
  }

  _register(_AuthRegisterEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: Status.LOADING));
    final registerData = await authRegisterUsecase(event.registerRequest);
    registerData.fold(
      (error) {
        emit(state.copyWith(status: Status.ERROR, message: 'qwertyui'));
      },
      (data) {
        emit(state.copyWith(status: Status.AUTHICATED));
      },
    );
  }

  _login(_AuthLoginrEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: Status.LOADING));
    final loginData = await authLoginUsecases(event.loginRequest);
    loginData.fold((error) {
    emit(state.copyWith(status: Status.ERROR,message: '1234tyuioiuytre'));
      
    }, (data) {
    emit(state.copyWith(status: Status.AUTHICATED));

    });
  }

  _logOut(AuthLogoutEvent event, Emitter<AuthState> emit) async {
    authLogoutUsecases;
    emit(state.copyWith(status: Status.UNAUTHICATED));

  }

  // String _failureMessage(Failure failure) {
  //   switch (failure.runtimeType) {
  //     case ServerFailure():
  //       return 'Servier error';
  //     case CacheFailure():
  //       return 'Chache errro';
  //     default:
  //       return 'Smth went wrong';
  //   }
  // }
}
