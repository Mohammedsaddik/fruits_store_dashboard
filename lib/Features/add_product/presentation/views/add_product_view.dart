import 'package:flutter/material.dart';
import 'package:fruits_store_dashboard/Features/add_product/presentation/views/widgets/add_product_view_body.dart';

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
      body: AddProductViewBody(),
    );
  }
}
