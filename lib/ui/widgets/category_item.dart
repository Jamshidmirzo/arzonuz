import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.deepPurple.shade300,
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/nike.png',
            ),
          ),
        ),
      ),
      title: const Text(
        "Hoodies",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
