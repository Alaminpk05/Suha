// ignore_for_file: public_member_api_docs, sort_constructors_first
class TopProduct {
  final int id;
  final String status;
  final String title;
  final double price;
  final double originalPrice;
  final int rating;
  final String timer;
  final bool isFavorite;
  final String imageUrl;
  final bool istimer;
  final String minibuttonword;

  TopProduct({
    required this.id,
    required this.status,
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.rating,
    required this.timer,
    required this.isFavorite,
    required this.imageUrl,
    required this.istimer,
    required this.minibuttonword,
  });

  factory TopProduct.fromJson(Map<String, dynamic> json) {
    return TopProduct(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      originalPrice: json['originalPrice'],
      rating: json['rating'],
      timer: json['timer'],
      isFavorite: json['isFavorite'],
      imageUrl: json['imageUrl'],
      status: json['imageUrl'],
      istimer: json['istimer'], minibuttonword: json['minibuttonword'],
    );
  }
}
