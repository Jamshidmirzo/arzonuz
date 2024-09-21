import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:arzonuz/features/arzonuz/home/presentation/pages/shop_categories_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Notificaiton"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/notif_big.png',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                context.tr('nontf'),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? const Color(0xFF342F3F)
                          : Colors.grey.shade300,
                ),
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
                      return const ShopCategoriesScreen(
                          categoreis: [1, 1, 1, 1, 1, 1, 1]);
                    },
                  ),
                );
              },
              child: Container(
                width: 250,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.deepPurple.shade300,
                ),
                child: Text(
                  context.tr('expc'),
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
