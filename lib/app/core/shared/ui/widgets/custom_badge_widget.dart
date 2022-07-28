import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../_design_system/colors/app_colors_const.dart';
import '../../../../_design_system/text_styles/text_styles_const.dart';
import '../controllers/custom_badge_controller.dart';

class CustomBadgeWidget extends StatelessWidget {
  const CustomBadgeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<CustomBadgeController>();
    return ValueListenableBuilder(
        valueListenable: controller.numberItemsInCart,
        builder: (context, _, __) {
          return Column(
            children: [
              if (controller.numberItemsInCart.value > 0)
                Container(
                  width: 13,
                  height: 13,
                  decoration: BoxDecoration(
                    color: ColorsConst.yellow,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      '${controller.numberItemsInCart.value}',
                      style: TextStylesConst.badgeText,
                    ),
                  ),
                )
              else
                Container(),
            ],
          );
        });
  }
}
