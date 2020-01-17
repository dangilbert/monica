import 'dart:async';
import 'package:flutter/material.dart';
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
        await Future.delayed(Duration(seconds: 5));
        if (tapAction.host == "test") {
          _navigationService.navigateToReplacing(Routes.Home);
        } else {
          _effect.add(LoginBlocError("Whoops"));
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

class LoginBlocError extends LoginBlocViewEffect {
  LoginBlocError(this.message);
  String message;
}

class LoginBlocViewAction {}

class LoginTappedViewAction extends LoginBlocViewAction {
  LoginTappedViewAction(this.host, this.token);

  String host;
  String token;
}
