import 'package:bloc_flutter/app_base/apluspro_bloc.dart';
import 'package:stark/network/state_bo.dart';
import 'package:stark/network/utils/state_stream_controller.dart';
import 'package:stark/stark.dart';

/// @description MainBloc
///
/// @author 燕文强
///
/// @date 2020/7/14
class MainBloc extends APlusProBloc {
  StateStreamController<String> controller = StateStreamController<String>();

  @override
  void prepare() {
    super.prepare();
    Future.delayed(Duration(seconds: 2), () {
      controller.add(StateBo.networkFail());
    });
  }

  @override
  void retry() {
    super.retry();
    Future.delayed(Duration(seconds: 2), () {
      controller.add(StateBo<String>('获取到8条未读消息'));
//      controller.add(StateBo.noData());
//      controller.add(StateBo.noNetwork());
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.close();
  }
}
