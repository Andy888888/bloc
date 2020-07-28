import 'dart:convert';
import 'package:bloc_flutter/app_base/apluspro_bloc.dart';
import 'package:bloc_flutter/model/req/news_req_entity.dart';
import 'package:bloc_flutter/model/resp/news_resp_entity.dart';
import 'package:bloc_flutter/repository/toutiao_news_api.dart';
import 'package:dio/dio.dart';
import 'package:stark/stark.dart';
import '../../repository/toutiao_news_api.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/19

class PropertyDetailBloc extends APlusProBloc {
  var requestStreamController = RequestStreamController<NewsReqEntity, NewsRespEntity>();
  var _newsApi = TouTiaoNewsApi.yule(NewsReqEntity(type: 'yule', key: 'fa4ecf35661c6c45b59692202d441c81'));

  @override
  void prepare() {
    super.prepare();
    _networkInit();
    Future.delayed(Duration(milliseconds: 500), () {
      requestStreamController.add(_newsApi);
    });
  }

  @override
  void dispose() {
    super.dispose();
    requestStreamController.close();
  }

  @override
  void retry() {
    super.retry();
    requestStreamController.add(_newsApi);
  }

  _networkInit() {
    /// 定义一个拦截器
    Interceptor interceptor = InterceptorsWrapper(onRequest: (RequestOptions option) {
      /// 可统一制定请求日志
      logFormat('请求地址 => ${option.uri.toString()}'
          '\n  请求header => ${json.encode(option.headers)}'
          '\n  请求body => ${json.encode(option.data)}');
    }, onResponse: (Response response) {
      /// 可统一制定请求日志
      logFormat('响应 => ${response.data.toString()}');
    });

    /// 注册并注入拦截器
    Request.register([interceptor]);
    Request.logEnable();
  }
}

// http://v.juhe.cn/toutiao/index?type=yule&key=fa4ecf35661c6c45b59692202d441c81

//  {
//    "reason":"成功的返回",
//    "result":{
//    "stat":"1",
//      "data":[{
//        "uniquekey":"c4aad5e877d57cc6ec56d7a2688ea11d",
//        "title":"演员俞思远化身火锅西施，时尚创意有趣视频大片曝光！",
//        "date":"2020-07-22 13:49",
//        "category":"娱乐",
//        "author_name":"李萍聊美食",
//        "url":"https://mini.eastday.com/mobile/200722134907747.html",
//        "thumbnail_pic_s":"https://08imgmini.eastday.com/mobile/20200722/20200722134907_83e865b14f40ca665b83d6397c7bd611_3_mwpm_03200403.jpg",
//        "thumbnail_pic_s02":"http://08imgmini.eastday.com/mobile/20200722/20200722134907_83e865b14f40ca665b83d6397c7bd611_2_mwpm_03200403.jpg",
//        "thumbnail_pic_s03":"http://08imgmini.eastday.com/mobile/20200722/20200722134907_83e865b14f40ca665b83d6397c7bd611_1_mwpm_03200403.jpg"
//      }]
//    },
//  "error_code":0
//  }
