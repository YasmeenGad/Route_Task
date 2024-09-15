import 'package:dartz/dartz.dart';
import 'package:task_route/features/get_products/domain/entities/products.dart';
import 'package:task_route/features/get_products/domain/repositories/fetch_products_repo.dart';

class FetchProductsUsecase{

  final FetchProductsRepository fetchProductsRepository;

  FetchProductsUsecase({required this.fetchProductsRepository});

  Future<Either<String, List<ProductEntity>>> call()async{
    return await fetchProductsRepository.fetchProducts();
  }
}