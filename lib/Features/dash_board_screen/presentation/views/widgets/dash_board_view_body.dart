import 'package:flutter/material.dart';
import 'package:fruits_store_dashboard/Core/widgets/custom_button.dart';
import 'package:fruits_store_dashboard/Features/add_product/presentation/views/add_product_view.dart';
import 'package:fruits_store_dashboard/Features/punner/presentation/views/add_punner_view.dart';

class DashBoardViewBody extends StatelessWidget {
  const DashBoardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            onPressed: () {
              Navigator.pushNamed(context, AddPunnerView.routeName);
            },
            text: "Add Punner",
          ),
          SizedBox(
            height: 40.0,
          ),
          CustomButton(
            onPressed: () {
              Navigator.pushNamed(context, AddProductView.routeName);
            },
            text: "Add Product",
          ),
        ],
      ),
    );
  }
}
