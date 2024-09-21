import 'package:arzonuz/core/constants/constants.dart';
import 'package:arzonuz/features/arzonuz/auth/data/model/passwords/forgot_pass_reeuqest.dart';
import 'package:arzonuz/features/arzonuz/auth/domain/usecases/auth_usecasess/auth_reset_usecases.dart';
import 'package:arzonuz/features/arzonuz/auth/presentation/bloc/auth_bloc.dart';
import 'package:arzonuz/features/arzonuz/auth/presentation/auth_screens/succesufuly_forgot_password_screen.dart';
import 'package:arzonuz/features/arzonuz/home/presentation/widgets/button_with_elevation.dart';
import 'package:arzonuz/features/arzonuz/home/presentation/widgets/text_input_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPassScreen extends StatelessWidget {
  final String email;
  final String code;
  NewPassScreen({super.key, required this.code, required this.email});
  final passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<AuthBloc>().add(
            AuthEvent.authReset(
              ResetPassRequestParams(
                params: ForgotPassRequest(
                    code: code, email: email, password: passController.text),
              ),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.status == Status.ERROR
              ? showDialog(
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
                )
              : Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SuccessfullyForgotPasswordScreen();
                    },
                  ),
                );
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
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
                ButtonWithElevation(
                  onPressed: () => submit(context),
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
      ),
    );
  }
}
