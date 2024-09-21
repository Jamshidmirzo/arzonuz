import 'package:arzonuz/features/arzonuz/product/presentation/bloc/product_bloc.dart';
import 'package:arzonuz/features/arzonuz/home/presentation/widgets/back_button.dart';
import 'package:arzonuz/features/arzonuz/home/presentation/widgets/my_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeMyProducts extends StatefulWidget {
  const SeeMyProducts({super.key});

  @override
  State<SeeMyProducts> createState() => _SeeMyProductsState();
}

class _SeeMyProductsState extends State<SeeMyProducts> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(ProductGetMyProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
        title: const Text("My Products"),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductErrorState) {
            return Center(
              child: Text(
                state.message,
              ),
            );
          }
          if (state is ProductDeletedState) {
            context.read<ProductBloc>().add(ProductGetMyProductsEvent());
            return const Center(
              child: Text("Product deleted. Refreshing..."),
            );
          }
          if (state is ProductNoProductsState) {
            return const Center(
              child: Text("You don`t have a product"),
            );
          }
          if (state is ProductGetProductsState) {
            if (state.products.isNotEmpty) {
              return GridView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: state.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.5,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return MyProductCard(
                    product: product,
                  );
                },
              );
            }
            return const Center(
              child: Text("You dont have products"),
            );
          }
          return Container();
        },
      ),
    );
  }
}
