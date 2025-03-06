import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:fruits_store_dashboard/Core/Repos/image_product_repo/image_product_repo.dart';
import 'package:fruits_store_dashboard/Core/errors/failers.dart';
import 'package:fruits_store_dashboard/Core/services/storeage_services.dart';
import 'package:fruits_store_dashboard/Core/utils/data_base_end_poict.dart';

class ImageRepoImp implements ImageRepo {
  final StoreageService storeageService;

  ImageRepoImp(this.storeageService);
  @override
  Future<Either<Failure, String>> UpLoadeImage(
    File image,
  ) async {
    try {
      String url = await storeageService.uploadeFile(
        image,
        DataBaseEndPoint.imagesProduct,
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
