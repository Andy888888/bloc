import 'package:bloc_flutter/generated/json/base/json_convert_content.dart';
import 'package:bloc_flutter/model/req/news_req_entity.dart';
import 'package:bloc_flutter/model/resp/news_resp_entity.dart';
import 'package:bloc_flutter/repository/base/news_api.dart';
import 'package:stark/network/net/api.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/19
class TouTiaoNewsApi<S, T> extends NewsApi<S, T> {
  /// 获取娱乐新闻
  static TouTiaoNewsApi<NewsReqEntity, NewsRespEntity> yule(NewsReqEntity params) =>
      TouTiaoNewsApi<NewsReqEntity, NewsRespEntity>()
        ..method = Method.GET
        ..body = params
        ..dataConvert = (data) => JsonConvert.fromJsonAsT<NewsRespEntity>(data);
}
