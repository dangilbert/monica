import 'package:circleci_flutter/login/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final hostInputController = TextEditingController();
  final tokenInputController = TextEditingController();

  LoginBloc _bloc = LoginBloc();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    hostInputController.dispose();
    tokenInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/images/monica.png"),
                  ),
                  BlocBuilder(
                      bloc: _bloc,
                      builder: (context, state) {
                        if (state is InitialLoginState) {
                          return Column(children: _form());
                        } else if (state is LoginLoadingState) {
                          return CircularProgressIndicator();
                        } else if (state is LoginErrorState) {
                          return Column(children: _form());
                        } else {
                          throw Error();
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _form() {
    return [
      TextFormField(
        controller: hostInputController,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red, //this has no effect
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            labelText: 'Monica host name'),
      ),
      SizedBox(
        height: 10,
      ),
      TextFormField(
        controller: tokenInputController,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red, //this has no effect
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            labelText: 'API token'),
      ),
      RaisedButton(
        child: Text("Login"),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
        ),
        onPressed: () {
          _bloc.add(LoginTapped("test", "test"));
        },
      )
    ];
  }
}
