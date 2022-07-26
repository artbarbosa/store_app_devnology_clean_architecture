import 'package:flutter/material.dart';

import '../../submodules/details/presentation/routers/detail_arguments.dart';
import '../../submodules/details/presentation/routers/detail_router.dart';
import '../ui/container/home_container_page.dart';

class HomeRouter extends StatelessWidget {
  const HomeRouter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/home',
      onGenerateRoute: (settings) {
        if (settings.name == '/home') {
          return MaterialPageRoute(
            builder: (context) {
              return const HomeContainerPage();
            },
          );
        }
        if (settings.name == '/detail') {
          return MaterialPageRoute(
            builder: (context) {
              return DetailRouter(
                arguments: settings.arguments as DetailArguments,
              );
            },
          );
        }
        return null;
      },
    );
  }
}
