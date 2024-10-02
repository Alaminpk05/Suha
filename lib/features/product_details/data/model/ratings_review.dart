// Author Model Class
class Author {
  final String name;
  final String date;
  final String profilePicture;

  Author({
    required this.name,
    required this.date,
    required this.profilePicture,
  });

  // Factory method to create an Author from JSON
  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      name: json['name'],
      date: json['date'],
      profilePicture: json['profile_picture'],
    );
  }

  // Method to convert an Author object into a JSON-compatible map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'date': date,
      'profile_picture': profilePicture,
    };
  }
}

// Review Model Class
class ReviewModel {
  final int rating;
  final String reviewText;
  final Author author;
  // Nullable for optional field
  final List<String>? reviewImages; // Nullable for optional field

  ReviewModel({
    required this.rating,
    required this.reviewText,
    required this.author,
   
    this.reviewImages,
  });

  // Factory method to create a Review from JSON
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      rating: json['rating'],
      reviewText: json['review'],
      author: Author.fromJson(json['author']),
     
      reviewImages: json['reviewimages'] != null
          ? List<String>.from(json['reviewimages']) // Cast to List<String> if present
          : null,
    );
  }

  // Method to convert a Review object into a JSON-compatible map
  Map<String, dynamic> toJson() {
    final data = {
      'rating': rating,
      'review': reviewText,
      'author': author.toJson(),
    };

    if (reviewImages != null) {
      data['reviewimages'] = reviewImages!;
    }

    return data;
  }
}
