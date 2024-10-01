class SliderImageModel {

  final String title;

  final String imageUrl;
  final String subtitle;

  SliderImageModel({

    required this.title,

    required this.imageUrl,
    required this.subtitle,
  });

  // Factory method to create a Product from JSON
  factory SliderImageModel.fromJson(Map<String, dynamic> json) {
    return SliderImageModel(

      title: json['title'],

      imageUrl: json['imageUrl'],
      subtitle: json['subtitle'],
    );
  }
}
