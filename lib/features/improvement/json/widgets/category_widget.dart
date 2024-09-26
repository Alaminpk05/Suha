import 'package:flutter/material.dart';
import 'package:shuhaui/features/home/data/model/category.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel category;

  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: Image.asset(
                category.iconUrl,
                fit: BoxFit.contain,
              )),
          const SizedBox(height: 8),
          Text(
            category.name,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
