import 'package:arzonuz/features/arzonuz/data/models/product_model/product.dart';
import 'package:arzonuz/features/arzonuz/data/models/product_model/product_responce.dart';
import 'package:arzonuz/features/arzonuz/presentation/widgets/back_button.dart';
import 'package:arzonuz/features/arzonuz/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class MoreByCategoriesScreen extends StatelessWidget {
  const MoreByCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hoodies(240)',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.6,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: Product(
                        color: [],
                        description: '',
                        end_date: '',
                        id: '',
                        limit_of_product: 10,
                        name: 'Somsa',
                        photos: [],
                        price: 12,
                        price_without_stock: 13,
                        seller_id: '',
                        size: [],
                        start_date: '',
                        stock: 0),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
