import 'package:arzonuz/core/error/failure.dart';
import 'package:arzonuz/core/usecases/usecases.dart';
import 'package:arzonuz/features/arzonuz/data/models/auth_models/register_request.dart';
import 'package:arzonuz/features/arzonuz/domain/repositories/auth_repositories.dart';
import 'package:dartz/dartz.dart';

class AuthRegisterUsecases extends Usecases<void, AuthRegisterParams> {
  AuthRepositories authRepositories;
  AuthRegisterUsecases({required this.authRepositories});
  @override
  Future<Either<Failure, String>> call(AuthRegisterParams params) {
    return authRepositories.register(params);
  }
}

class AuthRegisterParams {
  final RegisterRequest registerRequest;

  AuthRegisterParams({required this.registerRequest});
}
