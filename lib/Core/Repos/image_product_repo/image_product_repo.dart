import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:fruits_store_dashboard/Core/errors/failers.dart';

abstract class ImageRepo {
  Future<Either<Failure, String>> UpLoadeImage(File image);
}
