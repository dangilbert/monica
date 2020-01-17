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
            
            if (effect.hasData && effect.data is LoginBlocError) {
              LoginBlocError error = effect.data;
              final snackBar = SnackBar(content: Text(error.message));
              WidgetsBinding.instance.addPostFrameCallback((duration) {
                Scaffold.of(context).showSnackBar(snackBar);
              });
            }

            return SafeArea(
              child: Container(
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
          _bloc.handleAction(LoginTappedViewAction(
              hostInputController.text, tokenInputController.text));
        },
      )
    ];
  }
}
