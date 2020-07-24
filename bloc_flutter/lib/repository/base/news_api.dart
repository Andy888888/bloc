import 'package:stark/network/net/api.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/19

class NewsApi<S, T> extends Api<S, T> {
  NewsApi() {
    baseUrl = 'http://v.juhe.cn/toutiao/index';
  }

  @override
  bool state(obj) {
    int errorCode = obj['error_code'];
    return errorCode == 0;
  }
}
