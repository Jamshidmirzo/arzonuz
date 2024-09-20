import 'package:arzonuz/core/error/failure.dart';
import 'package:arzonuz/core/usecases/usecases.dart';
import 'package:arzonuz/features/arzonuz/data/models/passwords/forgot_pass_reeuqest.dart';
import 'package:arzonuz/features/arzonuz/domain/repositories/auth_repositories.dart';
import 'package:dartz/dartz.dart';

class AuthResetUsecases extends Usecases<void, ResetPassRequestParams> {
  AuthRepositories authRepositories;
  AuthResetUsecases({required this.authRepositories});
  @override
  Future<Either<Failure,void>> call(ResetPassRequestParams params) {
    return authRepositories.resetPassword(params);
  }
}
class ResetPassRequestParams {
  ForgotPassRequest params;
  ResetPassRequestParams({
    required this.params,
  });
}