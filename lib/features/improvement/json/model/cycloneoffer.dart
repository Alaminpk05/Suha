class CycloneOffer {
  final int id;
  final String title;
  final double price;
  final double originalPrice;
  final int soldPercentage;
  final String imageUrl;

  CycloneOffer({
    required this.id,
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.soldPercentage,
    required this.imageUrl,
  });

  factory CycloneOffer.fromJson(Map<String, dynamic> json) {
    return CycloneOffer(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      originalPrice: json['originalPrice'],
      soldPercentage: json['soldPercentage'],
      imageUrl: json['imageUrl'],
    );
  }
}
