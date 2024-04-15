import 'package:flutter/material.dart';
import 'package:news/core/config/constants.dart';

// ignore: must_be_immutable
class CustomDrawer extends StatelessWidget {
  Function onCatrgoryDrawerTap;

  CustomDrawer({
    super.key,
    required this.onCatrgoryDrawerTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.mediaQuery.width * 0.8,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: Constants.mediaQuery.width * 0.8,
            height: 160,
            color: Constants.theme.primaryColor,
            child: Text(
              "News App!",
              style: Constants.theme.textTheme.titleLarge,
            ),
          ),
          InkWell(
            onTap: () {
              onCatrgoryDrawerTap();
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 25.0,
                bottom: 5,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.list_outlined,
                    size: 35,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    "Categories",
                    style: Constants.theme.textTheme.titleLarge?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // navigatorKey.currentState!.pushReplacementNamed(
              //   PagesRouteName.settingsView,
              // );
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 5.0,
                bottom: 10,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.settings,
                    size: 35,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    "Settings",
                    style: Constants.theme.textTheme.titleLarge?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
