import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_store_dashboard/Core/Repos/image_product_repo/image_product_repo.dart';
import 'package:fruits_store_dashboard/Core/services/get_it.dart';
import 'package:fruits_store_dashboard/Features/add_product/domain/Repos/product_repo.dart';
import 'package:fruits_store_dashboard/Features/add_product/presentation/manager/addproductCubit/addproduct_cubit.dart';
import 'package:fruits_store_dashboard/Features/add_product/presentation/views/widgets/AddProductViewBlocCosumer.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const routeName = 'AddProductView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Product"),
      ),
      body: BlocProvider(
        create: (context) => AddproductCubit(
          getIt.get<ImageRepo>(),
          getIt.get<ProductRepo>(),
        ),
        child: AddProductViewBlocCosumer(),
      ),
    );
  }
}
