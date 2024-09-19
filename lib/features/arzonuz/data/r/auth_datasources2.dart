// import 'package:arzonuz/features/arzonuz/data/datasources/auth_datasources.dart';
// import 'package:arzonuz/features/arzonuz/data/models/passwords/forgot_pass_reeuqest.dart';
// import 'package:arzonuz/features/arzonuz/data/models/auth_models/login_request.dart';
// import 'package:arzonuz/features/arzonuz/data/models/auth_models/register_request.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AuthDatasources {
//   final authService = AuthDatasources();
//   register(RegisterRequest registerRequest) async {
//     final responce = await authService.register(registerRequest);
//     if (responce.isNotEmpty) {
//       final shared = await SharedPreferences.getInstance();
//       shared.setString('userId', responce);
//     }
//   }

//   login(LoginRequest loginRequest) async {
//     try {
//       final responce = await authService.logIn(loginRequest);
//       print('registerda set qilyamzi');
//       print(responce);
//       if (responce.isNotEmpty) {
//         final shared = await SharedPreferences.getInstance();
//         shared.setString(
//           'refreshToken',
//           responce['refreshToken'],
//         );
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }

//   forgotPassword(String email) {
//     try {
//       return authService.forgotPassword(email);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   resetPassword(ForgotPassRequest forgotPassRequest) {
//     try {
//       return authService.resetPassword(forgotPassRequest);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   logOut() async {
//     final shared = await SharedPreferences.getInstance();
//     shared.remove('refreshToken');
//     shared.remove('userId');
//     shared.remove('seller');
//     shared.remove('favoriteProducts');
//     // return authService.logOut();
//   }
// }
