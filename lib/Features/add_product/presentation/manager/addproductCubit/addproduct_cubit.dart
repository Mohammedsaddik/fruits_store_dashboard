import 'package:bloc/bloc.dart';
import 'package:fruits_store_dashboard/Core/Repos/image_product_repo/image_product_repo.dart';
import 'package:fruits_store_dashboard/Features/add_product/domain/Entites/Product_Entity.dart';
import 'package:fruits_store_dashboard/Features/add_product/domain/Repos/product_repo.dart';
import 'package:meta/meta.dart';

part 'addproduct_state.dart';

class AddproductCubit extends Cubit<AddproductState> {
  AddproductCubit(this.imageRepo, this.productRepo)
      : super(AddproductInitial());
  final ImageRepo imageRepo;
  final ProductRepo productRepo;
  Future<void> addProduct(ProductEntity productEntity) async {
    emit(AddproductLoading());
    var result = await imageRepo.UpLoadeImage(productEntity.image);
    result.fold(
        (l) => emit(
              AddproductError(ErrorMessage: "Error Please Try Again"),
            ), (url) async {
      productEntity.imageUrl = url;
      var result = await productRepo.addProduct(productEntity);
      result.fold(
        (l) => emit(
          AddproductError(ErrorMessage: l.message),
        ),
        (r) => emit(
          AddproductSuccess(),
        ),
      );
    });
  }
}
