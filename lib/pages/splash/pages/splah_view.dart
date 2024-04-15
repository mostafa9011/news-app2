import 'package:flutter/material.dart';
import 'package:news/core/config/pages_route_name.dart';
import 'package:news/core/widget/custom_background_widget.dart';
import 'package:news/main.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => navigatorKey.currentState!
          .pushReplacementNamed(PagesRouteName.homeView),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundwidget(
      child: Image.asset("assets/images/logo.png"),
    );
  }
}
