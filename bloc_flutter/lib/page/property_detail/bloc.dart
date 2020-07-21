import 'package:bloc_flutter/app_base/apluspro_page.dart';
import 'package:bloc_flutter/app_base/request_whith_state.dart';
import 'package:bloc_flutter/repository/baidu.dart';
import 'package:stark/stark.dart';

import '../../repository/baidu.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/19

class PropertyDetailBloc extends APlusBloc {
  RequestStreamController<BaiDuApi, String> requestStreamController = RequestStreamController<BaiDuApi, String>();
  var _baiDuApi = BaiDuApi.webContent();
  RequestWithState requestWithState;

  void initData() {
    // 模拟耗时，以便看到loading state ui
    Future.delayed(Duration(milliseconds: 500), () {
      requestStreamController.add(_baiDuApi);
    });
//    requestStreamController.add(_baiDuApi);
  }

  @override
  void dispose() {
    requestStreamController.close();
  }

  @override
  void retry() {
    requestStreamController.add(_baiDuApi);
  }
}
