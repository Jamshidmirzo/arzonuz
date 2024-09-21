// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arzonuz/features/arzonuz/auth/data/model/login_request.dart';
import 'package:dartz/dartz.dart';

import 'package:arzonuz/core/error/failure.dart';
import 'package:arzonuz/core/usecases/usecases.dart';
import 'package:arzonuz/features/arzonuz/auth/domain/repositories/auth_repositories.dart';

class AuthLoginUsecases extends Usecases<void, AuthLoginParams> {
  AuthRepositories authRepositories;
  AuthLoginUsecases({required this.authRepositories});
  @override
  Future<Either<Failure, Map<String, dynamic>>> call(AuthLoginParams params) {
    return authRepositories.login(params);
  }
}

class AuthLoginParams {
  LoginRequest loginRequest;
  AuthLoginParams({
    required this.loginRequest,
  });
}
