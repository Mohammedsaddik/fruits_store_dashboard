import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_store_dashboard/Core/Repos/image_punner_repo/image_punner_repo.dart';
import 'package:fruits_store_dashboard/Core/errors/failers.dart';
import 'package:fruits_store_dashboard/Core/services/storeage_services.dart';
import 'package:fruits_store_dashboard/Core/utils/data_base_end_poict.dart';

class ImagePunnerRepoImp implements ImagePunnerRepo {
  final StoreageService storeageService;

  ImagePunnerRepoImp(this.storeageService);

  @override
  Future<Either<Failure, String>> UploadImageRepo(
    File image,
  ) async {
    try {
      String url = await storeageService.uploadeFile(
        image,
        DataBaseEndPoint.imagesPunner,
      );
      return Right(url);
    } catch (e) {
      return Left(
        ServerFailure(
          message: "Failed To Uploade Image",
        ),
      );
    }
  }
}
