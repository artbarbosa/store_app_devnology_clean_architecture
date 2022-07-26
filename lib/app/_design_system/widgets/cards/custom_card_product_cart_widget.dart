import 'package:flutter/material.dart';
import 'package:store_app_devnology/app/core/shared/utils/format_double_decimals_with_cents.dart';

import '../../text_styles/text_styles_const.dart';

class CustomCardProductCartWidget extends StatefulWidget {
  final String itemTitle;
  final double itemPrice;
  final String itemImage;
  const CustomCardProductCartWidget({
    Key? key,
    required this.itemTitle,
    required this.itemPrice,
    required this.itemImage,
  }) : super(key: key);

  @override
  State<CustomCardProductCartWidget> createState() =>
      _CustomCardProductCartWidgetState();
}

class _CustomCardProductCartWidgetState
    extends State<CustomCardProductCartWidget> {
  @override
  Widget build(BuildContext context) {
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
                  '\$ ${FormatDoubleDecimalWithCents.call(widget.itemPrice, '.', ',')}',
                  style: TextStylesConst.priceProductCart,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
