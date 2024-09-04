import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:arzonuz/ui/widgets/back_button.dart';
import 'package:arzonuz/ui/widgets/filter_button.dart';
import 'package:arzonuz/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  openSortBy(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (BuildContext modalContext) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Clear',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Sort By',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(modalContext);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const FilterButtonWidget(
                text: 'Recommended',
                index: 0,
              ),
              const FilterButtonWidget(
                index: 1,
                text: 'Newest',
              ),
              const FilterButtonWidget(
                index: 2,
                text: 'Lowest-Highest price',
              ),
              const FilterButtonWidget(
                index: 3,
                text: 'Highest-Lowest price',
              ),
            ],
          ),
        );
      },
    );
  }

  openGender() {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (BuildContext modalContext) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Clear',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Gender',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(modalContext);
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const FilterButtonWidget(
                text: 'Men',
                index: 0,
              ),
              const FilterButtonWidget(
                index: 1,
                text: 'Women',
              ),
              const FilterButtonWidget(
                index: 2,
                text: 'Kids',
              ),
            ],
          ),
        );
      },
    );
  }

  openDeals() {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (BuildContext modalContext) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Clear',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Deals',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(modalContext);
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const FilterButtonWidget(
                text: 'On Sale',
                index: 0,
              ),
              const FilterButtonWidget(
                index: 1,
                text: 'Free Shipping Eliglbe',
              ),
            ],
          ),
        );
      },
    );
  }

  openPrice() {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (BuildContext modalContext) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Clear',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Price',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(modalContext);
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const FilterButtonWidget(
                text: 'Min',
                index: 0,
              ),
              const FilterButtonWidget(
                index: 1,
                text: 'Max',
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
        title: TextFormField(
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Container(
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                'assets/icons/search.png',
                width: 20,
                height: 20,
                color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const FilterButton(
                    text: '2',
                    iconPath: 'assets/icons/sort.png',
                    isHighlighted: true,
                  ),
                  const SizedBox(width: 10),
                  FilterButton(
                    onTap: () => openDeals(),
                    text: 'Deals',
                    iconPath: 'assets/icons/back_h.png',
                  ),
                  const SizedBox(width: 10),
                  FilterButton(
                    onTap: () => openPrice(),
                    text: 'Price',
                    iconPath: 'assets/icons/back_h.png',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FilterButton(
                    text: 'Sort by',
                    iconPath: 'assets/icons/back_h.png',
                    onTap: () => openSortBy(context),
                  ),
                  const SizedBox(width: 10),
                  FilterButton(
                    onTap: () => openGender(),
                    text: 'Gender',
                    iconPath: 'assets/icons/back_h.png',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.6,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return const ProductCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String text;
  final String iconPath;
  final bool isHighlighted;
  final Function()? onTap;
  const FilterButton({
    this.onTap,
    required this.text,
    required this.iconPath,
    this.isHighlighted = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isHighlighted
              ? Colors.deepPurple
              : Colors.deepPurple.withOpacity(0.7),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconPath.isNotEmpty)
              Image.asset(
                iconPath,
                width: 16,
                height: 16,
                color: Colors.white,
              ),
            const SizedBox(width: 5),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
