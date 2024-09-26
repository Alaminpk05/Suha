class Collections {
  String name;
  String image;
  int itemCount;

  Collections({
    required this.name,
    required this.image,
    required this.itemCount,
  });

  // Factory constructor to create a CollectionProduct from a JSON map
  factory Collections.fromJson(Map<String, dynamic> json) {
    return Collections(
      name: json['name'],
      image: json['image'],
      itemCount: json['item_count'],
    );
  }

  // Method to convert a CollectionProduct object to JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'item_count': itemCount,
    };
  }
}
