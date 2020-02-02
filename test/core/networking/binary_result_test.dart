import 'package:flutter_test/flutter_test.dart';
import 'package:monica/core/networking/binary_result.dart';

void main() {
  test('test onSuccess called when result is BinaryResultSuccess', () async {
    var subject = BinaryResult.success(value: null);

    var called = false;
    subject.onSuccess((value) {
      called = true;
    });
    expect(called, true);
  });

  test('test onSuccess not called when result is BinaryResultFailure',
      () async {
    var subject = BinaryResult.failure();

    var called = false;
    subject.onSuccess((value) {
      called = true;
    });
    expect(called, false);
  });

  test('test onFailure not called when result is BinaryResultSuccess',
      () async {
    var subject = BinaryResult.success(value: null);

    var called = false;
    subject.onFailure(() {
      called = true;
    });
    expect(called, false);
  });

  test('test onFailure called when result is BinaryResultFailure', () async {
    var subject = BinaryResult.failure();

    var called = false;
    subject.onFailure(() {
      called = true;
    });
    expect(called, true);
  });

  test('when BinaryResultSuccess only onSuccess is called', () async {
    var subject = BinaryResult.success(value: null);

    var successCalled = false;
    var failureCalled = false;
    subject
      ..onSuccess((value) {
        successCalled = true;
      })
      ..onFailure(() {
        failureCalled = true;
      });
    expect(successCalled, true);
    expect(failureCalled, false);
  });

  test('when BinaryResultFailure only onFailure is called', () async {
    var subject = BinaryResult.failure();

    var successCalled = false;
    var failureCalled = false;
    subject
      ..onSuccess((value) {
        successCalled = true;
      })
      ..onFailure(() {
        failureCalled = true;
      });
    expect(successCalled, false);
    expect(failureCalled, true);
  });

  test('when BinaryResultSuccess triggers onSuccess, value is provided',
      () async {
    var subject = BinaryResult.success(value: "test");

    var successValue;
    subject
      ..onSuccess((value) {
        successValue = value;
      });
    expect(successValue, "test");
  });
}
