import 'package:flutter/material.dart';

import '../../../../../../_design_system/widgets/cards/custom_card_product_widget.dart';
import '../../../../../../core/product/infra/model/product_model.dart';

class ListProductHorizontalComponent extends StatelessWidget {
  const ListProductHorizontalComponent({
    Key? key,
    required this.listProducts,
  }) : super(key: key);
  final List<ProductModel> listProducts;

  @override
  Widget build(BuildContext context) {
    final currentSize = MediaQuery.of(context).size;
    return SizedBox(
      width: currentSize.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: currentSize.height * 0.25,
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 11),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: listProducts.length,
              itemBuilder: (context, index) {
                return CustomCardProductWidget(
                  product: listProducts[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
