import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../_design_system/widgets/bottom_navigation_bart/custom_bottom_navigation_bar_widget.dart';
import '../../../../modules/home/presentation/routers/home_router.dart';
import '../controllers/custom_bottom_navigation_bar_controller.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  final CustomBottomNavigationBarController controller =
      GetIt.I.get<CustomBottomNavigationBarController>();

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: widget.pageController,
      children: [
        const HomeRouter(),
        Scaffold(
          body: const Center(
            child: Text('Search'),
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
        ),
        Scaffold(
          body: const Center(
            child: Text('Cart'),
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
        ),
        Scaffold(
          body: const Center(
            child: Text('Profile'),
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
        ),
        Scaffold(
          body: const Center(
            child: Text('More'),
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
        ),
      ],
    );
  }
}
