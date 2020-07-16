import 'dart:async';
import 'package:bloc_flutter/app_base/apluspro_page.dart';
import 'package:bloc_flutter/architecture/stream/bloc_bo.dart';
import 'package:bloc_flutter/architecture/stream/bloc_stream_controller.dart';

/// @description 房源Bloc
///
/// @author 燕文强
///
/// @date 2020/7/16
class PropertyBloc extends APlusBloc {
  BlocStreamController<BlocBo<String>> controller = BlocStreamController<BlocBo<String>>();

  @override
  void dispose() {
    controller.close();
  }

  @override
  void done() {
    Future.delayed(Duration(seconds: 2), () {
      controller.add(BlocBo<String>(data: '获取到120条房源'));
    });
  }
}
