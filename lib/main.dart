import 'dart:io';

import 'package:circleci_flutter/new_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:circleci_flutter/home/home_screen.dart';
import 'package:circleci_flutter/login/login_page.dart';
import 'package:custom_splash/custom_splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<dynamic, Widget> _returnValueAndHomeScreen = {
      1: HomePage(),
      2: LoginPage()
    };

    return new MaterialApp(
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
        var page = settings.name.startsWith('/page/')
            ? NewPage(settings.name.substring(6))
            : NewPage("Invalid");
        return MaterialPageRoute(builder: (_) => page);
      },
    );
  }

  Future<int> _checkLogin() async {
    print("Doing stuff on init");
    await Future.delayed(Duration(seconds: 10));
    print("Finished waiting");
    return 2;
  }
}
