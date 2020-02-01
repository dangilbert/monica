import 'dart:async';
import 'package:flutter/material.dart';
import 'package:monica/core/data/model/user.dart';
import 'package:monica/core/data/repo/user_repo.dart';

class DrawerBloc {
  UserRepo _userRepo = UserRepo();

  StreamController<DrawerBlocViewEffect> _effect = StreamController();
  StreamController<UserState> _userState = StreamController();
  StreamSubscription _userSubscription;

  DrawerBlocViewState viewState;
  Stream effect;

  User _user;
  LoadingState _loadingState;

  DrawerBloc() {
    viewState = DrawerBlocViewState(userState: _userState.stream);
    effect = _effect.stream;

    _userSubscription = _userRepo.user.listen((user) {
      _user = user;
      _userState.add(UserState(user: _user, loadingState: _loadingState));
    });

    _loadUser();
  }

  dispose() {
    _effect.close();
    _userState.close();
    _userSubscription.cancel();
  }

  handleAction(DrawerBlocViewAction action) {
    switch (action.runtimeType) {
      case DrawerBlocActionRetryTapped:
        _loadUser();
        break;
      default:
        throw Exception("Unknown action");
        break;
    }
  }

  void _loadUser() async {
    _loadingState = LoadingState.Loading;
    _userState.add(UserState(user: _user, loadingState: _loadingState));
    var result = await _userRepo.loadUser();

    result
      ..onSuccess((user) {
        _loadingState = LoadingState.Loaded;
        _userState.add(UserState(user: _user, loadingState: _loadingState));
      })
      ..onFailure(() {
        _effect.add(DrawerBlocErrorLoadingUser());
        _loadingState = LoadingState.Errored;
        _userState.add(UserState(user: _user, loadingState: _loadingState));
      });
  }
}

@immutable
class DrawerBlocViewState {
  DrawerBlocViewState({@required this.userState});
  final Stream<UserState> userState;
}

@immutable
class UserState {
  final User user;
  final LoadingState loadingState;

  UserState({@required this.user, @required this.loadingState});
}

enum LoadingState { Loading, Loaded, Errored }

class DrawerBlocViewEffect {}

class DrawerBlocErrorLoadingUser extends DrawerBlocViewEffect {}

class DrawerBlocViewAction {}

class DrawerBlocActionRetryTapped extends DrawerBlocViewAction {}
