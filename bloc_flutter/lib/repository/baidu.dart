import 'package:bloc_flutter/repository/base/apluspro_api.dart';
import 'package:stark/network/net/api.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/19
class BaiDuApi<S, T> extends APlusProApi<S, T> {
  /// 获取用户Token信息
  static BaiDuApi<String, String> webContent() => BaiDuApi<String, String>()
    ..method = Method.GET
    ..dataConvert = (data) => data.toString();
}
