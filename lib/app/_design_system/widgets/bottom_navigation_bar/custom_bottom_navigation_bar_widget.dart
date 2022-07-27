import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/shared/ui/widgets/custom_badge_widget.dart';
import '../../colors/app_colors_const.dart';
import '../../text_styles/text_styles_const.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    Key? key,
    this.onTap,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;
  final Function(int)? onTap;
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedLabelStyle: TextStylesConst.bottomNavigationBarText,
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorsConst.primary,
      selectedItemColor: ColorsConst.yellow,
      unselectedItemColor: ColorsConst.onPrimary,
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: SvgPicture.asset(
            'assets/icons/home_icon_bottom.svg',
            color: widget.currentIndex == 0 ? ColorsConst.yellow : Colors.white,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Search',
          icon: SvgPicture.asset(
            'assets/icons/search_icon_bottom.svg',
            color: widget.currentIndex == 1 ? ColorsConst.yellow : Colors.white,
          ),
        ),
        BottomNavigationBarItem(
            label: 'Cart',
            icon: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/cart_icon_bottom.svg',
                  color: widget.currentIndex == 2
                      ? ColorsConst.yellow
                      : Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 9, left: 25),
                  child: CustomBadgeWidget(),
                )
              ],
            )),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: SvgPicture.asset(
            'assets/icons/profile_icon_bottom.svg',
            color: widget.currentIndex == 3 ? ColorsConst.yellow : Colors.white,
          ),
        ),
        BottomNavigationBarItem(
          label: 'More',
          icon: SvgPicture.asset(
            'assets/icons/more_icon_bottom.svg',
            color: widget.currentIndex == 4 ? ColorsConst.yellow : Colors.white,
          ),
        ),
      ],
    );
  }
}
