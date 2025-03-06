import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:fruits_store_dashboard/Core/errors/failers.dart';

abstract class ImagePunnerRepo {
  Future<Either<Failure, String>> UploadImageRepo(File image);
}
