import 'package:dartz/dartz.dart';
import 'package:task_route/features/get_products/data/models/product_model.dart';

abstract class FetchProductsRepository {
  Future<Either<String, List<ProductModel>>> fetchProducts();
}