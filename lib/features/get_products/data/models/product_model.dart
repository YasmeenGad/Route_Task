import 'package:task_route/features/get_products/domain/entities/products.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required int id,
    required String title,
    required double price,
    required String description,
    required String category,
    required String image,
    required RatingModel rating,
  }) : super(
          id: id,
          title: title,
          price: price,
          description: description,
          category: category,
          image: image,
          rating: rating,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] is int ? json['id'] : int.parse(json['id']),
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(), // Handle price as num
      description: json['description'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      rating: RatingModel.fromJson(json['rating']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': (rating as RatingModel).toJson(),
    };
  }
}

class RatingModel extends RatingEntity {
  RatingModel({
    required double rate,
    required int count,
  }) : super(rate: rate, count: count);

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate: (json['rate'] as num).toDouble(), // Handle rate as num
      count: json['count'] is int ? json['count'] : int.parse(json['count']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'count': count,
    };
  }
}
