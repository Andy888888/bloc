import 'package:bloc_flutter/generated/json/base/json_convert_content.dart';
import 'package:bloc_flutter/model/req/toutiao_news_req_entity.dart';
import 'package:bloc_flutter/model/resp/base_news_entity.dart';
import 'package:bloc_flutter/model/resp/base_news_resp_entity.dart';
import 'package:bloc_flutter/model/resp/toutiao_news_resp_entity.dart';
import 'package:bloc_flutter/repository/base/news_api.dart';
import 'package:stark/network/net/api.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/19
class TouTiaoNewsApi<S, T extends BaseNewsEntity> extends NewsApi<S, T> {
  /// 获取娱乐新闻
  static TouTiaoNewsApi<ToutiaoNewsReqEntity, ToutiaoRoot> yule(ToutiaoNewsReqEntity params) =>
      TouTiaoNewsApi<ToutiaoNewsReqEntity, ToutiaoRoot>()
        ..method = Method.GET
        ..body = params
        ..dataConvert = (data) {
          var entity = JsonConvert.fromJsonAsT<ToutiaoRoot>(data);
          return entity;
        };
}
