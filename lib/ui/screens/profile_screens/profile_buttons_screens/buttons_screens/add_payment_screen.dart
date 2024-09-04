import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:arzonuz/data/models/card_request.dart';
import 'package:arzonuz/logic/blocs/card/card_bloc.dart';
import 'package:arzonuz/ui/widgets/back_button.dart';
import 'package:arzonuz/ui/widgets/button_with_elevation.dart';
import 'package:arzonuz/ui/widgets/text_input_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPaymentScreen extends StatefulWidget {
  const AddPaymentScreen({super.key});

  @override
  _AddPaymentScreenState createState() => _AddPaymentScreenState();
}

class _AddPaymentScreenState extends State<AddPaymentScreen> {
  final cardNumberController = TextEditingController();
  final ccvController = TextEditingController();
  final expController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<CardBloc>().add(
            CardAddEvent(
              cardRequest: CardRequest(
                  card_number: cardNumberController.text,
                  ccv: ccvController.text,
                  expiration_date: expController.text),
            ),
          );
      context.read<CardBloc>().add(CardGetEvent());
    }
  }

  void _showDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 250,
        color: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            SizedBox(
              height: 180,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime newDateTime) {
                  // Update the expiration date
                  setState(() {
                    expController.text =
                        "${newDateTime.month.toString().padLeft(2, '0')}/${newDateTime.year.toString().substring(2)}";
                  });
                },
                use24hFormat: true,
                maximumDate: DateTime(2030, 12, 31),
                minimumYear: DateTime.now().year,
              ),
            ),
            CupertinoButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButtonWidget(),
        title: const Text(
          "Add Payment",
        ),
      ),
      body: BlocConsumer<CardBloc, CardState>(
        listener: (context, state) {
          if (state is CardError) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(state.message),
                );
              },
            );
          }
          if (state is CardAdded) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextInputWidget(
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Input your card number';
                      }
                      return null;
                    },
                    filledColor: Colors.grey.shade300,
                    filledColorbool: true,
                    controller: cardNumberController,
                    name: 'Card Number',
                    labelText: 'Card Number',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: ccvController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Input CCV';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            fillColor: AdaptiveTheme.of(context).mode ==
                                    AdaptiveThemeMode.light
                                ? Colors.grey.shade300
                                : const Color(0xFF342F3F),
                            filled: true,
                            labelText: 'CCV',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _showDatePicker(context),
                          child: AbsorbPointer(
                            child: TextFormField(
                              controller: expController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Input Expiration Date';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                fillColor: AdaptiveTheme.of(context).mode ==
                                        AdaptiveThemeMode.light
                                    ? Colors.grey.shade300
                                    : const Color(0xFF342F3F),
                                filled: true,
                                labelText: 'Exp',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  ButtonWithElevation(
                    onPressed: () => submit(context),
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
          );
        },
      ),
    );
  }
}
