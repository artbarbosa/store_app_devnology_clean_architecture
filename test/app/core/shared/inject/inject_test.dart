import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:store_app_devnology/app/core/product/domain/repositories/product_repository_interface.dart';
import 'package:store_app_devnology/app/core/product/domain/usecases/get_all_products_usecase.dart';
import 'package:store_app_devnology/app/core/product/external/datasources/product_datasource.dart';
import 'package:store_app_devnology/app/core/product/infra/datasources/product_datasource_interface.dart';
import 'package:store_app_devnology/app/core/product/infra/repositories/product_repository.dart';
import 'package:store_app_devnology/app/core/shared/inject/inject.dart';
import 'package:store_app_devnology/app/core/shared/services/remote/http_client_mock.dart';
import 'package:store_app_devnology/app/core/shared/services/remote/http_client_service_interface.dart';
import 'package:store_app_devnology/app/core/shared/ui/controllers/custom_badge_controller.dart';
import 'package:store_app_devnology/app/core/shared/ui/controllers/custom_bottom_navigation_bar_controller.dart';
import 'package:store_app_devnology/app/modules/cart/domain/usecases/add_item_in_cart_usecase.dart';
import 'package:store_app_devnology/app/modules/cart/domain/usecases/caculated_total_cart_usecase.dart';
import 'package:store_app_devnology/app/modules/cart/domain/usecases/clean_cart_usecase.dart';
import 'package:store_app_devnology/app/modules/cart/domain/usecases/decrement_count_item_in_cart.dart';
import 'package:store_app_devnology/app/modules/cart/domain/usecases/incremet_count_item_in_cart_usecase.dart';
import 'package:store_app_devnology/app/modules/cart/domain/usecases/remove_item_in_cart_usecase.dart';
import 'package:store_app_devnology/app/modules/cart/presentation/ui/controllers/cart_controller.dart';
import 'package:store_app_devnology/app/modules/home/presentation/ui/controllers/home_controller.dart';
import 'package:store_app_devnology/app/modules/home/submodules/details/presentation/ui/controllers/detail_controller.dart';
import 'package:store_app_devnology/app/modules/splash/presentation/ui/controllers/splash_controller.dart';

void main() {
  setUpAll(() async {
    await Inject.initialize();
  });
  test('Should return Instance HttpClientMock', () async {
    final result = GetIt.I<IHttpService>();

    expect(result, isA<IHttpService>());
    expect(result, isA<HttpClientMock>());
  });
  test('Should return Instance IProductRepository', () async {
    final result = GetIt.I<IProductRepository>();

    expect(result, isA<IProductRepository>());
    expect(result, isA<ProductRepository>());
  });

  test('Should return Instance IProductDataSource', () async {
    final result = GetIt.I<IProductDataSource>();

    expect(result, isA<IProductDataSource>());
    expect(result, isA<ProductDataSource>());
  });

  test('Should return Instance IGetAllProductsUseCase', () async {
    final result = GetIt.I<IGetAllProductsUseCase>();

    expect(result, isA<IGetAllProductsUseCase>());
    expect(result, isA<GetAllProductsUseCase>());
  });

  test('Should return Instance ICalculatedTotalCartUseCase', () async {
    final result = GetIt.I<ICalculatedTotalCartUseCase>();

    expect(result, isA<ICalculatedTotalCartUseCase>());
    expect(result, isA<CalculatedTotalCartUseCase>());
  });

  test('Should return Instance IDecrementItemInCartUseCase', () async {
    final result = GetIt.I<IDecrementItemInCartUseCase>();

    expect(result, isA<IDecrementItemInCartUseCase>());
    expect(result, isA<DecrementItemInCartUseCase>());
  });

  test('Should return Instance IIcrementItemInCartUseCase', () async {
    final result = GetIt.I<IIcrementItemInCartUseCase>();

    expect(result, isA<IIcrementItemInCartUseCase>());
    expect(result, isA<IcrementItemInCartUseCase>());
  });

  test('Should return Instance IRemoveItemInCartUseCase', () async {
    final result = GetIt.I<IRemoveItemInCartUseCase>();

    expect(result, isA<IRemoveItemInCartUseCase>());
    expect(result, isA<RemoveItemInCartUseCase>());
  });

  test('Should return Instance IAddItemInCartUseCase', () async {
    final result = GetIt.I<IAddItemInCartUseCase>();

    expect(result, isA<IAddItemInCartUseCase>());
    expect(result, isA<AddItemInCartUseCase>());
  });

  test('Should return Instance CleanCartUseCase', () async {
    final result = GetIt.I<ICleanCartUseCase>();

    expect(result, isA<ICleanCartUseCase>());
    expect(result, isA<CleanCartUseCase>());
  });

  test('Should return Instance CustomBadgeController', () async {
    final result = GetIt.I<CustomBadgeController>();

    expect(result, isA<CustomBadgeController>());
  });

  test('Should return Instance HomeController', () async {
    final result = GetIt.I<HomeController>();

    expect(result, isA<HomeController>());
  });

  test('Should return Instance SplashController', () async {
    final result = GetIt.I<SplashController>();

    expect(result, isA<SplashController>());
  });

  test('Should return Instance CartController', () async {
    final result = GetIt.I<CartController>();

    expect(result, isA<CartController>());
  });

  test('Should return Instance DetailController', () async {
    final result = GetIt.I<DetailController>();

    expect(result, isA<DetailController>());
  });
  test('Should return Instance CustomBottomNavigationBarController', () async {
    final result = GetIt.I<CustomBottomNavigationBarController>();

    expect(result, isA<CustomBottomNavigationBarController>());
  });
}
