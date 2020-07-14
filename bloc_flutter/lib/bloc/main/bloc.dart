import 'dart:async';
import 'package:bloc_flutter/bloc/bloc/base_bloc.dart';
import 'package:flutter/src/widgets/framework.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/14
class MainBloc implements BlocBase {
  int _count = 0;
  StreamController<int> _controller = new StreamController<int>();

  Stream<int> get stream => _controller.stream;

  StreamSink<int> get sink => _controller.sink;

  void plus() {
    sink.add(++_count);
  }

  void dispose() {
    _controller.close();
  }

  @override
  Widget networkOffline() {
    // TODO: implement networkOffline
    return null;
  }
}
