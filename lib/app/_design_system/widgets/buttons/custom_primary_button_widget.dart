import 'package:flutter/material.dart';

import '../../colors/app_colors_const.dart';
import '../../text_styles/text_styles_const.dart';

class CustomPrimaryButtonWidget extends StatelessWidget {
  final String titleButton;
  final dynamic onPressed;
  const CustomPrimaryButtonWidget({
    Key? key,
    required this.titleButton,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 140,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorsConst.primary,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(titleButton,
                    style: TextStylesConst.buttonPrimaryProductDetail),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: ColorsConst.onPrimary,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
