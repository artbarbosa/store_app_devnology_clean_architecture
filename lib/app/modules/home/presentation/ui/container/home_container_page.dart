import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:store_app_devnology/app/_design_system/widgets/appbar/custom_app_bar_widget.dart';

import '../../../../../_design_system/widgets/bottom_navigation_bar/custom_bottom_navigation_bar_widget.dart';
import '../../../../../core/shared/ui/controllers/custom_badge_controller.dart';
import '../../../../../core/shared/ui/controllers/custom_bottom_navigation_bar_controller.dart';
import '../controllers/home_controllers.dart';
import '../pages/home_page.dart';
import '../states/product_states.dart';

class HomeContainerPage extends StatefulWidget {
  const HomeContainerPage({Key? key}) : super(key: key);

  @override
  State<HomeContainerPage> createState() => _HomeContainerPageState();
}

class _HomeContainerPageState extends State<HomeContainerPage> {
  final controller = GetIt.I.get<HomeController>();

  final controllerBottomNavigation =
      GetIt.I.get<CustomBottomNavigationBarController>();

  @override
  void initState() {
    super.initState();
    controller.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final badgeController = GetIt.I.get<CustomBadgeController>();

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBarWidget(
          isLeading: true,
          isActiveCart: true,
          isActiveActionsBar: true,
          numberItemsInCart: 2,
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, value, child) {
          if (value is ProductLoadedState) {
            return HomePage(
              listProducts: value.listProducts,
            );
          }
          if (value is ProductErrorState) {
            return Container();
          }
          return Container();
        },
      ),
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
