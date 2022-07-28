import 'package:flutter/material.dart';

import '../../../../../../_design_system/text_styles/text_styles_const.dart';
import '../../../../../../_design_system/widgets/cards/custom_card_category_widget.dart';

class ListCategoriesHorizontalComponent extends StatelessWidget {
  const ListCategoriesHorizontalComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: TextStylesConst.titleHome,
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Row(
            children: [
              CustomCardCategoryWidget(
                icon: 'assets/categories/apparel_icon.png',
                onTap: () {},
                text: 'Apparel',
              ),
              const Spacer(),
              CustomCardCategoryWidget(
                icon: 'assets/categories/beauty_icon.png',
                onTap: () {},
                text: 'Beauty',
              ),
              const Spacer(),
              CustomCardCategoryWidget(
                icon: 'assets/categories/shoes_icon.png',
                onTap: () {},
                text: 'Shoes',
              ),
              const Spacer(),
              CustomCardCategoryWidget(
                icon: 'assets/categories/see_all_icon.png',
                onTap: () {},
                text: 'See All',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
