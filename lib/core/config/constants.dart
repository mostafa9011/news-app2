import 'package:flutter/material.dart';
import 'package:news/main.dart';

class Constants {
  static var mediaQuery =
      MediaQuery.of(navigatorKey.currentState!.context).size;
  static var theme = Theme.of(navigatorKey.currentState!.context);

  static const String apiKey = "496ddf62577f4387b7e82d6d6c47bfca";
  static const String baseUrl = "newsapi.org";
}
