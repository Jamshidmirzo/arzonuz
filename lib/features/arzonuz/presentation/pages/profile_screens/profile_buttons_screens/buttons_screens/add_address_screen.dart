import 'package:arzonuz/features/arzonuz/presentation/widgets/back_button.dart';
import 'package:arzonuz/features/arzonuz/presentation/widgets/button_with_elevation.dart';
import 'package:arzonuz/features/arzonuz/presentation/widgets/text_input_widget.dart';
import 'package:flutter/material.dart';

class AddAddressScreen extends StatelessWidget {
  AddAddressScreen({super.key});
  final streetAddress = TextEditingController();
  final cityAddress = TextEditingController();
  final stateAddress = TextEditingController();
  final ziptAddress = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  submit() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButtonWidget(),
        title: const Text(
          "Add Address",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextInputWidget(
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Input your street';
                  }
                  return null;
                },
                filledColor: Colors.grey.shade300,
                filledColorbool: true,
                controller: streetAddress,
                name: 'Street Address',
                labelText: 'Street Address',
              ),
              TextInputWidget(
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Input your city';
                  }
                  return null;
                },
                filledColor: Colors.grey.shade300,
                filledColorbool: true,
                controller: cityAddress,
                name: 'City Address',
                labelText: 'City Address',
              ),
              const Spacer(),
              ButtonWithElevation(
                onPressed: () => submit(),
                bgColor: Colors.deepPurple,
                child: const Center(
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
