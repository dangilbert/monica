import 'package:monica/i18n.dart';
import 'package:monica/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';

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
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<LoginBlocViewEffect>(
          stream: _bloc.effect,
          builder: (context, effect) {
            
            if (effect.hasData && effect.data is LoginBlocInvalidHostError) {
              final snackBar = SnackBar(content: Text(I18n.of(context).loginErrorHostnameInvalid));
              WidgetsBinding.instance.addPostFrameCallback((duration) {
                Scaffold.of(context).showSnackBar(snackBar);
              });
            } else if (effect.hasData && effect.data is LoginBlocConnectionFailedError) {
              final snackBar = SnackBar(content: Text(I18n.of(context).loginErrorConnectionFailed));
              WidgetsBinding.instance.addPostFrameCallback((duration) {
                Scaffold.of(context).showSnackBar(snackBar);
              });
            }

            return SafeArea(
              child: Container(
                constraints: BoxConstraints.expand(),
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Image(
                          image: AssetImage("assets/images/monica.png"),
                        ),
                        StreamBuilder<bool>(
                            stream: _bloc.viewState.loading,
                            builder: (context, loading) {
                              if (loading.hasData && loading.data) {
                                return CircularProgressIndicator();
                              } else {
                                return Column(children: _form());
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  List<Widget> _form() {
    return [
      TextFormField(
        autocorrect: false,
        controller: hostInputController,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red, //this has no effect
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            labelText: I18n.of(context).loginHostName),
      ),
      SizedBox(
        height: 10,
      ),
      TextFormField(
        autocorrect: false,
        controller: tokenInputController,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red, //this has no effect
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            labelText: I18n.of(context).loginApiToken),
      ),
      RaisedButton(
        child: Text("Login"),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
        ),
        onPressed: () {
          _bloc.handleAction(LoginTappedViewAction(
              hostInputController.text, tokenInputController.text));
        },
      )
    ];
  }
}
