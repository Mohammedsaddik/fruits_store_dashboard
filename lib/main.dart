import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruits_store_dashboard/Core/healper_function/on_generate_routes.dart';
import 'package:fruits_store_dashboard/Core/services/get_it.dart';
import 'package:fruits_store_dashboard/Core/services/subaBase_storge_service.dart';
import 'package:fruits_store_dashboard/Features/dash_board_screen/presentation/views/dash_board_view.dart';
import 'package:fruits_store_dashboard/firebase_options.dart';

void main() async {
  await subaBaseStoreageService.initSupaBase();
  await subaBaseStoreageService.createBucket("fruit_images");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  runApp(const FruitsStoreDashboard());
}

class FruitsStoreDashboard extends StatelessWidget {
  const FruitsStoreDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: DashBoardView.routeName,
    );
  }
}
