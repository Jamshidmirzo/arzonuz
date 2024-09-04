import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:arzonuz/data/models/register_request.dart';
import 'package:arzonuz/logic/blocs/auth/auth_bloc.dart';
import 'package:arzonuz/ui/screens/auth_screens/login_screen.dart';
import 'package:arzonuz/ui/screens/auth_screens/tell_us_screen.dart';
import 'package:arzonuz/ui/widgets/button_with_elevation.dart';
import 'package:arzonuz/ui/widgets/text_input_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String _selectedUserType = 'consumer';

  @override
  void initState() {
    super.initState();
    emailController.text = 'user2@gmail.com';
    nameController.text = 'Operocder';
    passController.text = '12345678';
    confirmPassController.text = '12345678';
    addressController.text = 'Tashkent';
    phoneController.text = '123456789';
  }

  void submit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<AuthBloc>().add(
            AuthRegisterEvent(
              registerRequest: RegisterRequest(
                address: addressController.text,
                email: emailController.text,
                fullname: nameController.text,
                password: passController.text,
                phone: phoneController.text,
                role: _selectedUserType.toLowerCase(),
              ),
            ),
          );
      if (_selectedUserType == 'seller') {
        final shared = await SharedPreferences.getInstance();
        shared.setString('seller', _selectedUserType);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
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
                  title: Text(state.message),
                );
              },
            );
          }
          if (state is AuthAuthicated) {
            Navigator.pushReplacement(
              // ignore: use_build_context_synchronously
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const TellUsScreen();
                },
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.tr('register'),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                  const SizedBox(height: 32),
                  TextInputWidget(
                    controller: nameController,
                    name: context.tr('name'),
                    labelText: 'Name',
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Input your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black),
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: AdaptiveTheme.of(context).mode ==
                              AdaptiveThemeMode.light
                          ? Colors.white
                          : Colors.black,
                      value: _selectedUserType,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedUserType = newValue!;
                        });
                      },
                      items: <String>['consumer', 'seller']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              value,
                              style: TextStyle(
                                color: AdaptiveTheme.of(context).mode ==
                                        AdaptiveThemeMode.light
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      underline: const SizedBox.shrink(),
                      isExpanded: true,
                    ),
                  ),
                  const SizedBox(height: 20),
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
                  TextInputWidget(
                    controller: confirmPassController,
                    name: context.tr('cpass'),
                    labelText: 'Confirm Password',
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Input your password';
                      }
                      if (passController.text != confirmPassController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  TextInputWidget(
                    controller: phoneController,
                    name: context.tr('phone'),
                    labelText: 'Phone',
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Input your phone number';
                      }
                      return null;
                    },
                  ),
                  TextInputWidget(
                    controller: addressController,
                    name: context.tr('address'),
                    labelText: 'Address',
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Input your address';
                      }
                      return null;
                    },
                  ),
                  ButtonWithElevation(
                    onPressed: () => submit(context),
                    bgColor: Colors.deepPurple.shade300,
                    child: Text(
                      context.tr('continue'),
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  ZoomTapAnimation(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: context.tr('dre'),
                        style: const TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: context.tr('login'),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
