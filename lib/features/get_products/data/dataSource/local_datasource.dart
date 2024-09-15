import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_route/features/get_products/data/models/product_model.dart';

abstract class LocalDatasource {
  Future<void> cacheProducts(List<ProductModel> products);
  Future<List<ProductModel>> getCachedProducts();
}

class LocalDatasourceImpl extends LocalDatasource {
  // ignore: constant_identifier_names
  static const String CACHED_PRODUCTS = 'CACHED_PRODUCTS';

  final SharedPreferences sharedPreferences;

  LocalDatasourceImpl(this.sharedPreferences);

  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    final productsJson = products.map((product) => product.toJson()).toList();
    await sharedPreferences.setString(CACHED_PRODUCTS, json.encode(productsJson));
  }

  @override
  Future<List<ProductModel>> getCachedProducts() async {
    final jsonString = sharedPreferences.getString(CACHED_PRODUCTS);
    if (jsonString != null) {
      final List<dynamic> productsJson = json.decode(jsonString);
      return productsJson.map((jsonItem) => ProductModel.fromJson(jsonItem)).toList();
    } else {
      throw Exception('No cached products found');
    }
  }
}
