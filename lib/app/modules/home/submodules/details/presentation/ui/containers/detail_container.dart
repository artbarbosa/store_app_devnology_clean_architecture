import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:store_app_devnology/app/_design_system/colors/app_colors_const.dart';
import 'package:store_app_devnology/app/_design_system/widgets/buttons/custom_primary_button_widget.dart';

import '../../../../../../../_design_system/text_styles/text_styles_const.dart';
import '../../../../../../../_design_system/widgets/appbar/custom_app_bar_widget.dart';
import '../../../../../../../_design_system/widgets/buttons/custom_secondary_buton_widget.dart';
import '../../../../../../../core/shared/ui/controllers/custom_bottom_navigation_bar_controller.dart';
import '../../../../../../../core/shared/utils/format_double_decimals_with_cents.dart';
import '../../routers/detail_arguments.dart';
import '../controllers/detail_controller.dart';

class DetailContainer extends StatefulWidget {
  const DetailContainer({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  final DetailArguments arguments;

  @override
  State<DetailContainer> createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  final DetailController controller = GetIt.I.get<DetailController>();
  final controllerBottomNavigation =
      GetIt.I.get<CustomBottomNavigationBarController>();

  @override
  Widget build(BuildContext context) {
    List<Widget> indicators(imagesLength, currentIndex) {
      return List<Widget>.generate(imagesLength, (index) {
        return Container(
          margin: const EdgeInsets.all(3),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              color: currentIndex == index
                  ? ColorsConst.primary
                  : const Color(0xFFC4C4C4),
              shape: BoxShape.circle),
        );
      });
    }

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBarWidget(
          isActiveCart: true,
          automaticallyImplyLeading: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 25, left: 25, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.arguments.product.title,
              style: TextStylesConst.nameProductDetail,
            ),
            Column(
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: PageView.builder(
                      itemCount: widget.arguments.product.image.length,
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
                          child: Image.asset(
                              widget.arguments.product.image[pagePosition]),
                        );
                      }),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: indicators(widget.arguments.product.image.length,
                        controller.activeImage))
              ],
            ),
            Text(
              'Price:',
              style: TextStylesConst.nameProductDetail,
            ),
            Text(
              '\$ ${FormatDoubleDecimalWithCents.call(widget.arguments.product.price, '.', ',')}',
              style: TextStylesConst.priceProductDetail,
            ),
            const SizedBox(height: 16),
            Text(
              'About this item:',
              style: TextStylesConst.nameProductDetail,
            ),
            const SizedBox(height: 10),
            Text(
              widget.arguments.product.description,
              style: TextStylesConst.descriptionProductDetail,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 86,
          color: ColorsConst.secondary,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomSecondaryButtonWidget(
                  onPressed: () {},
                  titleButton: 'SHARE THIS',
                ),
                CustomPrimaryButtonWidget(
                  onPressed: () {
                    controller.addProductToCart(widget.arguments.product);
                    controllerBottomNavigation.changePage(2);
                    Navigator.of(context).pop();
                  },
                  titleButton: 'ADD TO CART',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
