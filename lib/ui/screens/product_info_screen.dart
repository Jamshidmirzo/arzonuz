// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:arzonuz/data/models/product_model/product.dart';
import 'package:arzonuz/ui/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProductInfoScreen extends StatefulWidget {
  final Product product;
  const ProductInfoScreen({
    super.key,
    required this.product,
  });

  @override
  _ProductInfoScreenState createState() => _ProductInfoScreenState();
}

class _ProductInfoScreenState extends State<ProductInfoScreen> {
  final ItemScrollController _scrollController = ItemScrollController();
  Timer? _timer;
  int _currentIndex = 0;
  final int _totalItems = 10;
  double avgStar = 3.4;
  int lengthFeedbacks = 0;
  Duration remainingTime = Duration.zero;
  Timer? _countdownTimer;
  int _days = 0;
  int _hours = 0;
  int _minutes = 0;
  int _seconds = 0;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
    _startCountdown();
  }

  void _startCountdown() {
    // Parse the end date from the product model
    DateTime endDate = DateFormat('yyyy-MM-dd').parse(widget.product.end_date);

    DateTime now = DateTime.now();

    setState(() {
      remainingTime = endDate.difference(now);
      _days = remainingTime.inDays;
      _hours = remainingTime.inHours.remainder(24);
      _minutes = remainingTime.inMinutes.remainder(60);
      _seconds = remainingTime.inSeconds.remainder(60);
    });

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime.inSeconds > 0) {
          remainingTime = Duration(seconds: remainingTime.inSeconds - 1);
          _days = remainingTime.inDays;
          _hours = remainingTime.inHours.remainder(24);
          _minutes = remainingTime.inMinutes.remainder(60);
          _seconds = remainingTime.inSeconds.remainder(60);
        } else {
          _countdownTimer?.cancel();
        }
      });
    });
  }

  String twoDigits(int n) => n.toString().padLeft(2, '0');

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

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    final days = duration.inDays;
    final hours = twoDigits(duration.inHours.remainder(24));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return days > 0 ? '$days  $hours:$minutes' : '$hours:$minutes:$seconds';
  }

  @override
  void dispose() {
    _timer?.cancel();
    _countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
            ZoomTapAnimation(
              child: Container(
                alignment: Alignment.center,
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurple,
                ),
                child: const Text(
                  "To Cart",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 350,
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
                              ? const AssetImage('assets/images/bro.png')
                              : NetworkImage(widget.product.photos[index])
                                  as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 8,
                    child: Row(
                      children: [
                        _buildTimeBox(_days.toString(), 'Days'),
                        const SizedBox(
                          width: 10,
                        ),
                        _buildTimeBox(twoDigits(_hours), 'Hours'),
                        const SizedBox(
                          width: 10,
                        ),
                        _buildTimeBox(twoDigits(_minutes), 'Minutes'),
                        const SizedBox(
                          width: 10,
                        ),
                        _buildTimeBox(twoDigits(_seconds), 'Seconds'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: 175,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: List.generate(
                            5,
                            (index) {
                              if (index < avgStar.floor()) {
                                return const Icon(Icons.star,
                                    color: Colors.amber);
                              } else if (index == avgStar.floor() &&
                                  avgStar % 1 != 0) {
                                return const Icon(Icons.star_half,
                                    color: Colors.amber);
                              } else {
                                return const Icon(Icons.star_border,
                                    color: Colors.grey);
                              }
                            },
                          ),
                        ),
                        Text('$lengthFeedbacks feedbacks'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    width: 100,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          lengthFeedbacks.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const Text('Заказов'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Choose a color'),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final color = Color(int.parse(widget.product.color[index]));
                    return Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        shape: BoxShape.circle,
                        color: color,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: widget.product.color.length,
                ),
              ),
              const SizedBox(height: 20),
              const Text('Choose a size'),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final size = widget.product.size[index];
                    return Container(
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text(
                        size,
                        style: const TextStyle(fontSize: 16),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: widget.product.size.length,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    '${widget.product.price} sum',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 60,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepPurple,
                    ),
                    child: Text(
                      '-${widget.product.stock}%',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Text(
                '${widget.product.price_without_stock} sum',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'About tovar',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                widget.product.description,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    '$lengthFeedbacks feedbacks',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'All',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: List.generate(
                                5,
                                (index) {
                                  if (index < avgStar.floor()) {
                                    return const Icon(Icons.star,
                                        color: Colors.amber);
                                  } else if (index == avgStar.floor() &&
                                      avgStar % 1 != 0) {
                                    return const Icon(Icons.star_half,
                                        color: Colors.amber);
                                  } else {
                                    return const Icon(Icons.star_border,
                                        color: Colors.grey);
                                  }
                                },
                              ),
                            ),
                            const Text(
                                'Consequat proident fugiat labore adipisicing labore aute ut amet elit ex anim officia et.Ipsum et anim aute et qui consectetur exercitation enim ipsum officia id sint.Reprehenderit amet ea occaecat esse incididunt cillum nostrud adipisicing aliqua anim aliqua id culpa.Sunt velit pariatur veniam ea.')
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeBox(String time, String label) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade300,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              time,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
