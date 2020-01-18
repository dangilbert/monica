
import 'dart:async';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:monica/service/navigation_service.dart';

class FakeNavigationService implements NavigationService {

  StreamController<String> _routes = StreamController();
  Stream<String> routes;

  FakeNavigationService() {
    routes = _routes.stream;
  }

  void dispose() {
    _routes.close();
  }

  @override
  bool goBack() {
    return null;
  }

  @override
  Future navigateTo(String routeName, {arguments}) {
    _routes.add(routeName);
    return null;
  }

  @override
  Future navigateToReplacing(String routeName, {arguments}) {
    _routes.add(routeName);
    return null;
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => null;

}