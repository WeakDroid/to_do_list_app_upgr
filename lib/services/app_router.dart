import 'package:flutter/material.dart';
import 'package:to_do_list_app_upgr/screens/recycle_bin_screen.dart';
import '../screens/tabs_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBinScreen.id:
        return MaterialPageRoute(
          builder: (_) => const RecycleBinScreen(),
        );
      case TabsScreen.id:
        return MaterialPageRoute(
          builder: (_) =>  const TabsScreen(),
        );
      default:
        return null;
    }
  }
}
