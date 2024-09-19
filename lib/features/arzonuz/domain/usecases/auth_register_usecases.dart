import 'package:arzonuz/core/usecases/usecases.dart';
import 'package:arzonuz/features/arzonuz/data/models/auth_models/register_request.dart';
import 'package:arzonuz/features/arzonuz/domain/repositories/auth_repositories.dart';

class AuthRegisterUsecases extends Usecases<void, RegisterRequest> {
  AuthRepositories authRepositories;
  AuthRegisterUsecases({required this.authRepositories});
  @override
  Future<void> call(RegisterRequest params) {
    return authRepositories.register(params);
  }
}
