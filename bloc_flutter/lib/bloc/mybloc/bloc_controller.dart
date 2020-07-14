import 'dart:async';

import 'package:bloc_flutter/bloc/mybloc/bloc_model.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/13
abstract class Bloc<T> {
  StreamController<BlocModel<T>> controller = StreamController<BlocModel<T>>();

  void dispose() {
    controller.close();
  }


  Stream<BlocModel<T>> get stream => controller.stream;

  StreamSink<BlocModel<T>> get sink => controller.sink;
}
