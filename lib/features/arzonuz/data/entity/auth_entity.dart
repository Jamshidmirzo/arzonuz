import 'package:arzonuz/features/arzonuz/data/models/auth_models/login_request.dart';
import 'package:arzonuz/features/arzonuz/data/models/passwords/forgot_pass_reeuqest.dart';

class AuthEntitiy {
  LoginRequest loginRequest;
  String email;
  ForgotPassRequest forgotPassRequest;
  AuthEntitiy({
    required this.loginRequest,
    required this.email,
    required this.forgotPassRequest,
  });
}