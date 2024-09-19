import 'package:arzonuz/features/arzonuz/data/datasources/auth_datasources.dart';
import 'package:arzonuz/features/arzonuz/data/models/auth_models/login_request.dart';
import 'package:arzonuz/features/arzonuz/data/models/auth_models/register_request.dart';
import 'package:arzonuz/features/arzonuz/data/models/passwords/forgot_pass_reeuqest.dart';
import 'package:arzonuz/features/arzonuz/domain/repositories/auth_repositories.dart';

class AuthRepositoriesImpl extends AuthRepositories {
  final AuthDatasources authDatasources;
  AuthRepositoriesImpl({required this.authDatasources});
  @override
  Future<void> forgotPassword(String email) {
    return authDatasources.forgotPassword(email);
  }

  @override
  Future<void> logOut() {
    return authDatasources.logOut();
  }

  @override
  Future<void> login(LoginRequest loginRequest) {
    return authDatasources.logIn(loginRequest);
  }

  @override
  Future<void> register(RegisterRequest registerRequest) {
    return authDatasources.register(registerRequest);
  }

  @override
  Future<void> resetPassword(ForgotPassRequest forgotPassRequest) {
    return authDatasources.resetPassword(forgotPassRequest);
  }
}
