import 'package:flutter/material.dart';
import 'package:store_app_devnology/app/_design_system/colors/app_colors_const.dart';

import '../../../../../../../_design_system/text_styles/text_styles_const.dart';
import '../../routers/detail_arguments.dart';
import '../controlollers/detail_controller.dart';

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
  final DetailController controller = DetailController();

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
              '\$ ${widget.arguments.product.price.toStringAsFixed(2)}',
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
    );
  }
}
