import 'package:flutter/material.dart';
import 'package:fruits_store_dashboard/Features/punner/presentation/views/widgets/add_punner_view_body.dart';

class AddPunnerView extends StatelessWidget {
  const AddPunnerView({super.key});
  static const routeName = "AddPunnerView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Punner"),
      ),
      body: AddPunnerViewBody(),
    );
  }
}
