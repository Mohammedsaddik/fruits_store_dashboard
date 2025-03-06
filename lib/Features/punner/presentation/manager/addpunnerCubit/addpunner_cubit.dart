import 'package:bloc/bloc.dart';
import 'package:fruits_store_dashboard/Core/Repos/image_punner_repo/image_punner_repo.dart';
import 'package:fruits_store_dashboard/Features/punner/domain/Entites/punner_entity.dart';
import 'package:fruits_store_dashboard/Features/punner/domain/Repos/punner_repo.dart';
import 'package:meta/meta.dart';

part 'addpunner_state.dart';

class AddpunnerCubit extends Cubit<AddpunnerState> {
  AddpunnerCubit(this.imagePunnerRepo, this.punnerRepo)
      : super(AddpunnerInitial());
  final ImagePunnerRepo imagePunnerRepo;
  final PunnerRepo punnerRepo;

  Future<void> addPunner(PunnerEntity punnerEntitey) async {
    emit(AddpunnerLoading());
    var result = await imagePunnerRepo.UploadImageRepo(punnerEntitey.image);
    result.fold(
        (l) => emit(
              AddpunnerError(ErrorMessage: l.message),
            ), (url) async {
      punnerEntitey.imageUrl = url;
      var result = await punnerRepo.addPunner(punnerEntitey);
      result.fold(
        (l) => emit(
          AddpunnerError(ErrorMessage: l.message),
        ),
        (r) => emit(
          AddpunnerSuccess(),
        ),
      );
    });
  }
}
