import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Navigate to a route with the name [routeName]
  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  /// Navigate too a route, replacing the current stack
  Future<dynamic> navigateToReplacing(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState.pushReplacementNamed(routeName);
  }

  /// Go back to the previous route
  ///
  /// Return `true` if successful, `false` otherwise
  bool goBack() {
    return navigatorKey.currentState.pop();
  }
}

class Routes {
  static const String Home = "home";
  static const String Login = "login";

  /*
  * Routes which are opened from the drawer
  */
  static const String dashboard = "home/dashboard";
  static const String contacts = "home/contacts";
  static const String gallery = "home/gallery";
  static const String journal = "home/journal";
  static const String settings = "home/settings";
}
