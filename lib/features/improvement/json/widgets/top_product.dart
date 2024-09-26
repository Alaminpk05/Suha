import 'package:flutter/material.dart';
import 'package:shuhaui/features/improvement/json/model/top_product.dart';


class TopProductWidget extends StatelessWidget {
  final TopProduct product;

  TopProductWidget({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(product.imageUrl, fit: BoxFit.contain,)),
              if (product.isFavorite)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(Icons.favorite, color: Colors.red),
                ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: EdgeInsets.all(4),
                  color: Colors.orange,
                  child: Text('Sale', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            product.title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Text(
                '\$${product.price}',
                style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8),
              Text(
                '\$${product.originalPrice}',
                style: TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            product.timer,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.star, color: Colors.yellow, size: 16),
              SizedBox(width: 4),
              Text(
                '${product.rating} Stars',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
