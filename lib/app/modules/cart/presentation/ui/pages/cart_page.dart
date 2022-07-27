import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../_design_system/colors/app_colors_const.dart';
import '../../../../../_design_system/text_styles/text_styles_const.dart';
import '../../../../../_design_system/widgets/buttons/custom_primary_button_widget.dart';
import '../../../../../_design_system/widgets/cards/custom_card_product_cart_widget.dart';
import '../../../../../core/shared/utils/format_double_decimals_with_cents.dart';
import '../controllers/cart_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<CartController>();

    final currentSize = MediaQuery.of(context).size;
    return Column(
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
                  itemCount: controller.cart.listProduct.length,
                  itemBuilder: (context, index) {
                    return CustomCardProductCartWidget(
                      itemImage: controller
                          .cart.listProduct[index].product.image.first,
                      itemPrice:
                          controller.cart.listProduct[index].product.price,
                      itemTitle:
                          controller.cart.listProduct[index].product.title,
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
                    onPressed: () {
                      Navigator.of(context).pushNamed('/order');
                      controller.checkoutCart();
                    },
                    titleButton: 'CHECKOUT',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
