import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_store_dashboard/Core/Repos/image_punner_repo/image_punner_repo.dart';
import 'package:fruits_store_dashboard/Core/services/get_it.dart';
import 'package:fruits_store_dashboard/Features/punner/domain/Repos/punner_repo.dart';
import 'package:fruits_store_dashboard/Features/punner/presentation/manager/addpunnerCubit/addpunner_cubit.dart';
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
      body: BlocProvider(
        create: (context) => AddpunnerCubit(
          getIt.get<ImagePunnerRepo>(),
          getIt.get<PunnerRepo>(),
        ),
        child: AddPunnerViewBody(),
      ),
    );
  }
}
