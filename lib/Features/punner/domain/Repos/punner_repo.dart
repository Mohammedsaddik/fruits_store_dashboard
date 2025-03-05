import 'package:dartz/dartz.dart';
import 'package:fruits_store_dashboard/Core/errors/failers.dart';
import 'package:fruits_store_dashboard/Features/punner/domain/Entites/punner_entity.dart';

abstract class PunnerRepo {
  Future<Either<Failure, void>> addProduct(
    PunnerEntity AddPunnerEntites,
  );
}
