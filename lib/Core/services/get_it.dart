import 'package:fruits_store_dashboard/Core/Repos/image_product_repo/image_product_repo.dart';
import 'package:fruits_store_dashboard/Core/Repos/image_product_repo/image_product_repo_imp.dart';
import 'package:fruits_store_dashboard/Core/Repos/image_punner_repo/image_punner_repo.dart';
import 'package:fruits_store_dashboard/Core/Repos/image_punner_repo/image_punner_repo_imp.dart';
import 'package:fruits_store_dashboard/Core/services/DataBaseService.dart';
import 'package:fruits_store_dashboard/Core/services/fire_storage.dart';
import 'package:fruits_store_dashboard/Core/services/fires_store_service.dart';
import 'package:fruits_store_dashboard/Core/services/storeage_services.dart';
import 'package:fruits_store_dashboard/Features/add_product/domain/Repos/product_repo.dart';
import 'package:fruits_store_dashboard/Features/add_product/domain/Repos/product_repo_imp.dart';
import 'package:fruits_store_dashboard/Features/punner/domain/Repos/punner_repo.dart';
import 'package:fruits_store_dashboard/Features/punner/domain/Repos/punner_repo_imp.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<StoreageService>(
    FireStorge(),
  );
  getIt.registerSingleton<DataBaseService>(
    FireBaseService(),
  );
  getIt.registerSingleton<ImageRepo>(
    ImageRepoImp(
      getIt.get<StoreageService>(),
    ),
  );

  getIt.registerSingleton<ProductRepo>(
    ProductRepoImp(
      getIt.get<DataBaseService>(),
    ),
  );

  getIt.registerSingleton<ImagePunnerRepo>(
    ImagePunnerRepoImp(
      getIt.get<StoreageService>(),
    ),
  );

  getIt.registerSingleton<PunnerRepo>(
    punnerRepoImp(
      getIt.get<DataBaseService>(),
    ),
  );
}
