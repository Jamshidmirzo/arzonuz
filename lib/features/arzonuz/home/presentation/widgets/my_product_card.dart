import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:arzonuz/features/arzonuz/product/data/model/product_model/product.dart';
import 'package:arzonuz/features/arzonuz/favourite/presentation/blocs/favourite/favourite_bloc.dart';
import 'package:arzonuz/features/arzonuz/favourite/presentation/blocs/favourite/favourite_event.dart';
import 'package:arzonuz/features/arzonuz/favourite/presentation/blocs/favourite/favourite_state.dart';
import 'package:arzonuz/features/arzonuz/feedbacks/presentation/blocs/feedback/feedback_bloc.dart';
import 'package:arzonuz/features/arzonuz/product/presentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MyProductCard extends StatefulWidget {
  final Product product;
  const MyProductCard({super.key, required this.product});

  @override
  State<MyProductCard> createState() => _MyProductCardState();
}

class _MyProductCardState extends State<MyProductCard> {
  int avgStar = 0;
  int lengthFeedbacks = 0;

  @override
  void initState() {
    super.initState();

    context.read<FeedbackBloc>().add(
          FeedbackGetAll(productId: widget.product.id),
        );

    context.read<FavoriteBloc>().add(LoadFavorites());
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.product.id.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        // Trigger the delete action
        context.read<ProductBloc>().add(
              ProductdeleteProductEvent(productId: widget.product.id),
            );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${widget.product.name} deleted')),
        );
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: BlocBuilder<FeedbackBloc, FeedbackState>(
        builder: (context, feedbackState) {
          if (feedbackState is FeedbackError) {
            avgStar = 0;
            lengthFeedbacks = 0;
          } else if (feedbackState is FeedbackLoaded) {
            // Handle feedback data
          }

          return BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (context, favoriteState) {
              bool isLiked =
                  favoriteState.favoriteProducts.contains(widget.product.id);

              return ZoomTapAnimation(
                onTap: () {},
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: AdaptiveTheme.of(context).mode ==
                            AdaptiveThemeMode.light
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
                            } else {
                              context
                                  .read<FavoriteBloc>()
                                  .add(AddFavorite(widget.product.id));
                              context.read<ProductBloc>().add(
                                    ProductAddtoWishlistEvent(
                                        productId: widget.product.id),
                                  );
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
      ),
    );
  }
}
