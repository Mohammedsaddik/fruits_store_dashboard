import 'package:dartz/dartz.dart';
import 'package:fruits_store_dashboard/Core/errors/failers.dart';
import 'package:fruits_store_dashboard/Core/services/DataBaseService.dart';
import 'package:fruits_store_dashboard/Core/utils/data_base_end_poict.dart';
import 'package:fruits_store_dashboard/Features/add_product/data/models/product_model.dart';
import 'package:fruits_store_dashboard/Features/add_product/domain/Entites/Product_Entity.dart';
import 'package:fruits_store_dashboard/Features/add_product/domain/Repos/product_repo.dart';

class ProductRepoImp implements ProductRepo {
  final DataBaseService dataBaseService;

  ProductRepoImp(this.dataBaseService);
  @override
  Future<Either<Failure, void>> addProduct(
      ProductEntity AddProductInputEntites) async {
    try {
      await dataBaseService.addData(
        path: DataBaseEndPoint.AddProduct,
        data: ProductModel.fromEntity(AddProductInputEntites).toJson(),
      );
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(message: "error Please try again!!!"));
    }
  }
}
