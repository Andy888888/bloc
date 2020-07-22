import 'dart:async';
import 'package:bloc_flutter/app_base/apluspro_page.dart';
import 'package:stark/network/state_bo.dart';
import 'package:stark/stark.dart';

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

  void requestProperties() {
    Future.delayed(Duration(seconds: 2), () {
      controller.add(StateBo.networkFail());
    });
  }

  @override
  void retry() {
    logFormat('重试');
    Future.delayed(Duration(seconds: 1), () {
      controller.add(StateBo<String>('获取到120条房源'));
//      controller.add(StateBo.noData());
//      controller.add(StateBo.noNetwork());
    });
  }
}
