import 'package:arzonuz/ui/screens/profile_screens/profile_buttons_screens/profile_sub_screens/reset_password_screen.dart';
import 'package:arzonuz/ui/widgets/back_button.dart';
import 'package:arzonuz/ui/widgets/bottom_for_lang.dart';
import 'package:arzonuz/ui/widgets/bottom_for_mode.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  void _showModalBottomSheetForMode(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const Bottomformode();
      },
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const Bottomforlang();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButtonWidget(),
        title: Text(
          context.tr('set'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ZoomTapAnimation(
              onTap: () {
                _showModalBottomSheet(context);
              },
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  Icons.language,
                  size: 40,
                ),
                title: Text(
                  context.tr('lng'),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ZoomTapAnimation(
              onTap: () {
                _showModalBottomSheetForMode(context);
              },
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  Icons.dark_mode_outlined,
                  size: 40,
                ),
                title: Text(
                  context.tr('mode'),
                  style: const TextStyle(fontSize: 20),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ZoomTapAnimation(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResetPasswordScreen();
                    },
                  ),
                );
              },
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  Icons.lock,
                  size: 40,
                ),
                title: Text(
                  context.tr('chpass'),
                  style: const TextStyle(fontSize: 20),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
