import 'package:flutter/material.dart';
import 'package:fruits_store_dashboard/Features/dash_board_screen/presentation/views/dash_board_view.dart';
import 'package:fruits_store_dashboard/Features/punner/presentation/views/add_punner_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashBoardView.routeName:
      return MaterialPageRoute(builder: (context) => const DashBoardView());
    case AddPunnerView.routeName:
      return MaterialPageRoute(builder: (context) => const AddPunnerView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
