import 'package:flutter/material.dart';
import 'package:store_app_devnology/app/_design_system/text_styles/text_styles_const.dart';

class CardItemCartWidget extends StatefulWidget {
  final String itemTitle;
  final String itemPrice;
  final String itemImage;
  final int itemTypeInTheCart;
  const CardItemCartWidget({
    Key? key,
    required this.itemTitle,
    required this.itemPrice,
    required this.itemImage,
    required this.itemTypeInTheCart,
  }) : super(key: key);

  @override
  State<CardItemCartWidget> createState() => _CardItemCartWidgetState();
}

class _CardItemCartWidgetState extends State<CardItemCartWidget> {
  @override
  Widget build(BuildContext context) {
    var currentSize = MediaQuery.of(context).size;
    if (widget.itemTypeInTheCart <= 0) {
      return Container();
    } else {
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
                    widget.itemPrice,
                    style: TextStylesConst.priceProductCart,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle),
                      onPressed: () {},
                    ),
                    Text('${widget.itemTypeInTheCart}'),
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
}
