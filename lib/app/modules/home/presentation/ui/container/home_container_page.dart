import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

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

  @override
  void initState() {
    super.initState();
    controller.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
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
    );
  }
}
