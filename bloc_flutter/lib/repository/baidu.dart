import 'package:bloc_flutter/architecture/network/net/api.dart';
import 'package:bloc_flutter/repository/base/apluspro_api.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/19
class BaiDuApi<R> extends APlusProApi {
  /// 获取用户Token信息
  static BaiDuApi webContent() => BaiDuApi<String>()
    ..method = Method.GET
    ..dataConvert = (data) => data;
}
