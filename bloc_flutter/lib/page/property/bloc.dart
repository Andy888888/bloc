import 'dart:async';
import 'package:bloc_flutter/app_base/apluspro_page.dart';
import 'package:bloc_flutter/architecture/stream/state_bo.dart';
import 'package:bloc_flutter/architecture/stream/bloc_stream_controller.dart';
import 'package:bloc_flutter/architecture/utils/logger.dart';

/// @description 房源Bloc
///
/// @author 燕文强
///
/// @date 2020/7/16
class PropertyBloc extends APlusBloc {
  BlocStreamController<StateBo<String>> controller = BlocStreamController<StateBo<String>>();

  @override
  void dispose() {
    controller.close();
  }

  @override
  void done() {
//    controller.add(StateBo<String>('正在疯狂加载...', uiState: UIState.loading));
    Future.delayed(Duration(seconds: 2), () {
      controller.add(StateBo.networkPoor());
    });
  }

  @override
  void retry() {
    requestProperty();
  }

  void requestProperty() {
    logFormat('重试');
    Future.delayed(Duration(seconds: 1), () {
      controller.add(StateBo<String>('获取到120条房源'));
    });
  }
}
