import 'dart:async';
import 'package:flutter/material.dart';
import 'package:monica/core/networking/client.dart';
import 'package:monica/service/navigation_service.dart';
import 'package:get_it/get_it.dart';
import 'package:verbal_expressions/verbal_expressions.dart';
import 'package:equatable/equatable.dart';

class LoginBloc {
  NavigationService _navigationService = GetIt.instance.get();
  MonicaClient _client = GetIt.instance.get();

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

  handleAction(LoginBlocViewAction action) {
    switch (action.runtimeType) {
      case LoginTappedViewAction:
        _handleLoginAttempt(action);
        break;
    }
  }

  void _handleLoginAttempt(LoginBlocViewAction action) async {
    LoginTappedViewAction tapAction = action;
    _loading.add(true);
    if (_isValidDomain(tapAction.host)) {
      var result =
          await _client.login(host: tapAction.host, token: tapAction.token);
      if (result) {
        _navigationService.navigateToReplacing(Routes.Home);
      } else {
        _effect.add(LoginBlocConnectionFailedError());
      }
    } else {
      _effect.add(LoginBlocInvalidHostError());
    }
    _loading.add(false);
  }

  bool _isValidDomain(String host) {
    var regex = VerbalExpression()
      ..startOfLine()
      ..then("http")
      ..maybe("s")
      ..then("://")
      ..maybe("www.")
      ..anythingBut(" ")
      ..endOfLine();

    return regex.hasMatch(host);
  }
}

@immutable
class LoginBlocViewState {
  LoginBlocViewState(this.loading);
  final Stream<bool> loading;
}

abstract class LoginBlocViewEffect extends Equatable {}

class LoginBlocInvalidHostError extends LoginBlocViewEffect {
  @override
  List<Object> get props => [];
}

class LoginBlocConnectionFailedError extends LoginBlocViewEffect {
  @override
  List<Object> get props => [];
}

class LoginBlocViewAction {}

class LoginTappedViewAction extends LoginBlocViewAction {
  LoginTappedViewAction(this.host, this.token);

  String host;
  String token;
}
