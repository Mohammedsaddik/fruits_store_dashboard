import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_store_dashboard/Core/widgets/custam_snak_bar.dart';
import 'package:fruits_store_dashboard/Core/widgets/customProgressHud.dart';
import 'package:fruits_store_dashboard/Features/add_product/presentation/manager/addproductCubit/addproduct_cubit.dart';
import 'package:fruits_store_dashboard/Features/add_product/presentation/views/widgets/add_product_view_body.dart';

class AddProductViewBlocCosumer extends StatelessWidget {
  const AddProductViewBlocCosumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddproductCubit, AddproductState>(
      listener: (context, state) {
        if (state is AddproductSuccess) {
          showErrorBar(context, "Product Added Successfuly");
        }
        if (state is AddproductError) {
          showErrorBar(context, "Product Not Added Please Try Again");
        }
      },
      builder: (context, state) {
        return customProgressHud(
          isLoading: state is customProgressHud ? true : false,
          child: AddProductViewBody(),
        );
      },
    );
  }
}
