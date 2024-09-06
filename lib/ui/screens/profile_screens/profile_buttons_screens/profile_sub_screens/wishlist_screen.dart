import 'package:arzonuz/data/models/product_model/product.dart';
import 'package:arzonuz/logic/blocs/product/product_bloc.dart';
import 'package:arzonuz/ui/widgets/back_button.dart';
import 'package:arzonuz/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(ProductGetWishlistProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButtonWidget(),
        title: const Text(
          "Wishlist(12)",
        ),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        if (state is ProductErrorState) {
          print(state);
          return Center(
            child: Text(state.message),
          );
        }
        if (state is ProductGetWishlistProductsState) {
          print(state.products);
        }
        return Padding(
          padding: const EdgeInsets.all(20),
          child: GridView.builder(
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.5,
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
        );
      }),
    );
  }
}
