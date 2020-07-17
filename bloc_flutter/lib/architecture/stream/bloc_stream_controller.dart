import 'dart:async';
import 'package:bloc_flutter/architecture/stream/state_bo.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/16
class BlocStreamController<T extends StateBo> {
  StreamController<T> controller;

  BlocStreamController() {
    controller = StreamController<T>();
  }

  Stream<T> get stream => controller.stream;

  StreamSink<T> get _sink => controller.sink;

  void add(T item) {
    if (!controller.isClosed || controller.isPaused) {
      _sink.add(item);
    }
  }

  close() {
    controller.close();
    controller = null;
  }
}
