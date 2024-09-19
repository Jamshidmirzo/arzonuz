import 'package:arzonuz/features/arzonuz/data/models/product_model/product.dart';
import 'package:arzonuz/features/arzonuz/data/models/product_model/product_responce.dart';
import 'package:arzonuz/features/arzonuz/presentation/widgets/product_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProductsListView extends StatelessWidget {
  final List<Product> products;
  final String firstText;
  final Function()? seeAllTap;
  const ProductsListView(
      {super.key,
      required this.firstText,
      this.seeAllTap,
      required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    firstText,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  ZoomTapAnimation(
                    onTap: seeAllTap,
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
          height: 370,
          child: ListView.separated(
            padding: const EdgeInsets.only(left: 20),
            itemCount: products.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 10,
              );
            },
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(
                product: product,
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
