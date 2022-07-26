import 'package:flutter/material.dart';

import '../../../../../_design_system/colors/app_colors_const.dart';
import '../../../../../core/product/infra/model/product_model.dart';
import 'components/list_banners_horizontal_component.dart';
import 'components/list_categories_horizontal_component.dart';
import 'components/list_product_horizontal_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.listProducts,
  }) : super(key: key);

  final List<ProductModel> listProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, bottom: 23, top: 30),
          child: Column(
            children: [
              const ListCategoriesHorizontalComponent(),
              const SizedBox(height: 22),
              const ListBannersHorizontalComponent(),
              const SizedBox(height: 24),
              ListProductHorizontalComponent(
                listProducts: listProducts,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
