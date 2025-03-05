import 'package:dartz/dartz.dart';
import 'package:fruits_store_dashboard/Core/errors/failers.dart';
import 'package:fruits_store_dashboard/Features/add_product/domain/Entites/Product_Entity.dart';
import 'package:fruits_store_dashboard/Features/add_product/domain/Repos/product_repo.dart';

class ProductRepoImp implements ProductRepo {
  @override
  Future<Either<Failure, void>> addProduct(
      ProductEntity AddProductInputEntites) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }
}
