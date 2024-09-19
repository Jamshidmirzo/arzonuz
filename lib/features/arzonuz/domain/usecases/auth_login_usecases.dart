import 'package:arzonuz/core/usecases/usecases.dart';
import 'package:arzonuz/features/arzonuz/data/models/auth_models/login_request.dart';
import 'package:arzonuz/features/arzonuz/domain/repositories/auth_repositories.dart';


class AuthLoginUsecases extends Usecases<void,LoginRequest> {
  AuthRepositories authRepositories;
  AuthLoginUsecases({required this.authRepositories});
  @override
  Future call(LoginRequest loginRequest) {
    return authRepositories.login(loginRequest);
  }
}


