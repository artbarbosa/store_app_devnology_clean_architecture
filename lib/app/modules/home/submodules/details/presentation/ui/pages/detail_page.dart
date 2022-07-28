import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../../_design_system/colors/app_colors_const.dart';
import '../../../../../../../_design_system/text_styles/text_styles_const.dart';
import '../../../../../../../core/product/infra/model/product_model.dart';
import '../../../../../../../core/shared/ui/controllers/custom_bottom_navigation_bar_controller.dart';
import '../../../../../../../core/shared/utils/format_double_decimals_with_cents.dart';
import '../controllers/detail_controller.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final DetailController controller = GetIt.I.get<DetailController>();

  final controllerBottomNavigation =
      GetIt.I.get<CustomBottomNavigationBarController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.product.title,
            style: TextStylesConst.nameProductDetail,
          ),
          Column(
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: PageView.builder(
                    itemCount: widget.product.image.length,
                    pageSnapping: true,
                    controller: controller.pageController,
                    onPageChanged: (page) {
                      setState(() {
                        controller.activeImage = page;
                      });
                    },
                    itemBuilder: (context, pagePosition) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        child: Image.asset(widget.product.image[pagePosition]),
                      );
                    }),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.product.image.length, (index) {
                    return Container(
                      margin: const EdgeInsets.all(3),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: controller.activeImage == index
                              ? ColorsConst.primary
                              : const Color(0xFFC4C4C4),
                          shape: BoxShape.circle),
                    );
                  }))
            ],
          ),
          Text(
            'Price:',
            style: TextStylesConst.nameProductDetail,
          ),
          Text(
            '\$ ${FormatDoubleDecimalWithCents.call(widget.product.price, ',', '.')}',
            style: TextStylesConst.priceProductDetail,
          ),
          const SizedBox(height: 16),
          Text(
            'About this item:',
            style: TextStylesConst.nameProductDetail,
          ),
          const SizedBox(height: 10),
          Text(
            widget.product.description,
            style: TextStylesConst.descriptionProductDetail,
          ),
        ],
      ),
    );
  }
}
