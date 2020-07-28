import 'dart:async';
import 'package:bloc_flutter/app_base/apluspro_bloc.dart';
import 'package:stark/network/state_bo.dart';
import 'package:stark/stark.dart';

/// @description 房源Bloc
///
/// @author 燕文强
///
/// @date 2020/7/16
class PropertyBloc extends APlusProBloc {
  StateStreamController<String> controller = StateStreamController<String>();

  @override
  void prepare() {
    super.prepare();
    Future.delayed(Duration(seconds: 2), () {
//      controller.add(StateBo.noNetwork());
      controller.add(StateBo.businessFail(code: 120, message: '业务处理失败'));
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.close();
  }

  @override
  void retry() {
    super.retry();
    Future.delayed(Duration(seconds: 1), () {
      controller.add(StateBo<String>('获取到120条房源'));
//      controller.add(StateBo.noData());
//      controller.add(StateBo.noNetwork());
    });
  }
}
