import 'package:bloc_flutter/generated/json/base/json_convert_content.dart';

class NewsReqEntity with JsonConvert<NewsReqEntity> {
  String type;
  String key;

  NewsReqEntity({this.type, this.key});
}
