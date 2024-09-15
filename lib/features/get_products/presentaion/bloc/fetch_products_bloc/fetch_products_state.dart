part of 'fetch_products_bloc.dart';
abstract class FetchProductsState extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchProductsInitial extends FetchProductsState {}

class FetchProductsLoading extends FetchProductsState {}

class FetchProductsLoaded extends FetchProductsState {
  final List<ProductModel> products;

  FetchProductsLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class FetchProductsError extends FetchProductsState {
  final String message;

  FetchProductsError(this.message);

  @override
  List<Object> get props => [message];
}
