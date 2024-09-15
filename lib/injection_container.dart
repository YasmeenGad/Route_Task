import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:task_route/core/network/network_info.dart';
import 'package:task_route/features/get_products/data/dataSource/local_datasource.dart';
import 'package:task_route/features/get_products/data/dataSource/remote_datasource.dart';
import 'package:task_route/features/get_products/data/repositories/fetch_products_repo_impl.dart';
import 'package:task_route/features/get_products/domain/repositories/fetch_products_repo.dart';
import 'package:task_route/features/get_products/domain/usecases/fetch_products_usecase.dart';
import 'package:task_route/features/get_products/presentaion/bloc/fetch_products_bloc/fetch_products_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  // External dependencies
  final sharedPreferences = await SharedPreferences.getInstance();
  final httpClient = http.Client();
  final internetConnectionChecker = InternetConnectionChecker();
  final networkInfo = NetworkInfoImpl(internetConnectionChecker);

  // register dependencies
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => httpClient);
  sl.registerLazySingleton(() => internetConnectionChecker);

  // register core
  sl.registerLazySingleton<NetworkInfo>(() => networkInfo);

  // Features
  // Data source
  sl.registerLazySingleton<RemoteDatasource>(
      () => RemoteDatasourceImpl(client: httpClient));
  sl.registerLazySingleton<LocalDatasource>(
      () => LocalDatasourceImpl( sharedPreferences));

  // Domain
  // Use cases
  // Repository
  sl.registerLazySingleton<FetchProductsRepository>(() =>
      FetchProductsRepositoryImpl(
          remoteDatasource: sl(), localDatasource: sl(), networkInfo: sl()));

  // register use cases
  sl.registerLazySingleton(
      () => FetchProductsUsecase(fetchProductsRepository: sl()));

  // bloc
  sl.registerFactory(() => FetchProductsBloc(sl()));
}
