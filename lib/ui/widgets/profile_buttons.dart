import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class ProfileButtons extends StatelessWidget {
  final String text;
  final dynamic Function()? onTap;
  const ProfileButtons({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                  ? Colors.grey.shade300
                  : const Color(0xFF342F3F),
            ),
            child: Row(
              children: [
                Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16),
                ),
                const Spacer(),
                Image.asset(
                  'assets/icons/back_v.png',
                  width: 24,
                  height: 24,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? const Color(0xFF342F3F)
                          : Colors.grey.shade300,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
