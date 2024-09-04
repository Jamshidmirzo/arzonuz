import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:arzonuz/ui/screens/filters_screens/filter_screen.dart';
import 'package:arzonuz/ui/screens/home_screens/products_list_view.dart';
import 'package:arzonuz/ui/widgets/category_list_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 50,
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('assets/images/bro.png'),
            ),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.deepPurple.shade300,
            ),
            child: Image.asset(
              'assets/icons/cart.png',
              width: 16,
              height: 16,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: context.tr('search'),
                          prefixIcon: Container(
                            padding: const EdgeInsets.all(12),
                            child: Image.asset(
                              'assets/icons/search.png',
                              width: 20,
                              height: 20,
                              color: AdaptiveTheme.of(context).mode ==
                                      AdaptiveThemeMode.light
                                  ? const Color(0xFF342F3F)
                                  : Colors.grey.shade300,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ZoomTapAnimation(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const FilterScreen();
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: 55,
                        height: 55,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.deepPurple.shade300,
                        ),
                        child: const Icon(
                          CupertinoIcons.settings,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            const CategoryListView(),
            ProductsListView(
              firstText: context.tr('ts'),
            ),
            ProductsListView(
              firstText: context.tr('nIn'),
            ),
          ],
        ),
      ),
    );
  }
}
