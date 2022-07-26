import 'package:flutter/material.dart';
import 'package:store_app_devnology/app/modules/home/submodules/details/presentation/routers/detail_arguments.dart';

import '../../../core/product/infra/model/product_model.dart';
import '../../text_styles/text_styles_const.dart';

class CustomCardProductWidget extends StatelessWidget {
  final ProductModel product;

  const CustomCardProductWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed('/detail', arguments: DetailArguments(product: product));
      },
      child: Container(
        width: 101,
        height: 135,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset(product.image.first).image,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                product.shortTitle,
                style: TextStylesConst.nameProductCard,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 10, right: 8.0),
              child: Text(
                product.price.toStringAsFixed(2),
                style: TextStylesConst.priceProductCard,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
