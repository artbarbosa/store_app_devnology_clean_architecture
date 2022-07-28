import 'package:flutter/material.dart';

import '../../../../../core/product/domain/usecases/get_all_products_usecase.dart';
import '../../../../../core/product/infra/model/product_model.dart';
import '../states/product_states.dart';

class HomeController extends ValueNotifier<ProductState> {
  final IGetAllProductsUseCase _getAllProductsUseCase;

  HomeController(
    this._getAllProductsUseCase,
  ) : super(ProductLoadingState());

  List<ProductModel> _listProducts = [];

  Future<void> _getAllProducts() async {
    _listProducts = await _getAllProductsUseCase.call() as List<ProductModel>;
    notifyListeners();
  }

  Future<void> fetchProducts() async {
    value = ProductLoadingState();
    try {
      await _getAllProducts();
      value = ProductLoadedState(listProducts: _listProducts);
    } catch (e) {
      value = ProductErrorState(errorMessage: e.toString());
    }
  }
}
