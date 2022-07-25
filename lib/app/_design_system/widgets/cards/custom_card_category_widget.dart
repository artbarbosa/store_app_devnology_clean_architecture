import 'package:flutter/material.dart';

import '../../text_styles/text_styles_const.dart';

class CustomCardCategoryWidget extends StatelessWidget {
  final String icon;
  final String text;
  final void Function() onTap;
  const CustomCardCategoryWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Image.asset(
              'assets/icons_category/$icon.png',
              height: 65,
              width: 65,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                text,
                style: TextStylesConst.textCategory,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
