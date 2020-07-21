import 'package:stark/network/net/api.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/19

class APlusProApi<T> extends Api<T> {
  APlusProApi() {
    baseUrl = 'https://www.baidu.com';
  }

  @override
  bool state(obj) {
    return true;
  }
}
