import 'package:flutter/material.dart';
import 'package:fruits_store_dashboard/Features/dash_board_screen/presentation/views/dash_board_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashBoardView.routeName:
      return MaterialPageRoute(builder: (context) => const DashBoardView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
