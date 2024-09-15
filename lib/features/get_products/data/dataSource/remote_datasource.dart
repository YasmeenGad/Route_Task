import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_route/features/get_products/data/models/product_model.dart';

abstract class RemoteDatasource {
  Future<List<ProductModel>> fetchProducts();
}

class RemoteDatasourceImpl extends RemoteDatasource {
  final http.Client client;
  RemoteDatasourceImpl({required this.client});

  @override
  Future<List<ProductModel>> fetchProducts() async {
    final response = await client.get(
      Uri.parse('https://fakestoreapi.com/products'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> productsJson = json.decode(response.body);
      return productsJson
          .map((jsonItem) => ProductModel.fromJson(jsonItem))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
