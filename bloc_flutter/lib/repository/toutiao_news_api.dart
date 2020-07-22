import 'package:bloc_flutter/generated/json/base/json_convert_content.dart';
import 'package:bloc_flutter/model/req/toutiao_news_req_entity.dart';
import 'package:bloc_flutter/model/resp/base_news_resp_entity.dart';
import 'package:bloc_flutter/model/resp/toutiao_news_resp_entity.dart';
import 'package:bloc_flutter/repository/base/news_api.dart';
import 'package:stark/network/net/api.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/19
class TouTiaoNewsApi<S, T extends BaseNewsReqEntity> extends NewsApi<S, T> {
  /// 获取娱乐新闻
  static TouTiaoNewsApi<ToutiaoNewsReqEntity, BaseNewsReqEntity<ToutiaoNewsRespEntity>> yule(ToutiaoNewsReqEntity params) =>
      TouTiaoNewsApi<ToutiaoNewsReqEntity, BaseNewsReqEntity<ToutiaoNewsRespEntity>>()
        ..method = Method.GET
        ..body = params
        ..dataConvert = (data) {
//          BaseNewsReqEntity<ToutiaoNewsRespEntity> entity =
//              JsonConvert.fromJsonAsT<BaseNewsReqEntity<ToutiaoNewsRespEntity>>(data);
          var entity = BaseNewsReqEntity<ToutiaoNewsRespEntity>.fromJson(data);
          return entity;
        };
}
