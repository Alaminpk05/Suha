import 'package:flutter/material.dart';
import 'package:shuhaui/features/improvement/json/model/category.dart';


class CategoryWidget extends StatelessWidget {
  final Category category;

  CategoryWidget({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Image.asset(category.iconUrl,fit: BoxFit.contain,)),
          SizedBox(height: 8),
          Text(
            category.name,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
