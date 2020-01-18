import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:monica/auth/session.dart';
import 'package:monica/core/data/user.dart';
import 'package:monica/home/bloc/drawer_bloc.dart';
import 'package:monica/i18n.dart';
import 'package:monica/new_page.dart';
import 'package:monica/service/navigation_service.dart';

class MonicaDrawer extends StatefulWidget {
  GlobalKey<ScaffoldState> _scaffoldKey;
  Function(Widget page) _pageCallback;

  MonicaDrawer(
      {Key key,
      @required GlobalKey<ScaffoldState> scaffoldKey,
      @required Function(Widget page) pageCallback})
      : super(key: key) {
    _scaffoldKey = scaffoldKey;
    _pageCallback = pageCallback;
  }

  @override
  _MonicaDrawerState createState() => _MonicaDrawerState(
      scaffoldKey: _scaffoldKey, pageCallback: _pageCallback);
}

class _MonicaDrawerState extends State<MonicaDrawer>
    with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey;
  Function(Widget page) _pageCallback;

  _MonicaDrawerState(
      {GlobalKey<ScaffoldState> scaffoldKey,
      @required Function(Widget page) pageCallback}) {
    _scaffoldKey = scaffoldKey;
    _pageCallback = pageCallback;
  }

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

  DrawerBloc _bloc = DrawerBloc();

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
    return Drawer(
      child: Column(
        children: <Widget>[
          _drawerUserHeader(),
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
                            children: _drawerItems()),
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

  void _showNotImplementedMessage() {
    Navigator.pop(context); // Dismiss the drawer.
    _scaffoldKey.currentState.showSnackBar(const SnackBar(
      content: Text("The drawer's items don't do anything"),
    ));
  }

  Widget _drawerUserHeader() {
    return StreamBuilder<UserState>(
        stream: _bloc.viewState.userState,
        builder: (context, userState) {
          if (userState.hasData) {
            UserState userStateData = userState.data;
            if (userStateData.loadingState == LoadingState.Loaded && userStateData.user != null) {
              return _userHeader(userStateData.user);
            } else {
              return _loadingUserHeader();  
            }
          } else {
            return _loadingUserHeader();
          }
        });
  }

  Widget _loadingUserHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text(I18n.of(context).coreLoading),
      accountEmail: Text(""),
      currentAccountPicture: const CircleAvatar(
        backgroundColor: Colors.red,
        child: CircularProgressIndicator(),
      ),
      margin: EdgeInsets.zero,
      onDetailsPressed: () {
        _showDrawerContents = !_showDrawerContents;
        if (_showDrawerContents)
          _controller.reverse();
        else
          _controller.forward();
      },
    );
  }

  List<Widget> _drawerItems() => [
        ListTile(
          leading: Icon(Icons.dashboard),
          title: Text(I18n.of(context).appScreenDashboard),
          onTap: () => setState(() {
            _pageCallback(NewPage(I18n.of(context).appScreenDashboard));
            Navigator.pop(context);
          }),
        ),
        ListTile(
          leading: Icon(Icons.contacts),
          title: Text('Contacts'),
          onTap: () => setState(() {
            _pageCallback(NewPage("Contacts"));
            Navigator.pop(context);
          }),
        ),
        ListTile(
          leading: Icon(Icons.photo_library),
          title: Text('Photo Gallery'),
          onTap: () => setState(() {
            _pageCallback(NewPage("Photo Gallery"));
            Navigator.pop(context);
          }),
        ),
        ListTile(
          leading: Icon(Icons.note),
          title: Text('Journal'),
          onTap: () => setState(() {
            _pageCallback(NewPage("Journal"));
            Navigator.pop(context);
          }),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () => setState(() {
            _pageCallback(NewPage("Settings"));
            Navigator.pop(context);
          }),
        ),
        ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () async {
              // TODO add a bloc for this screen to handle logout
              SessionRepo sessionRepo = GetIt.instance.get();
              await sessionRepo.logout();
              Navigator.of(context).pushReplacementNamed(Routes.Login);
            }),
      ];

  Widget _userHeader(User user) {
    return UserAccountsDrawerHeader(
      accountName: Text("${user.data.firstName} ${user.data.lastName}" ),
      accountEmail: Text(user.data.email),
      currentAccountPicture: const CircleAvatar(
        backgroundColor: Colors.red,
      ),
      margin: EdgeInsets.zero,
      onDetailsPressed: () {
        _showDrawerContents = !_showDrawerContents;
        if (_showDrawerContents)
          _controller.reverse();
        else
          _controller.forward();
      },
    );
  }
}
