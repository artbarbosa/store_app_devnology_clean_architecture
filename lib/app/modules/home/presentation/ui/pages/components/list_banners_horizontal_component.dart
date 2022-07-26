import 'package:flutter/material.dart';

import '../../../../../../_design_system/text_styles/text_styles_const.dart';
import '../../../../../../_design_system/widgets/cards/custom_card_banner_widget.dart';

class ListBannersHorizontalComponent extends StatelessWidget {
  const ListBannersHorizontalComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Latest',
          style: TextStylesConst.titleHome,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 180.44,
          width: currentSize.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: const [
              CustomCardBanner(
                image: 'assets/banners/banner01.png',
              ),
              SizedBox(width: 10),
              CustomCardBanner(
                image: 'assets/banners/banner01.png',
              ),
              SizedBox(width: 10),
              CustomCardBanner(
                image: 'assets/banners/banner01.png',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
