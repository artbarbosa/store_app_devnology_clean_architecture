import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../_design_system/widgets/appbar/custom_app_bar_widget.dart';
import '../../../../../_design_system/widgets/bottom_navigation_bar/custom_bottom_navigation_bar_widget.dart';
import '../../../../../core/shared/ui/controllers/custom_bottom_navigation_bar_controller.dart';
import '../pages/cart_page.dart';

class CartContainerPage extends StatelessWidget {
  CartContainerPage({Key? key}) : super(key: key);

  final controllerBottomNavigation =
      GetIt.I.get<CustomBottomNavigationBarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBarWidget(
          isLeading: true,
          isActiveActionsBar: true,
          numberItemsInCart: 2,
        ),
      ),
      body: const CartPage(),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: controllerBottomNavigation,
        builder: (context, value, _) {
          return CustomBottomNavigationBar(
            currentIndex: value,
            onTap: (value) => controllerBottomNavigation.changePage(value),
          );
        },
      ),
    );
  }
}
