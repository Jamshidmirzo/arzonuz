// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:arzonuz/core/error/failure.dart';
import 'package:arzonuz/core/usecases/usecases.dart';
import 'package:arzonuz/features/arzonuz/domain/repositories/auth_repositories.dart';

class AuthForgotPassUsecases extends Usecases<void, AuthForgotParams> {
  AuthRepositories authRepositories;
  AuthForgotPassUsecases({required this.authRepositories});
  @override
  Future<Either<Failure, void>> call(AuthForgotParams params) {
    return authRepositories.forgotPassword(params);
  }
}

class AuthForgotParams {
  String params;
  AuthForgotParams({
    required this.params,
  });
}
