import 'package:flutter/material.dart';

import '../../text_styles/text_styles_const.dart';

class CardItemCartWidget extends StatefulWidget {
  final String itemTitle;
  final double itemPrice;
  final String itemImage;
  const CardItemCartWidget({
    Key? key,
    required this.itemTitle,
    required this.itemPrice,
    required this.itemImage,
  }) : super(key: key);

  @override
  State<CardItemCartWidget> createState() => _CardItemCartWidgetState();
}

class _CardItemCartWidgetState extends State<CardItemCartWidget> {
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
                  widget.itemPrice.toStringAsFixed(2),
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
