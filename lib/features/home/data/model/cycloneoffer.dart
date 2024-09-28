class CycloneOfferModel {
  final int id;
  final String title;
  final double price;
  final double originalPrice;
  final double soldPercentage;
  final String imageUrl;

  CycloneOfferModel({
    required this.id,
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.soldPercentage,
    required this.imageUrl,
  });

  factory CycloneOfferModel.fromJson(Map<String, dynamic> json) {
    return CycloneOfferModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      originalPrice: json['originalPrice'],
      soldPercentage: json['soldPercentage'],
      imageUrl: json['imageUrl'],
    );
  }
}
