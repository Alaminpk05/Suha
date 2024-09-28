class WeeklyProductModel {
  String name;
  double price;
  double originalPrice;
  double rating;
  int reviews;
  String image;
  bool isFavourite;

  WeeklyProductModel({
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.rating,
    required this.reviews,
    required this.image,
    required this.isFavourite,
  });

  // Factory constructor to create a Product from a JSON map
  factory WeeklyProductModel.fromJson(Map<String, dynamic> json) {
    return WeeklyProductModel(
      name: json['name'],
      price: json['price'].toDouble(),
      originalPrice: json['original_price'].toDouble(),
      rating: json['rating'].toDouble(),
      reviews: json['reviews'],
      image: json['image'],
      isFavourite: json['is_favourite'],
    );
  }

  // Method to convert a Product object to JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'original_price': originalPrice,
      'rating': rating,
      'reviews': reviews,
      'image': image,
      'is_favourite': isFavourite,
    };
  }
}
