import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:monica/auth/session.dart';
import 'package:monica/core/networking/user_request.dart';
import 'package:monica/dashboard/data/dashboard_repo.dart';
import 'package:monica/i18n.dart';
import 'package:monica/new_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:monica/home/home_screen.dart';
import 'package:monica/login/login_page.dart';
import 'package:custom_splash/custom_splash.dart';
import 'package:get_it/get_it.dart';
import 'core/data/repo/contacts_repo.dart';
import 'core/networking/client.dart';
import 'core/networking/request/contacts_request.dart';
import 'service/navigation_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  _initDependencyGraph();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<dynamic, Widget> _returnValueAndHomeScreen = {
      1: HomePage(),
      2: LoginPage()
    };

    NavigationService navigationService = GetIt.instance.get();

    return new MaterialApp(
      navigatorKey: navigationService.navigatorKey,
      localizationsDelegates: [
        const I18nDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: I18nDelegate.supportedLocals,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
              ? Colors.grey[50]
              : null),
      darkTheme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
              ? Colors.grey[850]
              : null,
          brightness: Brightness.dark),
      home: CustomSplash(
        imagePath: 'assets/images/monica.png',
        backGroundColor: Colors.deepOrange,
        animationEffect: 'zoom-in',
        logoSize: 200,
        home: MyApp(),
        customFunction: () async {
          return await _checkLogin();
        },
        duration: 0,
        type: CustomSplashType.BackgroundProcess,
        outputAndHome: _returnValueAndHomeScreen,
      ),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case Routes.Home:
            return MaterialPageRoute(builder: (_) => HomePage());
          case Routes.Login:
            return MaterialPageRoute(fullscreenDialog: true, builder: (_) => LoginPage());
        }
        var page = settings.name.startsWith('/page/')
            ? NewPage(settings.name.substring(6))
            : NewPage("Invalid");
        return MaterialPageRoute(builder: (_) => page);
      },
    );
  }

  Future<int> _checkLogin() async {
    MonicaClient client = GetIt.instance.get();
    var sessionValid = await client.sessionIsValid();
    return sessionValid ? 1 : 2;
  }
}

void _initDependencyGraph() {
  GetIt.instance.registerSingleton(FlutterSecureStorage());
  GetIt.instance.registerSingleton(NavigationService());
  SessionRepo sessionRepo = SessionRepo();
  GetIt.instance.registerSingleton(sessionRepo);
  
  GetIt.instance.registerLazySingleton(() => ContactsRepo());
  GetIt.instance.registerLazySingleton(() => DashboardRepo());

  // Register API client/requests
  MonicaClient client = MonicaClient(sessionRepo: sessionRepo);
  GetIt.instance.registerSingleton(client);
  GetIt.instance.registerSingleton(UserRequest(client: client));
  GetIt.instance.registerLazySingleton(() => ContactsRequest(client: client));
}
