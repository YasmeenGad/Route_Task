
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_route/features/get_products/domain/entities/products.dart';
import 'package:task_route/features/get_products/domain/usecases/fetch_products_usecase.dart';
part 'fetch_products_event.dart';
part 'fetch_products_state.dart';
class FetchProductsBloc extends Bloc<FetchProductsEvent, FetchProductsState> {
  final FetchProductsUsecase fetchProductsUsecase;

  FetchProductsBloc(this.fetchProductsUsecase) : super(FetchProductsInitial()) {
    on<GetProductsEvent>(_fetchProducts);
  }

  Future<void> _fetchProducts(GetProductsEvent event, emit) async {
    emit(FetchProductsLoading());

    final products = await fetchProductsUsecase();

    products.fold(
      (failure) => emit(FetchProductsError(failure)),
      (products) => emit(FetchProductsLoaded(products)),
    );
  }
}
