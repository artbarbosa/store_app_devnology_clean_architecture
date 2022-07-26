import 'package:get_it/get_it.dart';

import '../../../modules/cart/presentation/ui/controllers/cart_controller.dart';
import '../../../modules/home/presentation/ui/controllers/home_controllers.dart';
import '../../../modules/home/submodules/details/presentation/ui/controllers/detail_controller.dart';
import '../../product/domain/repositories/product_repository_interface.dart';
import '../../product/domain/usecases/get_all_products_usecase.dart';
import '../../product/external/datasources/product_datasource.dart';
import '../../product/infra/datasources/product_datasource_interface.dart';
import '../../product/infra/repositories/product_repository.dart';
import '../services/remote/http_client_mock.dart';
import '../services/remote/http_client_service_interface.dart';
import '../ui/controllers/custom_bottom_navigation_bar_controller.dart';

class Inject {
  static initialize() {
    final getIt = GetIt.I;

    getIt.registerLazySingleton<IHttpService>(() => HttpClientMock());

    getIt.registerLazySingleton<IProductRepository>(
        () => ProductRepository(datasource: getIt()));

    getIt.registerLazySingleton<IProductDataSource>(
        () => ProductDataSource(httpClient: getIt()));

    getIt.registerFactory<IGetAllProductsUseCase>(
      () => GetAllProductsUseCase(getIt()),
    );

    getIt.registerFactory<HomeController>(
      () => HomeController(getIt()),
    );

    getIt.registerSingleton<CartController>(
      CartController(),
    );

    getIt.registerFactory<DetailController>(
      () => DetailController(
        cartController: getIt(),
      ),
    );

    getIt.registerLazySingleton<CustomBottomNavigationBarController>(
      () => CustomBottomNavigationBarController(0),
    );
  }
}

// final asd = HomeController(
//   GetAllProductsUseCase(
//     ProductRepository(
//       datasource: ProductDataSource(
//         httpClient: HttpClientMock(),
//       ),
//     ),
//   ),
// );
