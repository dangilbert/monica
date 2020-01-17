
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:monica/service/navigation_service.dart';

class FakeNavigationService implements NavigationService {
  @override
  bool goBack() {
    // TODO: implement goBack
    return null;
  }

  @override
  Future navigateTo(String routeName, {arguments}) {
    // TODO: implement navigateTo
    return null;
  }

  @override
  Future navigateToReplacing(String routeName, {arguments}) {
    // TODO: implement navigateToReplacing
    return null;
  }

  @override
  // TODO: implement navigatorKey
  GlobalKey<NavigatorState> get navigatorKey => null;

}