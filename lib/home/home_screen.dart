import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:get_it/get_it.dart';
import 'package:monica/auth/session.dart';
import 'package:monica/home/drawer.dart';
import 'package:monica/i18n.dart';
import 'package:monica/new_page.dart';
import 'package:monica/service/navigation_service.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _currentPage;

  @override
  Widget build(BuildContext context) {
    if (_currentPage == null) {
      _currentPage = NewPage(I18n.of(context).appScreenDashboard);
    }
    return new Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: new Text("Monica"),
          elevation:
              defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
        ),
        drawer: MonicaDrawer(scaffoldKey: _scaffoldKey, pageCallback: (page) { _changePage(page); }),
        body: new Container(
          child: _currentPage,
        ));
  }

void _changePage(Widget page) {
  setState(() {
    _currentPage = page;
  });
}
  
}
