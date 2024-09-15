import 'package:dartz/dartz.dart';
import 'package:task_route/core/network/network_info.dart';
import 'package:task_route/features/get_products/data/dataSource/local_datasource.dart';
import 'package:task_route/features/get_products/data/dataSource/remote_datasource.dart';
import 'package:task_route/features/get_products/data/models/product_model.dart';
import 'package:task_route/features/get_products/domain/repositories/fetch_products_repo.dart';

class FetchProductsRepositoryImpl extends FetchProductsRepository {
  final RemoteDatasource remoteDatasource;
  final LocalDatasource localDatasource;
  final NetworkInfo networkInfo;

  FetchProductsRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<String, List<ProductModel>>> fetchProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = await remoteDatasource.fetchProducts();
        await localDatasource.cacheProducts(remoteProducts);
        return right(remoteProducts);
      } catch (e) {
        return left(e.toString());
      }
    } else {
      try {
        final cachedProducts = await localDatasource.getCachedProducts();
        return right(cachedProducts);
      } catch (e) {
        return left('No internet connection and no cached data available.');
      }
    }
  }
}
