import 'package:arzonuz/features/arzonuz/data/models/passwords/forgot_pass_reeuqest.dart';
import 'package:arzonuz/features/arzonuz/data/models/auth_models/login_request.dart';
import 'package:arzonuz/features/arzonuz/data/models/auth_models/register_request.dart';
import 'package:arzonuz/features/arzonuz/domain/repositories/auth_repositories.dart';
import 'package:arzonuz/features/arzonuz/domain/usecases/auth_login_usecases.dart';
import 'package:arzonuz/features/arzonuz/domain/usecases/auth_register_usecases.dart';
import 'package:bloc/bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // AuthRepositories authRepositories;
  AuthLoginUsecases authLoginUsecases;
  AuthRegisterUsecases authRegisterUsecase;
  AuthBloc(
      {
      required this.authLoginUsecases,
      required this.authRegisterUsecase})
      : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<AuthRegisterEvent>(_register);
    on<AuthLoginrEvent>(_login);
    on<AuthCheckStatusEvent>(_checkStatus);
    // on<AuthLogoutEvent>(_logOut);
    // on<AuthForgotEvent>(_forgotPass);
    // on<AuthResetEvent>(_resetPass);
  }

  // _resetPass(AuthResetEvent event, emit) {
  //   emit(AuthLoading());
  //   try {
  //     authRepositories.resetPassword(event.forgotPassRequest);
  //     emit(AuthSuccesifullyReset());
  //   } catch (e) {
  //     emit(
  //       AuthError(
  //         message: e.toString(),
  //       ),
  //     );
  //   }
  // }

  // _forgotPass(AuthForgotEvent event, emit) {
  //   emit(AuthLoading());
  //   try {
  //     authRepositories.forgotPassword(event.email);
  //   } catch (e) {
  //     emit(
  //       AuthError(
  //         message: e.toString(),
  //       ),
  //     );
  //   }
  // }

  // _logOut(AuthLogoutEvent event, emit) {
  //   authRepositories.logOut();
  //   emit(AuthUnuthicated());
  // }

  _checkStatus(AuthCheckStatusEvent event, emit) async {
    if (event.refreshToken != null && event.refreshToken!.isNotEmpty ||
        event.userId != null && event.userId!.isNotEmpty) {
      emit(AuthAuthicated());
    } else {
      emit(AuthUnuthicated());
    }
  }

  _register(AuthRegisterEvent event, emit) async {
    try {
      emit(AuthLoading());
      final responce = await authRegisterUsecase(event.registerRequest);
      emit(AuthAuthicated());
    } catch (e) {
      emit(
        AuthError(
          message: e.toString(),
        ),
      );
    }
  }

  _login(AuthLoginrEvent event, emit) async {
    try {
      emit(AuthLoading());
      final responce = await authLoginUsecases(event.loginRequest);
      emit(AuthAuthicated());
    } catch (e) {
      emit(
        AuthError(
          message: e.toString(),
        ),
      );
    }
  }
}
