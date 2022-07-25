import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../_design_system/widgets/bottom_navigation_bart/custom_bottom_navigation_bar_widget.dart';
import '../controllers/custom_bottom_navigation_bar_controller.dart';
import '../widgets/custom_page_view.dart';

class AppContainer extends StatefulWidget {
  const AppContainer({Key? key}) : super(key: key);

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  final CustomBottomNavigationBarController controller =
      GetIt.I.get<CustomBottomNavigationBarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPageView(
        pageController: controller.pageController,
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: controller,
        builder: (context, value, _) {
          return CustomBottomNavigationBar(
            currentIndex: value,
            onTap: (value) => controller.changePage(value),
          );
        },
      ),
    );
  }
}
