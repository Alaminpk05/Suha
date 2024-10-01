class ProductDetailsModel{

  ProductDetailsModel({required this.image});
  final String image;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      image: json['image'],  // Accesses the 'image' key from the JSON
    );
  }


}