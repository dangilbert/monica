
import 'package:flutter_test/flutter_test.dart';
import 'package:monica/core/bloc/bloc.dart';

class MockBloc extends Bloc {
  @override
  void handleAction(action) {}
}

void main() {

  

  test('on dispose effects stream is closed', () async {
    var subject = MockBloc();
    var result = expectLater(subject.effect, emitsDone);

    await subject.dispose();

    await result;
  });

}