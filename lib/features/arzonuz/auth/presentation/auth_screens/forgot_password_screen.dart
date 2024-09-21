import 'package:arzonuz/features/arzonuz/auth/domain/usecases/auth_usecasess/auth_forgot_pass_usecases.dart';
import 'package:arzonuz/features/arzonuz/auth/presentation/auth_screens/new_pass_screen.dart';
import 'package:arzonuz/features/arzonuz/auth/presentation/bloc/auth_bloc.dart';

import 'package:arzonuz/features/arzonuz/home/presentation/widgets/back_button.dart';
import 'package:arzonuz/features/arzonuz/home/presentation/widgets/button_with_elevation.dart';
import 'package:arzonuz/features/arzonuz/home/presentation/widgets/text_input_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();

  final codeController1 = TextEditingController();

  final codeController2 = TextEditingController();

  final codeController3 = TextEditingController();

  final codeController4 = TextEditingController();
  final codeController5 = TextEditingController();

  final codeController6 = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isSend = false;

  openDialog(BuildContext context) {
    isSend = true;
    setState(() {});
    context.read<AuthBloc>().add(
          AuthEvent.authForgot(
            AuthForgotParams(params: emailController.text),
          ),
        );
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
          title: const Text(
            "We Send you a code",
          ),
        );
      },
    );
  }

  submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return NewPassScreen(
              email: emailController.text,
              code:
                  '${codeController1.text}${codeController2.text}${codeController3.text}${codeController4.text}${codeController5.text}${codeController6.text}',
            );
          },
        ),
      );
    }
  }

  void _handleCodeInput(
      BuildContext context, TextEditingController controller, String value) {
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
  }

  @override
  void initState() {
    super.initState();
    emailController.text = 'spokoyniybro@gmail.com';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.tr('fpass'),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              const SizedBox(height: 32),
              TextInputWidget(
                controller: emailController,
                name: context.tr('email'),
                labelText: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Input your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              isSend
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 60,
                          child: TextFormField(
                            controller: codeController1,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Code',
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            onChanged: (value) => _handleCodeInput(
                                context, codeController1, value),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Input';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          child: TextFormField(
                            controller: codeController2,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Code',
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            onChanged: (value) => _handleCodeInput(
                                context, codeController2, value),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Input';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          child: TextFormField(
                            controller: codeController3,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Code',
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            onChanged: (value) => _handleCodeInput(
                                context, codeController3, value),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Input';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          child: TextFormField(
                            controller: codeController4,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Code',
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            onChanged: (value) => _handleCodeInput(
                                context, codeController4, value),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Input';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          child: TextFormField(
                            controller: codeController5,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Code',
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            onChanged: (value) => _handleCodeInput(
                                context, codeController4, value),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Input';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          child: TextFormField(
                            controller: codeController6,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Code',
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            onChanged: (value) => _handleCodeInput(
                                context, codeController4, value),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Input';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
              const SizedBox(height: 32),
              ButtonWithElevation(
                onPressed: () => isSend ? submit(context) : openDialog(context),
                bgColor: Colors.deepPurple.shade300,
                child: Text(
                  context.tr('continue'),
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
