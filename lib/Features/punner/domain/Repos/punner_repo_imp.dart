import 'package:dartz/dartz.dart';
import 'package:fruits_store_dashboard/Core/errors/failers.dart';
import 'package:fruits_store_dashboard/Core/services/DataBaseService.dart';
import 'package:fruits_store_dashboard/Core/utils/data_base_end_poict.dart';
import 'package:fruits_store_dashboard/Features/punner/data/models/punner_model.dart';
import 'package:fruits_store_dashboard/Features/punner/domain/Entites/punner_entity.dart';
import 'package:fruits_store_dashboard/Features/punner/domain/Repos/punner_repo.dart';

class punnerRepoImp implements PunnerRepo {
  final DataBaseService dataBaseService;

  punnerRepoImp(this.dataBaseService);
  @override
  Future<Either<Failure, void>> addPunner(PunnerEntity AddPunnerEntites) async {
    try {
      await dataBaseService.addData(
        path: DataBaseEndPoint.AddPunners,
        data: PunnerModel.fromEntity(AddPunnerEntites).toJson(),
      );
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: "faild to add punner!!"));
    }
  }
}
