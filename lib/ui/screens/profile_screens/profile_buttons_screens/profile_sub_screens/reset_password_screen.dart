import 'package:arzonuz/data/models/passwords/change_pass_request.dart';
import 'package:arzonuz/logic/blocs/user/user_bloc.dart';
import 'package:arzonuz/ui/widgets/back_button.dart';
import 'package:arzonuz/ui/widgets/button_with_elevation.dart';
import 'package:arzonuz/ui/widgets/text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  final oldPassController = TextEditingController();
  final newPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<UserBloc>().add(
            UserChangePassEvent(
              changePassRequest: ChangePassRequest(
                  id: '',
                  newpassword: newPassController.text,
                  oldpassword: oldPassController.text),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
        title: const Text("Reset Password"),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserError) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(state.message),
                );
              },
            );
          }
          if (state is UserChangedPass) {
            showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  title: Text('Parolingiz muvaqiyatli almashdi'),
                );
              },
            );
          }
        },
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextInputWidget(
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return "Input your password";
                    }
                    return null;
                  },
                  labelText: 'Password',
                  controller: oldPassController,
                  name: 'Old Password',
                ),
                TextInputWidget(
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return "Input your password";
                    }
                    return null;
                  },
                  labelText: 'Password',
                  controller: newPassController,
                  name: 'New Password',
                ),
                const Spacer(),
                ButtonWithElevation(
                  bgColor: Colors.deepPurple.shade300,
                  onPressed: () => submit(context),
                  child: const Text(
                    "Change",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
