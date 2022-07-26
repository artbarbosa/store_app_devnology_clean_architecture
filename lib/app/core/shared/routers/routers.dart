import 'package:flutter/material.dart';
import 'package:store_app_devnology/app/modules/home/submodules/details/presentation/routers/detail_router.dart';

import '../ui/containers/app_container.dart';

class Routers {
  static String get initialRoute => '/';

  static Map<String, Widget Function(BuildContext, dynamic)> routes = {
    '/': (context, arguments) => const AppContainer(),
    '/detail': (context, arguments) => DetailRouter(arguments: arguments),
  };

  static Route? generateRoutes(RouteSettings settings) {
    final routerName = settings.name;
    final routerArgs = settings.arguments;

    final navigateTo = routes[routerName];
    if (navigateTo == null) return null;

    return MaterialPageRoute(
      builder: (context) => navigateTo.call(context, routerArgs),
    );
  }
}
