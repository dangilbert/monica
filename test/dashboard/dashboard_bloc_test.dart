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

  test('on init sets the view state and loads the events from the repo', () async {}, skip: true);

  test('on init sets the view state and builds the summary', () async {}, skip: true);

}