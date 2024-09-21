import 'package:arzonuz/features/arzonuz/product/presentation/bloc/product_bloc.dart';
import 'package:arzonuz/features/arzonuz/home/presentation/widgets/back_button.dart';
import 'package:arzonuz/features/arzonuz/home/presentation/widgets/product_card.dart';
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
    context.read<ProductBloc>().add(
          ProductGetWishlistProductsEvent(),
        );
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
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductErrorState) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is ProductInitial) {
            return const Center(
              child: Text('YOu dont hasve a wishlist'),
            );
          }
          if (state is ProductGetWishlistProductsState) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: GridView.builder(
                itemCount: state.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.5,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return ProductCard(product: product);
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
