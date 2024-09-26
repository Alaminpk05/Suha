import 'package:flutter/material.dart';
import 'package:shuhaui/features/home/data/model/top_product.dart';


class TopProductWidget extends StatelessWidget {
  final TopProduct product;

  const TopProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
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
                const Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(Icons.favorite, color: Colors.red),
                ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  color: Colors.orange,
                  child: const Text('Sale', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            product.title,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                '\$${product.price}',
                style: const TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              Text(
                '\$${product.originalPrice}',
                style: const TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            product.timer,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.yellow, size: 16),
              const SizedBox(width: 4),
              Text(
                '${product.rating} Stars',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
