import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app_devnology/app/_design_system/colors/app_colors_const.dart';

import '../../../core/shared/ui/widgets/custom_badge_widget.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({
    Key? key,
    this.isLeading = false,
    this.isActiveCart = false,
    this.isActiveActionsBar = false,
    this.automaticallyImplyLeading = false,
    this.numberItemsInCart = 0,
  }) : super(key: key);

  final bool automaticallyImplyLeading;
  final bool isLeading;
  final bool isActiveCart;
  final bool isActiveActionsBar;
  final int numberItemsInCart;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      elevation: 0,
      title: isLeading == false
          ? SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo/logo_devnology.png',
                    width: 160,
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 1.0),
              child: Image.asset('assets/logo/logo_devnology.png', width: 160),
            ),
      backgroundColor: ColorsConst.primary,
      actions: [
        if (isActiveCart == true)
          Stack(
            alignment: Alignment.centerRight,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/cart_icon_bottom.svg',
                ),
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: const CustomBadgeWidget(),
              )
            ],
          )
        else
          const SizedBox(width: 48),
        if (isActiveActionsBar == true)
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/chat_icon_top.svg',
              semanticsLabel: 'cart',
              color: Colors.white,
            ),
            onPressed: () {},
          )
        else
          Container(),
        if (isActiveActionsBar == true)
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/bell_icon_top.svg',
              color: Colors.white,
            ),
            onPressed: () {},
          )
        else
          Container(),
      ],
    );
  }
}
