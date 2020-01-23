import 'package:flutter/material.dart';
import 'package:monica/i18n.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          child: Center(
        child: Text(I18n.of(context).appScreenDashboard),
      )),
    );
  }
}
