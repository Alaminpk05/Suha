class SliderImageModel {
  final int id;
  final String title;

  final String imageUrl;
  final String subtitle;

  SliderImageModel({
    required this.id,
    required this.title,

    required this.imageUrl,
    required this.subtitle,
  });

  // Factory method to create a Product from JSON
  factory SliderImageModel.fromJson(Map<String, dynamic> json) {
    return SliderImageModel(
      id: json['id'],
      title: json['title'],

      imageUrl: json['imageUrl'],
      subtitle: json['subtitle'],
    );
  }
}
