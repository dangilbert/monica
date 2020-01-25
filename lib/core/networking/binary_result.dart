import 'package:flutter/foundation.dart';

class BinaryResult<T> {
  BinaryResult();

  factory BinaryResult.success({@required T value}) {
    return BinaryResultSuccess(value: value);
  }

  factory BinaryResult.failure({Exception exception}) => BinaryResultFailure(exception: exception);

  void onSuccess(Function(T value) action) {
    if (this is BinaryResultSuccess) {
      BinaryResultSuccess<T> result = this;
      action(result.value);
    }
  }

  void onFailure(Function() action) {
    if (this is BinaryResultFailure) {
      action();
    }
  }
}

@immutable
class BinaryResultSuccess<T> extends BinaryResult<T> {
  final T value;
  BinaryResultSuccess({@required this.value});
}

@immutable
class BinaryResultFailure<T> extends BinaryResult<T> {
  final Exception exception;

  BinaryResultFailure({this.exception});
}
