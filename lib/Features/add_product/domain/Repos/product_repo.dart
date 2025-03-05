import 'package:dartz/dartz.dart';
import 'package:fruits_store_dashboard/Core/errors/failers.dart';
import 'package:fruits_store_dashboard/Features/add_product/domain/Entites/Product_Entity.dart';

abstract class ProductRepo {
  Future<Either<Failure, void>> addProduct(
      ProductEntity AddProductInputEntites);
}
