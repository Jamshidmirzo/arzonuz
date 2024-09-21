import 'package:arzonuz/core/error/exception.dart';
import 'package:arzonuz/core/error/failure.dart';
import 'package:arzonuz/features/arzonuz/auth/data/datasources/auth_datasources.dart';
import 'package:arzonuz/features/arzonuz/auth/domain/repositories/auth_repositories.dart';
import 'package:arzonuz/features/arzonuz/auth/domain/usecases/auth_usecasess/auth_forgot_pass_usecases.dart';
import 'package:arzonuz/features/arzonuz/auth/domain/usecases/auth_usecasess/auth_login_usecases.dart';
import 'package:arzonuz/features/arzonuz/auth/domain/usecases/auth_usecasess/auth_register_usecases.dart';
import 'package:arzonuz/features/arzonuz/auth/domain/usecases/auth_usecasess/auth_reset_usecases.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoriesImpl extends AuthRepositories {
  final AuthDatasources authDatasources;
  AuthRepositoriesImpl({required this.authDatasources});
  @override
  Future<Either<Failure, void>> forgotPassword(AuthForgotParams email) async {
    return _forgotPassword(
      () => authDatasources.forgotPassword(email.params),
    );
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    return _logout(
      () => authDatasources.logOut(),
    );
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> login(
      AuthLoginParams loginRequest) async {
    return await _logIn(
      () {
        return authDatasources.logIn(loginRequest.loginRequest);
      },
    );
  }

  @override
  Future<Either<Failure, String>> register(
      AuthRegisterParams registerRequest) async {
    return await _register(
      () {
        return authDatasources.register(registerRequest.registerRequest);
      },
    );
  }

  @override
  Future<Either<Failure, void>> resetPassword(
      ResetPassRequestParams forgotPassRequest) async {
    return await _resetPassword(
      () => authDatasources.resetPassword(forgotPassRequest.params),
    );
  }

  Future<Either<Failure, void>> _forgotPassword(
      Future<void> Function() forgotPass) async {
    try {
      final forgotPassData = await forgotPass();
      return Right(forgotPassData);
    } on ServerExeption {
      return Left(
        ServerFailure(),
      );
    }
  }

  Future<Either<Failure, void>> _resetPassword(
      Future<void> Function() resetPass) async {
    try {
      final resetPassData = await resetPass();
      return Right(resetPassData);
    } on ServerExeption {
      return Left(
        ServerFailure(),
      );
    }
  }

  Future<Either<Failure, void>> _logout(Future<void> Function() logout) async {
    try {
      return Right(await logout());
    } on ServerExeption {
      return Left(
        ServerFailure(),
      );
    }
  }

  Future<Either<Failure, String>> _register(
      Future<String> Function() register) async {
    try {
      return Right(await register());
    } on ServerExeption {
      return Left(
        ServerFailure(),
      );
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> _logIn(
      Future<Map<String, dynamic>> Function() login) async {
    try {
      return Right(await login());
    } on ServerExeption {
      return Left(
        ServerFailure(),
      );
    }
  }
}
