import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:arzonuz/features/arzonuz/home/presentation/pages/shop_categories_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        context.tr('categories'),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const Spacer(),
                      ZoomTapAnimation(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ShopCategoriesScreen(
                                    categoreis: [1, 1, 1, 1, 1, 1, 1, 1]);
                              },
                            ),
                          );
                        },
                        child: Text(
                          context.tr('see'),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.separated(
                padding: const EdgeInsets.only(left: 20),
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 14,
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AdaptiveTheme.of(context).mode ==
                                      AdaptiveThemeMode.light
                                  ? const Color(0xFF342F3F)
                                  : Colors.grey.shade300),
                          shape: BoxShape.circle,
                          color: Colors.deepPurple.shade300,
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/images/nike.png',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Bag',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  );
                },
              ),
            ),
           
      ],
    );
  }
}
