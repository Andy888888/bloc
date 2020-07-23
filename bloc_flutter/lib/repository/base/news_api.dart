import 'package:bloc_flutter/model/resp/base_news_entity.dart';
import 'package:bloc_flutter/model/resp/base_news_resp_entity.dart';
import 'package:stark/network/net/api.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/19

class NewsApi<S, T extends BaseNewsEntity> extends Api<S, T> {
  NewsApi() {
    baseUrl = 'http://v.juhe.cn/toutiao/index';
  }

  @override
  bool state(T obj) {
//    BaseNewsReqEntity reqEntity = obj as BaseNewsReqEntity;
    return obj.errorCode == 0;
  }
}
