import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:arzonuz/logic/blocs/auth/auth_bloc.dart';
import 'package:arzonuz/logic/blocs/product/product_bloc.dart';
import 'package:arzonuz/ui/screens/filters_screens/filter_screen.dart';
import 'package:arzonuz/ui/screens/home_screens/products_list_view.dart';
import 'package:arzonuz/ui/widgets/category_list_view.dart';
import 'package:arzonuz/ui/widgets/product_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // context.read<AuthBloc>().add(
    //       AuthLogoutEvent(),
    //     );
    context.read<ProductBloc>().add(
          ProductGetAllProductsEvent(),
        );
  }

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
            // const CategoryListView(),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductErrorState) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                if (state is ProductLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductGetAllProductsState) {
                  print(state.products);
                  return SizedBox(
                    height: 570,
                    child: GridView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: state.products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.54,
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return ProductCard(product: state.products[index]);
                      },
                    ),
                  );
                  // return Column(
                  //   children: [
                  //     SizedBox(
                  //       height: 480,
                  //       child: ProductsListView(
                  //         firstText: context.tr('ts'),
                  //         products: state.products,
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       height: 480,
                  //       child: ProductsListView(
                  //         products: state.products,
                  //         firstText: context.tr('nIn'),
                  //       ),
                  //     ),
                  //   ],
                  // );
                }
                return const Center(
                  child: Text("No Products"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
