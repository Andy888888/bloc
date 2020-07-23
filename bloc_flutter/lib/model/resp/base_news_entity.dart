import 'package:bloc_flutter/generated/json/base/json_convert_content.dart';

class BaseNewsEntity {
  String reason;
  int errorCode;

  BaseNewsEntity fromJson(Map<String, dynamic> json) {
    return JsonConvert.fromJsonAsT<BaseNewsEntity>(json);
  }
}

//class AAA extends BaseNewsEntity with JsonConvert<AAA> {
//  String name;
//  String message;
//}
