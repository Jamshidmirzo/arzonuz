import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:arzonuz/ui/screens/product_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const ProductInfoScreen();
            },
          ),
        );
      },
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
              ? Colors.grey.shade200
              : const Color(0xFF342F3F),
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 250,
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/nike.png'),
                ),
              ),
              child: ZoomTapAnimation(
                onTap: () {
                  isLiked = !isLiked;
                  setState(() {});
                },
                child: isLiked
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : Image.asset(
                        'assets/icons/like.png',
                        width: 20,
                        height: 20,
                      ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Men`s Harington Jacket',
                  ),
                  Text(
                    '\$148',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
