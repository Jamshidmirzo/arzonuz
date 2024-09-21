import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:arzonuz/core/constants/constants.dart';
import 'package:arzonuz/features/arzonuz/auth/data/model/login_request.dart';
import 'package:arzonuz/features/arzonuz/auth/domain/usecases/auth_usecasess/auth_login_usecases.dart';
import 'package:arzonuz/features/arzonuz/auth/presentation/bloc/auth_bloc.dart';
import 'package:arzonuz/features/arzonuz/auth/presentation/auth_screens/forgot_password_screen.dart';
import 'package:arzonuz/features/arzonuz/auth/presentation/auth_screens/register_screen.dart';
import 'package:arzonuz/features/arzonuz/home/presentation/pages/splash_screen/bottom_nav_bar_screen.dart';
import 'package:arzonuz/features/arzonuz/home/presentation/widgets/button_with_elevation.dart';
import 'package:arzonuz/features/arzonuz/home/presentation/widgets/text_input_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  void submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<AuthBloc>().add(
            AuthEvent.authLogin(
              AuthLoginParams(
                loginRequest: LoginRequest(
                  email: emailController.text,
                  password: passController.text,
                ),
              ),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == Status.ERROR) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("OK"),
                    )
                  ],
                  title: Text(state.message ?? ""),
                );
              },
            );
          }
          if (state.status == Status.AUTHICATED) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const BottomNavBarScreen();
                },
              ),
            );
          }
        },
        builder: (context, state) {
          return state.status == Status.LOADING
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.tr('login'),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 32),
                          ),
                          const SizedBox(height: 32),
                          TextInputWidget(
                            controller: emailController,
                            name: context.tr('email'),
                            labelText: 'Email',
                            validator: (p0) {
                              if (p0 == null || p0.isEmpty) {
                                return 'Input your email';
                              }
                              return null;
                            },
                          ),
                          TextInputWidget(
                            controller: passController,
                            name: context.tr('pass'),
                            labelText: 'Password',
                            validator: (p0) {
                              if (p0 == null || p0.isEmpty) {
                                return 'Input your password';
                              }
                              return null;
                            },
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const ForgotPasswordScreen();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                context.tr('fpass'),
                                style: TextStyle(
                                  color: AdaptiveTheme.of(context).mode ==
                                          AdaptiveThemeMode.light
                                      ? Colors.deepPurple
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ButtonWithElevation(
                            onPressed: () => submit(context),
                            bgColor: Colors.deepPurple.shade300,
                            child: Text(
                              context.tr('login'),
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ZoomTapAnimation(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const RegisterScreen();
                                  },
                                ),
                              );
                            },
                            child: RichText(
                              text: TextSpan(
                                text: context.tr('dre'),
                                style: TextStyle(
                                  color: AdaptiveTheme.of(context).mode ==
                                          AdaptiveThemeMode.light
                                      ? Colors.black
                                      : Colors.white,
                                ),
                                children: [
                                  TextSpan(
                                    text: context.tr('dreg'),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AdaptiveTheme.of(context).mode ==
                                              AdaptiveThemeMode.light
                                          ? Colors.red
                                          : Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ButtonWithElevation(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/apple.png',
                                  width: 20,
                                  height: 24,
                                ),
                                const Spacer(),
                                Text(
                                  context.tr('capple'),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AdaptiveTheme.of(context).mode ==
                                            AdaptiveThemeMode.light
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                          ButtonWithElevation(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/google.png',
                                  width: 20,
                                  height: 24,
                                ),
                                const Spacer(),
                                Text(
                                  context.tr('cgoogle'),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AdaptiveTheme.of(context).mode ==
                                            AdaptiveThemeMode.light
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                          ButtonWithElevation(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.facebook,
                                  color: Colors.blue,
                                  size: 24,
                                ),
                                const Spacer(),
                                Text(
                                  context.tr('cfacebook'),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AdaptiveTheme.of(context).mode ==
                                            AdaptiveThemeMode.light
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
