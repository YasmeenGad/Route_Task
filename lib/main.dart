import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_route/features/get_products/presentaion/bloc/fetch_products_bloc/fetch_products_bloc.dart';
import 'package:task_route/features/get_products/presentaion/views/products_view.dart';
import 'package:task_route/injection_container.dart';

void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const TaskRoute());
}

class TaskRoute extends StatelessWidget {
  const TaskRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => sl<FetchProductsBloc>(),)
    ], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductsView(),
    ));
  }
}