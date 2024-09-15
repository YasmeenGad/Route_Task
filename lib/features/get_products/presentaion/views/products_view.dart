import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_route/features/get_products/presentaion/bloc/fetch_products_bloc/fetch_products_bloc.dart';
import 'package:task_route/features/get_products/presentaion/widgets/custom_app_bar.dart';
import 'package:task_route/features/get_products/presentaion/widgets/custom_product.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  void initState() {
    context.read<FetchProductsBloc>().add(GetProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding:
              const EdgeInsets.only(top: 38, left: 16, right: 16, bottom: 8),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    CustomAppBar(),
                    SizedBox(
                      height: 16,
                    ),
                    BlocBuilder<FetchProductsBloc, FetchProductsState>(
                        builder: (context, state) {
                      if (state is FetchProductsLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is FetchProductsLoaded) {
                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: state.products.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                  childAspectRatio: 0.5),
                          itemBuilder: (context, index) {
                            return CustomProduct(
                                products: state.products[index]);
                          },
                        );
                      } else if (state is FetchProductsError) {
                        return Center(
                          child: Text("${state.message}"),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    })
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
