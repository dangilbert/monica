import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:monica/core/networking/client.dart';
import '../fakes/fake_monica_client.dart';

void main() {
  setUp(() {
    MonicaClient monicaClient = FakeMonicaClient();
    GetIt.instance.registerSingleton(monicaClient);
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  test('on init sets the view state and loads the contacts from the repo', () async {}, skip: true);

  test('on init in case of api failure exposes an error effect', () async {}, skip: true);

  test('on add contact tapped view action, navigates to the add contact screen', () async {}, skip: true);

  test('on refresh view action and api success, reloads the contacts from the api', () async {}, skip: true);

  test('on refresh view action and api failure, exposes a LoadingErrorEffect', () async {}, skip: true);

  test('on contact details tapped view action, navigates to the contact details screen with the expected contact id', () async {}, skip: true);

}