import 'dart:async';

import 'package:stark/bloc_provider/bloc.dart';
import 'package:stark/network/state_bo.dart';
import 'package:stark/network/utils/state_stream_controller.dart';
import 'package:stark/utils/logger.dart';

/// @description MainBloc
///
/// @author 燕文强
///
/// @date 2020/7/14
class MainBloc implements BlocBase {
  StateStreamController<String> controller = StateStreamController<String>();

  void init() {
    Future.delayed(Duration(seconds: 2), () {
      controller.add(StateBo.networkFail());
    });
  }

  void dispose() {
    controller.close();
  }

  @override
  void retry() {
    logFormat('重试');
    Future.delayed(Duration(seconds: 1), () {
      controller.add(StateBo<String>('获取到8条未读消息'));
//      controller.add(StateBo.noData());
//      controller.add(StateBo.noNetwork());
    });
  }
}
