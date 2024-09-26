import 'package:flutter/material.dart';
import 'package:shuhaui/features/improvement/json/model/cycloneoffer.dart';

class CycloneOfferWidget extends StatelessWidget {
  final CycloneOffer offer;

  CycloneOfferWidget({required this.offer});

  @override
  Widget build(BuildContext context) {
    print(offer.title);
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
          Image.asset(offer.imageUrl,height: 40,),
          SizedBox(height: 8),
          Text(
            offer.title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Text(
                '\$${offer.price}',
                style: TextStyle(
                    color: Colors.yellow, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8),
              Text(
                '\$${offer.originalPrice}',
                style: TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            '${offer.soldPercentage}% Sold',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 4),
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
