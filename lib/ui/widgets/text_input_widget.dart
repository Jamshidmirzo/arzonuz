import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextInputWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String name;
  final String? labelText;
  String? Function(String?)? validator;
  Widget? prefIcon;
  bool obscure;
  Widget? suffIcon;
  bool? filledColorbool;
  Color? filledColor;
  Widget? suffixIcon;

  TextInputWidget(
      {super.key,
      this.suffixIcon,
      this.filledColor,
      this.filledColorbool,
      this.prefIcon,
      this.obscure = false,
      required this.controller,
      required this.name,
      this.labelText,
      this.suffIcon,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          obscureText: obscure,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            fillColor: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                ? Colors.grey.shade300
                : const Color(0xFF342F3F),
            filled: filledColorbool,
            prefixIcon: prefIcon,
            suffixIcon: suffIcon,
            labelText: labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
