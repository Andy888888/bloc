import 'dart:async';
import 'package:bloc_flutter/bloc_provider/base_bloc.dart';

/// @description MainBloc
///
/// @author 燕文强
///
/// @date 2020/7/14
class MainBloc implements BlocBase {
  int _count = 0;
  StreamController<int> _controller = StreamController<int>();

  Stream<int> get stream => _controller.stream;

  StreamSink<int> get sink => _controller.sink;

  void plus() {
    sink.add(++_count);
  }

  void dispose() {
    _controller.close();
  }
}
