import 'package:get_it/get_it.dart';

import '../../../modules/cart/domain/usecases/add_item_in_cart_usecase.dart';
import '../../../modules/cart/domain/usecases/caculated_total_cart_usecase.dart';
import '../../../modules/cart/domain/usecases/clean_cart_usecase.dart';
import '../../../modules/cart/domain/usecases/decrement_count_item_in_cart.dart';
import '../../../modules/cart/domain/usecases/incremet_count_item_in_cart_usecase.dart';
import '../../../modules/cart/domain/usecases/remove_item_in_cart_usecase.dart';
import '../../../modules/cart/presentation/ui/controllers/cart_controller.dart';
import '../../../modules/home/presentation/ui/controllers/home_controller.dart';
import '../../../modules/home/submodules/details/presentation/ui/controllers/detail_controller.dart';
import '../../../modules/splash/presentation/ui/controllers/splash_controller.dart';
import '../../product/domain/repositories/product_repository_interface.dart';
import '../../product/domain/usecases/get_all_products_usecase.dart';
import '../../product/external/datasources/product_datasource.dart';
import '../../product/infra/datasources/product_datasource_interface.dart';
import '../../product/infra/repositories/product_repository.dart';
import '../services/remote/http_client_mock.dart';
import '../services/remote/http_client_service_interface.dart';
import '../ui/controllers/custom_badge_controller.dart';
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

    getIt.registerFactory<ICalculatedTotalCartUseCase>(
      () => CalculatedTotalCartUseCase(),
    );

    getIt.registerFactory<IDecrementItemInCartUseCase>(
      () => DecrementItemInCartUseCase(),
    );
    getIt.registerFactory<IIcrementItemInCartUseCase>(
      () => IcrementItemInCartUseCase(),
    );

    getIt.registerFactory<IRemoveItemInCartUseCase>(
      () => RemoveItemInCartUseCase(),
    );

    getIt.registerFactory<IAddItemInCartUseCase>(
      () => AddItemInCartUseCase(),
    );

    getIt.registerFactory<ICleanCartUseCase>(
      () => CleanCartUseCase(),
    );

    getIt.registerLazySingleton<CustomBadgeController>(
      () => CustomBadgeController(),
    );

    getIt.registerFactory<HomeController>(
      () => HomeController(getIt()),
    );
    getIt.registerFactory<SplashController>(
      () => SplashController(),
    );

    getIt.registerSingleton<CartController>(
      CartController(
        badgeController: getIt(),
        cleanCartUseCase: getIt(),
        calculatedTotalCartUseCase: getIt(),
        decrementItemInCartUseCase: getIt(),
        icrementItemInCartUseCase: getIt(),
        removeItemInCartUseCase: getIt(),
      ),
    );

    getIt.registerFactory<DetailController>(
      () => DetailController(
        badgeController: getIt(),
        addItemInCartUseCase: getIt(),
        cartController: getIt(),
      ),
    );

    getIt.registerLazySingleton<CustomBottomNavigationBarController>(
      () => CustomBottomNavigationBarController(0),
    );
  }
}
