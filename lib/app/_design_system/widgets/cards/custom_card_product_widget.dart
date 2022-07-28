import 'package:flutter/material.dart';
import 'package:store_app_devnology/app/modules/home/submodules/details/presentation/routers/detail_arguments.dart';

import '../../../core/product/infra/model/product_model.dart';
import '../../../core/shared/utils/format_double_decimals_with_cents.dart';
import '../../text_styles/text_styles_const.dart';

class CustomCardProductWidget extends StatelessWidget {
  final ProductModel product;

  const CustomCardProductWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed('/detail', arguments: DetailArguments(product: product));
      },
      child: AspectRatio(
        aspectRatio: 101 / 135,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(product.image.first),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    product.shortTitle,
                    style: TextStylesConst.nameProductCard,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, bottom: 10, right: 8.0),
                  child: Text(
                    '\$ ${FormatDoubleDecimalWithCents.call(product.price, ',', '.')}',
                    style: TextStylesConst.priceProductCard,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
