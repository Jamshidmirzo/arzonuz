import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:arzonuz/features/arzonuz/presentation/blocs/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        Navigator.pop(context);
        context.read<UserBloc>().add(UserGetUserEvent());
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
              ? Colors.grey.shade300
              : const Color(0xFF342F3F),
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          'assets/icons/back.png',
          width: 16,
          height: 16,
        ),
      ),
    );
  }
}
