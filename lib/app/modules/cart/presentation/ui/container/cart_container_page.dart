import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:store_app_devnology/app/_design_system/text_styles/text_styles_const.dart';
import 'package:store_app_devnology/app/core/shared/utils/format_double_decimals_with_cents.dart';
import 'package:store_app_devnology/app/modules/cart/presentation/ui/controllers/cart_controller.dart';

import '../../../../../_design_system/colors/app_colors_const.dart';
import '../../../../../_design_system/widgets/appbar/custom_app_bar_widget.dart';
import '../../../../../_design_system/widgets/bottom_navigation_bart/custom_bottom_navigation_bar_widget.dart';
import '../../../../../_design_system/widgets/buttons/custom_primary_button_widget.dart';
import '../../../../../_design_system/widgets/cards/custom_card_product_cart_widget.dart';
import '../../../../../core/shared/ui/controllers/custom_bottom_navigation_bar_controller.dart';

class CartContainerPage extends StatelessWidget {
  CartContainerPage({Key? key}) : super(key: key);

  final controller = GetIt.I.get<CartController>();

  final controllerBottomNavigation =
      GetIt.I.get<CustomBottomNavigationBarController>();

  @override
  Widget build(BuildContext context) {
    final currentSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBarWidget(
          isLeading: true,
          isActiveActionsBar: true,
          numberItemsInCart: 2,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cart',
                  style: TextStylesConst.titleHome,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              height: currentSize.height - 270,
              child: AnimatedBuilder(
                animation: controller,
                builder: (_, __) {
                  return ListView.builder(
                    itemCount: controller.listProduct.length,
                    itemBuilder: (context, index) {
                      return CustomCardProductCartWidget(
                        itemImage: controller.listProduct[index].image.first,
                        itemPrice: controller.listProduct[index].price,
                        itemTitle: controller.listProduct[index].title,
                        index: index,
                      );
                    },
                  );
                },
              ),
            ),
          ),
          const Spacer(),
          BottomAppBar(
            child: Container(
              height: 86,
              color: ColorsConst.secondary,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Total:',
                          style: TextStylesConst.totalTitleCart,
                        ),
                        AnimatedBuilder(
                            animation: controller,
                            builder: (context, _) {
                              return Text(
                                '\$ ${FormatDoubleDecimalWithCents.call(controller.totalValue, '.', ',')}',
                                style: TextStylesConst.totalPriceCart,
                              );
                            })
                      ],
                    ),
                    CustomPrimaryButtonWidget(
                      onPressed: () {},
                      titleButton: 'CHECKOUT',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: controllerBottomNavigation,
        builder: (context, value, _) {
          return CustomBottomNavigationBar(
            currentIndex: value,
            onTap: (value) => controllerBottomNavigation.changePage(value),
          );
        },
      ),
    );
  }
}
