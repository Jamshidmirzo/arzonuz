import 'package:arzonuz/core/error/failure.dart';
import 'package:arzonuz/core/usecases/usecases.dart';
import 'package:arzonuz/features/arzonuz/domain/repositories/auth_repositories.dart';
import 'package:dartz/dartz.dart';

class AuthLogoutUsecases extends Usecases<void, void> {
  AuthRepositories authRepositories;
  AuthLogoutUsecases({required this.authRepositories});
  @override
  Future<Either<Failure,void>> call(params) {
    return authRepositories.logOut();
  }
}
