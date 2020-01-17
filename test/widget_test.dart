// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:monica/login/bloc/login_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:monica/service/navigation_service.dart';

import 'fakes/fake_navigation_service.dart';

void main() {
  LoginBloc loginBloc;

  setUp(() {
    GetIt.instance.registerSingleton<NavigationService>(FakeNavigationService());
    loginBloc = LoginBloc();
  });

  tearDown(() {
    // loginBloc?.close();
    GetIt.instance.reset();
  });

  // test('initial state is InitialLoginState', () {
  //   expect(loginBloc.initialState, InitialLoginState());
  // });
  // test('tapping login with invalid host url returns error state', () async {
  //   final expectedResponse = [
  //     InitialLoginState(),
  //     LoginLoadingState(),
  //     LoginErrorState(),
  //   ];
  //   expectLater(loginBloc, emitsInOrder(expectedResponse));
  //   loginBloc.add(LoginTapped("fail", "test"));
  // });
}
