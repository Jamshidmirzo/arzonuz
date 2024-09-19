// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arzonuz/features/arzonuz/data/models/auth_models/login_request.dart';
import 'package:arzonuz/features/arzonuz/data/models/auth_models/register_request.dart';
import 'package:arzonuz/features/arzonuz/data/models/passwords/forgot_pass_reeuqest.dart';

abstract class AuthRepositories {
  Future<void> login(LoginRequest loginRequest);
  Future<void> forgotPassword(String email);
  Future<void> resetPassword(ForgotPassRequest forgotPassRequest);
  Future<void> logOut();
  Future<void> register(RegisterRequest registerRequest);

}


