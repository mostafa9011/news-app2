import 'package:flutter/material.dart';
import 'package:news/core/config/pages_route_name.dart';
import 'package:news/pages/home/pages/home_view.dart';
import 'package:news/pages/settings/settings_view.dart';
import 'package:news/pages/splash/pages/splah_view.dart';

class Routes {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case PagesRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );

      case PagesRouteName.homeView:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
          settings: settings,
        );

      case PagesRouteName.settingsView:
        return MaterialPageRoute(
          builder: (context) => const SettingView(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
    }
  }
}
