import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:monica/i18n.dart';
import 'package:monica/new_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _currentPage;

  static final Animatable<Offset> _drawerDetailsTween = Tween<Offset>(
    begin: const Offset(0.0, -1.0),
    end: Offset.zero,
  ).chain(CurveTween(
    curve: Curves.fastOutSlowIn,
  ));

  AnimationController _controller;
  Animation<double> _drawerContentsOpacity;
  Animation<Offset> _drawerDetailsPosition;
  bool _showDrawerContents = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _drawerContentsOpacity = CurvedAnimation(
      parent: ReverseAnimation(_controller),
      curve: Curves.fastOutSlowIn,
    );
    _drawerDetailsPosition = _controller.drive(_drawerDetailsTween);
  }

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
        drawer: _drawer(),
        body: new Container(
          child: _currentPage,
        ));
  }

  void _showNotImplementedMessage() {
    Navigator.pop(context); // Dismiss the drawer.
    _scaffoldKey.currentState.showSnackBar(const SnackBar(
      content: Text("The drawer's items don't do anything"),
    ));
  }

  void _onOtherAccountsTap(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Account switching not implemented.'),
          actions: <Widget>[
            FlatButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _drawer() {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text('Trevor Widget'),
            accountEmail: const Text('trevor.widget@example.com'),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.red,
            ),
            otherAccountsPictures: <Widget>[
              GestureDetector(
                dragStartBehavior: DragStartBehavior.down,
                onTap: () {
                  _onOtherAccountsTap(context);
                },
                child: Semantics(
                  label: 'Switch to Account B',
                  child: const CircleAvatar(backgroundColor: Colors.blueGrey),
                ),
              ),
              GestureDetector(
                dragStartBehavior: DragStartBehavior.down,
                onTap: () {
                  _onOtherAccountsTap(context);
                },
                child: Semantics(
                  label: 'Switch to Account C',
                  child: const CircleAvatar(backgroundColor: Colors.purple),
                ),
              ),
            ],
            margin: EdgeInsets.zero,
            onDetailsPressed: () {
              _showDrawerContents = !_showDrawerContents;
              if (_showDrawerContents)
                _controller.reverse();
              else
                _controller.forward();
            },
          ),
          MediaQuery.removePadding(
            context: context,
            // DrawerHeader consumes top MediaQuery padding.
            removeTop: true,
            child: Expanded(
              child: ListView(
                dragStartBehavior: DragStartBehavior.down,
                padding: const EdgeInsets.only(top: 8.0),
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      // The initial contents of the drawer.
                      FadeTransition(
                        opacity: _drawerContentsOpacity,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ListTile(
                              leading: Icon(Icons.dashboard),
                              title: Text(I18n.of(context).appScreenDashboard),
                              onTap: () => setState(() {
                                _currentPage = NewPage(
                                    I18n.of(context).appScreenDashboard);
                                Navigator.pop(context);
                              }),
                            ),
                            ListTile(
                              leading: Icon(Icons.contacts),
                              title: Text('Contacts'),
                              onTap: () => setState(() {
                                _currentPage = NewPage("Contacts");
                                Navigator.pop(context);
                              }),
                            ),
                            ListTile(
                              leading: Icon(Icons.photo_library),
                              title: Text('Photo Gallery'),
                              onTap: () => setState(() {
                                _currentPage = NewPage("Photo Gallery");
                                Navigator.pop(context);
                              }),
                            ),
                            ListTile(
                              leading: Icon(Icons.note),
                              title: Text('Journal'),
                              onTap: () => setState(() {
                                _currentPage = NewPage("Journal");
                                Navigator.pop(context);
                              }),
                            ),
                            ListTile(
                              leading: Icon(Icons.settings),
                              title: Text('Settings'),
                              onTap: () => setState(() {
                                _currentPage = NewPage("Settings");
                                Navigator.pop(context);
                              }),
                            ),
                          ],
                        ),
                      ),
                      // The drawer's "details" view.
                      SlideTransition(
                        position: _drawerDetailsPosition,
                        child: FadeTransition(
                          opacity: ReverseAnimation(_drawerContentsOpacity),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              ListTile(
                                leading: const Icon(Icons.add),
                                title: const Text('Add account'),
                                onTap: _showNotImplementedMessage,
                              ),
                              ListTile(
                                leading: const Icon(Icons.settings),
                                title: const Text('Manage accounts'),
                                onTap: _showNotImplementedMessage,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
