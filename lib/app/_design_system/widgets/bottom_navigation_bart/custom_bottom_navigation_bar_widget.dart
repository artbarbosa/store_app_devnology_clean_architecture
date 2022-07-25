import 'package:flutter/material.dart';

import '../../colors/app_colors_const.dart';

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
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorsConst.primary,
      selectedItemColor: ColorsConst.yellow,
      unselectedItemColor: ColorsConst.onPrimary,
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Search',
          icon: Icon(Icons.add_circle),
        ),
        BottomNavigationBarItem(
          label: 'Cart',
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          label: 'More',
          icon: Icon(Icons.favorite),
        )
      ],
    );
  }
}
