import 'package:bloc_flutter/app_base/apluspro_page.dart';
import 'package:bloc_flutter/model/req/news_req_entity.dart';
import 'package:bloc_flutter/model/resp/news_resp_entity.dart';
import 'package:bloc_flutter/repository/toutiao_news_api.dart';
import 'package:stark/stark.dart';

import '../../repository/toutiao_news_api.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/19

class PropertyDetailBloc extends APlusBloc {
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

  var requestStreamController = RequestStreamController<NewsReqEntity, NewsRespEntity>();
  var _newsApi = TouTiaoNewsApi.yule(NewsReqEntity(type: 'yule', key: 'fa4ecf35661c6c45b59692202d441c81'));

  void initData() {
    // 模拟耗时，以便看到loading state ui
    Future.delayed(Duration(milliseconds: 500), () {
      requestStreamController.add(_newsApi);
    });
//    requestStreamController.add(_baiDuApi);
  }

  @override
  void dispose() {
    requestStreamController.close();
  }

  @override
  void retry() {
    requestStreamController.add(_newsApi);
  }
}
