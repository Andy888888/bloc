import 'dart:async';

import '../ybloc/y_base_bloc.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/15
class HomeBloc extends YBlocBase {
  int _count = 0;
  StreamController<int> _controller = StreamController<int>();

  Stream<int> get stream => _controller.stream;

  StreamSink<int> get sink => _controller.sink;

  void plus() {
    sink.add(++_count);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
