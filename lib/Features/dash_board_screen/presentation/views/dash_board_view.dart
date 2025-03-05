import 'package:flutter/material.dart';
import 'package:fruits_store_dashboard/Features/dash_board_screen/presentation/views/widgets/dash_board_view_body.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});
  static const routeName = "DashBoardView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashBoardViewBody(),
    );
  }
}
