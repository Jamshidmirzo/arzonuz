import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arzonuz/logic/blocs/auth/auth_bloc.dart';
import 'package:arzonuz/ui/screens/auth_screens/login_screen.dart';
import 'package:arzonuz/ui/screens/splash_screen/bottom_nav_bar_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  void _checkAuthStatus() async {
    await Future.delayed(const Duration(seconds: 3));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? refreshToken = prefs.getString('refreshToken');
    String? userId = prefs.getString('userId');

    // ignore: use_build_context_synchronously
    context.read<AuthBloc>().add(
          AuthCheckStatusEvent(refreshToken: refreshToken, userId: userId),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {

          if (state is AuthAuthicated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const BottomNavBarScreen(),
              ),
            );
          } else if (state is AuthError || state is AuthUnuthicated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          }
        },
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            height: 175,
          ),
        ),
      ),
    );
  }
}
