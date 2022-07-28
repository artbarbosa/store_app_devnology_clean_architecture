import 'package:flutter/material.dart';

import '../../../modules/splash/presentation/routers/splash_router.dart';
import '../ui/containers/app_container.dart';

class Routers {
  static String get initialRoute => '/splash';

  static Map<String, Widget Function(BuildContext, dynamic)> routes = {
    '/splash': (context, arguments) => const SplashRouter(),
    '/': (context, arguments) => const AppContainer(),
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
