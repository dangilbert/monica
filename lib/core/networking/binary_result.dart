import 'package:flutter/foundation.dart';

class BinaryResult<T> {
  bool success;

  BinaryResult({@required this.success});

  factory BinaryResult.success({@required T value}) {
    return BinaryResultSuccess(value: value);
  }

  factory BinaryResult.failure() => BinaryResultFailure();

  void onSuccess(Function(T value) action) {
    if (success) {
      BinaryResultSuccess<T> result = this;
      action(result.value);
    }
  }

  void onFailure(Function() action) {
    if (!success) {
      action();
    }
  }
}

class BinaryResultSuccess<T> extends BinaryResult<T> {
  T value;
  BinaryResultSuccess({@required this.value}) : super(success: true);
}

class BinaryResultFailure<T> extends BinaryResult<T> {
  BinaryResultFailure() : super(success: false);
}
