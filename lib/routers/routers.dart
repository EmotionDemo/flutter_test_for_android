
import 'package:android_play_flutter/pages/articleDetail.dart';
import 'package:android_play_flutter/pages/bottomNavViewPage.dart';
import 'package:android_play_flutter/pages/groundPage.dart';
import 'package:android_play_flutter/pages/homePage.dart';
import 'package:android_play_flutter/pages/login/loginPage.dart';
import 'package:android_play_flutter/pages/login/registerPage.dart';
import 'package:android_play_flutter/pages/minePage.dart';
import 'package:android_play_flutter/pages/pjoPage.dart';
import 'package:android_play_flutter/pages/publicPage.dart';
import 'package:flutter/material.dart';

Map routes = {
  "/": (context) => const BottomNavView(),
  "/home": (context) =>  HomePage(),
  "/ground": (context) => const GroundPage(),
  "/project": (context) =>  ProjectPage(),
  "/public": (context) => const PublicPage(),
  "/mine": (context) => const MinePage(),
  "/article":(context, {arguments}) =>  ArticleDetailView(arguments: arguments),
  "/login":(context) =>  const LoginPage(),
  "/register":(context) =>  const RegisterPage(),
};

var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (settings.arguments != null) {
    final Route route = MaterialPageRoute(
        builder: (context) =>
            pageContentBuilder(context, arguments: settings.arguments));
    return route;
  } else {
    final Route route =
        MaterialPageRoute(builder: (context) => pageContentBuilder(context));
    return route;
  }
};
