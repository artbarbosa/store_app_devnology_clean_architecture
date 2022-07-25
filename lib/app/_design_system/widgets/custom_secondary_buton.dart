import 'package:flutter/material.dart';
import 'package:store_app_devnology/app/_design_system/colors/app_colors_const.dart';
import 'package:store_app_devnology/app/_design_system/text_styles/text_styles_const.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String titleButton;
  final dynamic onPressed;
  const CustomPrimaryButton({
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
            color: ColorsConst.onPrimary,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(titleButton,
                    style: TextStylesConst.buttonWhiteProductDetail),
                const Icon(
                  Icons.expand_less_outlined,
                  color: ColorsConst.primary,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
