import 'package:dartz/dartz.dart';
import 'package:task_route/features/get_products/domain/entities/products.dart';

abstract class FetchProductsRepository {
  Future<Either<String, List<ProductEntity>>> fetchProducts();
}