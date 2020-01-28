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

  testWidgets('when bloc exposes stream of contacts, list of contacts is built',
      (WidgetTester tester) async {},
      skip: true);

  testWidgets('when bloc exposes error effect, snackbar is shown',
      (WidgetTester tester) async {},
      skip: true);

  testWidgets(
      'when bloc exposes contacts state with loading true, shows a progress bar',
      (WidgetTester tester) async {},
      skip: true);
}
