import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:monica/contacts/contacts_page.dart';
import 'package:monica/dashboard/dashboard_page.dart';
import 'package:monica/home/drawer.dart';
import 'package:monica/new_page.dart';
import 'package:monica/service/navigation_service.dart';

class HomePage extends StatefulWidget {
    @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

static Map<String, Widget> _pages = {
    Routes.dashboard: DashboardPage(),
    Routes.contacts: ContactsPage(),
    Routes.gallery: NewPage("Gallery"),
    Routes.journal: NewPage("Journal"),
    Routes.settings: NewPage("Settings"),
  };

  Widget _currentPage = _pages[Routes.dashboard];


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: new Text("Monica"),
          elevation:
              defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
        ),
        drawer: MonicaDrawer(pageCallback: (page) { _changePage(page); }),
        body: new Container(
          child: _currentPage,
        ));
  }

void _changePage(String page) {
  setState(() {
    _currentPage = _pages[page];
  });
}
  
}
