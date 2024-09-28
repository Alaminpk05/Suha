class FeaturedProductModel {
  String name;
  String price;
  String originalPrice;
  String image;

  FeaturedProductModel({
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.image,
    // Default is false if not provided
  });

  // Factory constructor to create a Product from a JSON map
  factory FeaturedProductModel.fromJson(Map<String, dynamic> json) {
    return FeaturedProductModel(
      name: json['name'],
      price: json['price'],
      originalPrice: json['original_price'],
      image: json['image'],
      // Default to false if not present
    );
  }

  // Method to convert a Product object to JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'original_price': originalPrice,
      'image': image,
    };
  }
}
