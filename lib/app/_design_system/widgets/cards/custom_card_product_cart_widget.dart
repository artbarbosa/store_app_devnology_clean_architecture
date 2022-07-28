import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:store_app_devnology/app/core/shared/utils/format_double_decimals_with_cents.dart';

import '../../../modules/cart/presentation/ui/controllers/cart_controller.dart';
import '../../text_styles/text_styles_const.dart';

class CustomCardProductCartWidget extends StatefulWidget {
  final String itemTitle;
  final double itemPrice;
  final String itemImage;
  final int index;
  const CustomCardProductCartWidget({
    Key? key,
    required this.itemTitle,
    required this.itemPrice,
    required this.itemImage,
    required this.index,
  }) : super(key: key);

  @override
  State<CustomCardProductCartWidget> createState() =>
      _CustomCardProductCartWidgetState();
}

class _CustomCardProductCartWidgetState
    extends State<CustomCardProductCartWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<CartController>();

    var currentSize = MediaQuery.of(context).size;

    return Row(
      children: [
        SizedBox(
          width: currentSize.width * 0.3,
          child: Center(
            child: Image.asset(
              widget.itemImage,
            ),
          ),
        ),
        SizedBox(
          width: currentSize.width * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  widget.itemTitle,
                  style: TextStylesConst.nameProductCart,
                  maxLines: 4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  '\$ ${FormatDoubleDecimalWithCents.call(widget.itemPrice, ',', '.')}',
                  style: TextStylesConst.priceProductCart,
                ),
              ),
              AnimatedBuilder(
                  animation: controller,
                  builder: (context, _) {
                    return Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle),
                          onPressed: () {
                            controller.decrementCount(widget.index);
                          },
                        ),
                        Text(
                          controller.cart.listProduct[widget.index].countProduct
                              .toString(),
                          style: TextStylesConst.priceProductCart,
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle),
                          onPressed: () {
                            controller.incrementCount(widget.index);
                          },
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
