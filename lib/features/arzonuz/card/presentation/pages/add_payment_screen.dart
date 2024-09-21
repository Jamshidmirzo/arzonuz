import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:arzonuz/core/constants/constants.dart';
import 'package:arzonuz/features/arzonuz/card/data/model/card_request.dart';
import 'package:arzonuz/features/arzonuz/card/presentation/blocs/card/card_bloc.dart';
import 'package:arzonuz/features/arzonuz/home/presentation/widgets/back_button.dart';
import 'package:arzonuz/features/arzonuz/home/presentation/widgets/button_with_elevation.dart';
import 'package:arzonuz/features/arzonuz/home/presentation/widgets/text_input_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPaymentScreen extends StatefulWidget {
  const AddPaymentScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddPaymentScreenState createState() => _AddPaymentScreenState();
}

class _AddPaymentScreenState extends State<AddPaymentScreen> {
  final cardNumberController = TextEditingController();
  final ccvController = TextEditingController();
  final expController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void submit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      context.read<CardBloc>().add(CardEvent.cardAddEvent(
            CardRequest(
                card_number: cardNumberController.text,
                ccv: ccvController.text,
                expiration_date: expController.text),
          ));
    }
  }

  void _showDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 250,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            SizedBox(
              height: 180,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime newDateTime) {
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
              child: const Text('OK'),
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
          if (state.status== StatusCard.ERROR ) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(state.message?? ''),
                );
              },
            );
          }
          if (state.status==StatusCard.SUCCESS ) {
            context.read<CardBloc>().add(CardEvent.cardGetEvent());
            Future.delayed(const Duration(milliseconds: 200), () {
              Navigator.pop(context);
            });
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
