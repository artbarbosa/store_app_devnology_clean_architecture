import 'dart:async';

import 'package:get_it/get_it.dart';

class SplashController implements Disposable {
  final StreamController<bool> _splashController = StreamController();
  Stream<bool> get splashStream => _splashController.stream;
  Sink<bool> get splashSink => _splashController.sink;

  double animatedSize = 0.4;

  @override
  FutureOr onDispose() {
    _splashController.close();
  }
}
