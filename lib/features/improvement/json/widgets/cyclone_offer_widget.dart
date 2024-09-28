import 'package:flutter/material.dart';
import 'package:shuhaui/features/home/data/model/cycloneoffer.dart';

class CycloneOfferWidget extends StatelessWidget {
  final CycloneOfferModel offer;

  const CycloneOfferWidget({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    print(offer.title);
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
          Image.asset(
            offer.imageUrl,
            height: 40,
          ),
          const SizedBox(height: 8),
          Text(
            offer.title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                '\$${offer.price}',
                style: const TextStyle(
                    color: Colors.yellow, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              Text(
                '\$${offer.originalPrice}',
                style: const TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '${offer.soldPercentage}% Sold',
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: offer.soldPercentage / 100,
            backgroundColor: Colors.grey,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
