import 'dart:async';

import 'package:arzonuz/data/models/product_model/product.dart';
import 'package:arzonuz/ui/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ProductInfoScreen extends StatefulWidget {
  final Product product;
  const ProductInfoScreen({super.key, required this.product});

  @override
  // ignore: library_private_types_in_public_api
  _ProductInfoScreenState createState() => _ProductInfoScreenState();
}

class _ProductInfoScreenState extends State<ProductInfoScreen> {
  final ItemScrollController _scrollController = ItemScrollController();
  Timer? _timer;
  int _currentIndex = 0;
  final int _totalItems = 10;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (_currentIndex < _totalItems - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _scrollController.scrollTo(
        index: _currentIndex,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButtonWidget(),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(8),
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/icons/like.png',
              width: 16,
              height: 16,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ScrollablePositionedList.builder(
                itemCount: _totalItems,
                scrollDirection: Axis.horizontal,
                itemScrollController: _scrollController,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 250,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.amber,
                      image: DecorationImage(
                        image: widget.product.photos.isEmpty
                            ? const AssetImage('assets/image/bro.png')
                            : NetworkImage(widget.product.photos[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    '${widget.product.price} sum',
                    style: const TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${widget.product.price_without_stock} sum',
                    style: const TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
