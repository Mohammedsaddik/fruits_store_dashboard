import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:fruits_store_dashboard/Core/Repos/image_repo/image_repo.dart';
import 'package:fruits_store_dashboard/Core/errors/failers.dart';

class ImageRepoImp implements ImageRepo {
  @override
  Future<Either<Failure, String>> UpLoadeImage(File image) {
    // TODO: implement UpLoadeImage
    throw UnimplementedError();
  }
}
