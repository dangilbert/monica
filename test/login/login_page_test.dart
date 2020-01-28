import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  setUp(() {
    // GetIt.instance.registerSingleton(secureStorage);
  });

  tearDown(() async {
    // await secureStorage.deleteAll();
    GetIt.instance.reset();
  });

  testWidgets(
      'on login tapped, if hostname is invalid, shows snackbar about invalid host',
      (WidgetTester tester) async {},
      skip: true);

  testWidgets('on login tapped, with valid hostname, shows loading progress, ',
      (WidgetTester tester) async {},
      skip: true);

  testWidgets(
      'on login tapped, if connection failed error occurs, shows snackbar about failed connection, hides loading banner and re-shows login form with input data',
      (WidgetTester tester) async {},
      skip: true);

  testWidgets(
      'on login tapped, calls bloc with `LoginBlocViewAction` populated with host and token fields',
      (WidgetTester tester) async {},
      skip: true);
}
