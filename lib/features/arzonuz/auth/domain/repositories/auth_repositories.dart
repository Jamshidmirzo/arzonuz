// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arzonuz/core/error/failure.dart';
import 'package:arzonuz/features/arzonuz/auth/domain/usecases/auth_usecasess/auth_forgot_pass_usecases.dart';
import 'package:arzonuz/features/arzonuz/auth/domain/usecases/auth_usecasess/auth_login_usecases.dart';
import 'package:arzonuz/features/arzonuz/auth/domain/usecases/auth_usecasess/auth_register_usecases.dart';
import 'package:arzonuz/features/arzonuz/auth/domain/usecases/auth_usecasess/auth_reset_usecases.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepositories {
  Future<Either<Failure,Map<String, dynamic>>> login(AuthLoginParams loginRequest);
  Future<Either<Failure,void>> forgotPassword(AuthForgotParams email);
  Future<Either<Failure,void>> resetPassword(ResetPassRequestParams forgotPassRequest);
 Future<Either<Failure,void>> logOut();
  Future<Either<Failure,String>> register(AuthRegisterParams registerRequest);
}


