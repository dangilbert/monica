import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:monica/core/networking/client.dart';
import 'package:monica/login/bloc/login_bloc.dart';
import 'package:monica/service/navigation_service.dart';
import '../fakes/fake_monica_client.dart';
import '../fakes/fake_navigation_service.dart';

void main() {
  setUp(() {
    NavigationService _navigationService = FakeNavigationService();
    GetIt.instance.registerSingleton(_navigationService);
    MonicaClient monicaClient = FakeMonicaClient();
    GetIt.instance.registerSingleton(monicaClient);
  });

  tearDown(() {
    NavigationService navigationService = GetIt.instance.get();
    (navigationService as FakeNavigationService).dispose();
    GetIt.instance.reset();
  });

  test('initialises with loading false', () async {
    var subject = LoginBloc();
    expect(subject.viewState.loading, emits(false));
  });

  test('sets loading to true when login tapped', () async {
    var subject = LoginBloc();
    subject.handleAction(LoginTappedViewAction("", ""));
    expect(subject.viewState.loading, emitsInOrder([false, true, false]));
  });

  test('sets loading to false and shows host error when hostname is invalid',
      () async {
    var subject = LoginBloc();
    subject.handleAction(LoginTappedViewAction("invalidhost://baaaad", ""));
    expect(subject.viewState.loading, emitsInOrder([false, true, false]));
    expect(subject.effect, emits(LoginBlocInvalidHostError()));
  });

  test('sets loading to false and shows connection error when token incorrect',
      () async {
    var subject = LoginBloc();
    subject.handleAction(LoginTappedViewAction(
        "https://monicahq.com", FakeMonicaClient.INVALID_TOKEN));
    expect(subject.viewState.loading, emitsInOrder([false, true, false]));
    expect(subject.effect, emits(LoginBlocConnectionFailedError()));
  });

  test('triggers navigation to home when host and api are correct', () async {
    NavigationService navigationService = GetIt.instance.get();
    var subject = LoginBloc();
    subject.handleAction(LoginTappedViewAction(
        "https://monicahq.com", FakeMonicaClient.VALID_TOKEN));
    expect(subject.viewState.loading, emitsInOrder([false, true, false]));
    expectLater((navigationService as FakeNavigationService).routes,
        emits(Routes.Home));
  });
}
