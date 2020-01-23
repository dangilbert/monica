import 'dart:async';

import 'package:flutter/foundation.dart';

abstract class Bloc<T, E, A> {
  @protected
  StreamController<E> effectController = StreamController();

  T viewState;
  Stream<E> effect;

  Bloc() {
    effect = effectController.stream;
  }

  @mustCallSuper
  dispose() async {
    await effectController.close();
  }

  void handleAction(A action);
}
