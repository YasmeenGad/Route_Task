import 'package:task_route/features/get_products/domain/entities/products.dart';

class ProductModel extends Product {
  ProductModel({
    required int id,
    required String title,
    required String description,
    required String category,
    required double price,
    required double discountPercentage,
    required double rating,
    required int stock,
    required List<String> tags,
    required String brand,
    required String sku,
    required int weight,
    required DimensionsModel dimensions,
    required String warrantyInformation,
    required String shippingInformation,
    required String availabilityStatus,
    required List<ReviewModel> reviews,
    required String returnPolicy,
    required int minimumOrderQuantity,
    required MetaModel meta,
    required List<String> images,
    required String thumbnail,
  }) : super(
          id: id,
          title: title,
          description: description,
          category: category,
          price: price,
          discountPercentage: discountPercentage,
          rating: rating,
          stock: stock,
          tags: tags,
          brand: brand,
          sku: sku,
          weight: weight,
          dimensions: dimensions,
          warrantyInformation: warrantyInformation,
          shippingInformation: shippingInformation,
          availabilityStatus: availabilityStatus,
          reviews: reviews,
          returnPolicy: returnPolicy,
          minimumOrderQuantity: minimumOrderQuantity,
          meta: meta,
          images: images,
          thumbnail: thumbnail,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id']?? 0,
      title: json['title']?? '',
      description: json['description']?? '',
      category: json['category']?? '',
      price: json['price'].toDouble()?? 0.0,
      discountPercentage: json['discountPercentage'].toDouble()?? 0.0,
      rating: json['rating'].toDouble()?? 0.0,
      stock: json['stock']?? 0,
      tags: List<String>.from(json['tags'])?? [],
      brand: json['brand']?? '',
      sku: json['sku']?? '',
      weight: json['weight']?? 0,
      dimensions: DimensionsModel.fromJson(json['dimensions']),
      warrantyInformation: json['warrantyInformation']?? '',
      shippingInformation: json['shippingInformation']?? '',
      availabilityStatus: json['availabilityStatus']?? '',
      reviews: (json['reviews'] as List)
          .map((review) => ReviewModel.fromJson(review))
          .toList()?? [],
      returnPolicy: json['returnPolicy']?? '',
      minimumOrderQuantity: json['minimumOrderQuantity']?? 0,
      meta: MetaModel.fromJson(json['meta']) ,
      images: List<String>.from(json['images'])?? [],
      thumbnail: json['thumbnail']?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'tags': tags,
      'brand': brand,
      'sku': sku,
      'weight': weight,
      'dimensions': (dimensions as DimensionsModel).toJson(),
      'warrantyInformation': warrantyInformation,
      'shippingInformation': shippingInformation,
      'availabilityStatus': availabilityStatus,
      'reviews': reviews.map((review) => (review as ReviewModel).toJson()).toList(),
      'returnPolicy': returnPolicy,
      'minimumOrderQuantity': minimumOrderQuantity,
      'meta': (meta as MetaModel).toJson(),
      'images': images,
      'thumbnail': thumbnail,
    };
  }
}

class DimensionsModel extends Dimensions {
  DimensionsModel({
    required double width,
    required double height,
    required double depth,
  }) : super(
          width: width,
          height: height,
          depth: depth,
        );

  factory DimensionsModel.fromJson(Map<String, dynamic> json) {
    return DimensionsModel(
      width: json['width'].toDouble(),
      height: json['height'].toDouble(),
      depth: json['depth'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'width': width,
      'height': height,
      'depth': depth,
    };
  }
}

class ReviewModel extends Review {
  ReviewModel({
    required int rating,
    required String comment,
    required DateTime date,
    required String reviewerName,
    required String reviewerEmail,
  }) : super(
          rating: rating,
          comment: comment,
          date: date,
          reviewerName: reviewerName,
          reviewerEmail: reviewerEmail,
        );

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      rating: json['rating'],
      comment: json['comment'],
      date: DateTime.parse(json['date']),
      reviewerName: json['reviewerName'],
      reviewerEmail: json['reviewerEmail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'comment': comment,
      'date': date.toIso8601String(),
      'reviewerName': reviewerName,
      'reviewerEmail': reviewerEmail,
    };
  }
}

class MetaModel extends Meta {
  MetaModel({
    required DateTime createdAt,
    required DateTime updatedAt,
    required String barcode,
    required String qrCode,
  }) : super(
          createdAt: createdAt,
          updatedAt: updatedAt,
          barcode: barcode,
          qrCode: qrCode,
        );

  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return MetaModel(
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      barcode: json['barcode'],
      qrCode: json['qrCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'barcode': barcode,
      'qrCode': qrCode,
    };
  }
}
