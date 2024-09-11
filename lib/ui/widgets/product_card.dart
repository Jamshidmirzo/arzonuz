import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:arzonuz/data/models/product_model/product.dart';
import 'package:arzonuz/logic/blocs/favourite/favourite_bloc.dart';
import 'package:arzonuz/logic/blocs/favourite/favourite_event.dart';
import 'package:arzonuz/logic/blocs/favourite/favourite_state.dart';
import 'package:arzonuz/logic/blocs/feedback/feedback_bloc.dart';
import 'package:arzonuz/logic/blocs/product/product_bloc.dart';
import 'package:arzonuz/ui/screens/product_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int avgStar = 0;
  int lengthFeedbacks = 0;

  @override
  void initState() {
    super.initState();

    // Fetch feedback for the product
    context.read<FeedbackBloc>().add(
          FeedbackGetAll(productId: widget.product.id),
        );

    // Load favorite products from shared preferences
    context.read<FavoriteBloc>().add(LoadFavorites());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedbackBloc, FeedbackState>(
      builder: (context, feedbackState) {
        if (feedbackState is FeedbackError) {
          avgStar = 0;
          lengthFeedbacks = 0;
        } else if (feedbackState is FeedbackLoaded) {
          // avgStar = feedbackState.feedbackRequest.average_rating;
          // lengthFeedbacks = feedbackState.feedbackRequest.feedbackCount;
        }

        return BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, favoriteState) {
            bool isLiked =
                favoriteState.favoriteProducts.contains(widget.product.id);

            return ZoomTapAnimation(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProductInfoScreen(
                        product: widget.product,
                      );
                    },
                  ),
                );
              },
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
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
                          if (isLiked) {
                            context
                                .read<FavoriteBloc>()
                                .add(RemoveFavorite(widget.product.id));
                            // context
                            //     .read<ProductBloc>()
                            //     .add(ProductGetAllProductsEvent());
                          } else {
                            context
                                .read<FavoriteBloc>()
                                .add(AddFavorite(widget.product.id));
                            context.read<ProductBloc>().add(
                                  ProductAddtoWishlistEvent(
                                      productId: widget.product.id),
                                );
                            context
                                .read<ProductBloc>()
                                .add(ProductGetAllProductsEvent());
                          }
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
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.product.name),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 12,
                              ),
                              const SizedBox(width: 5),
                              Text(avgStar.toString()),
                              const SizedBox(width: 5),
                              Text('($lengthFeedbacks feedbacks)'),
                            ],
                          ),
                          Text(
                            '\$${widget.product.price_without_stock}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          Text(
                            '\$${widget.product.price}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
