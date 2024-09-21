import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonWithElevation extends StatelessWidget {
  Widget? child;
  Color? bgColor;
  final VoidCallback? onPressed;
  ButtonWithElevation({
    super.key,
    required this.child,
    this.bgColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: bgColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 5,
              ),
              child: child),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
