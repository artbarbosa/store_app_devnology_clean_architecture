import 'package:flutter/material.dart';

class CustomBottomNavigationBarController extends ValueNotifier<int> {
  CustomBottomNavigationBarController(super.value);

  PageController? pageController;

  int get selectedIndex => value;

  void changePage(int index) {
    pageController!.jumpToPage(index);
    value = index;
  }
}
