import 'dart:async';
import 'package:flutter/material.dart';
import 'package:monica/i18n.dart';
import 'package:monica/service/navigation_service.dart';
import 'package:get_it/get_it.dart';

class LoginBloc {

  NavigationService _navigationService = GetIt.instance.get();

  StreamController _effect = StreamController<LoginBlocViewEffect>();
  StreamController _loading = StreamController<bool>();

  LoginBlocViewState viewState;
  Stream effect;

  LoginBloc() {
    _loading.add(false);
    viewState = LoginBlocViewState(_loading.stream);
    effect = _effect.stream;
  }

  dispose() {
    _effect.close();
    _loading.close();
  }

  handleAction(LoginBlocViewAction action) async {
    switch (action.runtimeType) {
      case LoginTappedViewAction:
        LoginTappedViewAction tapAction = action;
        _loading.add(true);
        await Future.delayed(Duration(seconds: 2));
        if (tapAction.host == "test") {
          _navigationService.navigateToReplacing(Routes.Home);
        } else {
          _effect.add(LoginBlocInvalidHostError());
        }
        _loading.add(false);
        break;
    }
  }
}

@immutable
class LoginBlocViewState {
  LoginBlocViewState(this.loading);
  final Stream<bool> loading;
}

class LoginBlocViewEffect {}

class LoginBlocInvalidHostError extends LoginBlocViewEffect {}
class LoginBlocInvalidTokenError extends LoginBlocViewEffect {}

class LoginBlocViewAction {}

class LoginTappedViewAction extends LoginBlocViewAction {
  LoginTappedViewAction(this.host, this.token);

  String host;
  String token;
}
