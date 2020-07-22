import 'package:bloc_flutter/generated/json/base/json_convert_content.dart';

class BaseNewsReqEntity<T> {
  String reason;
  T result;
  int errorCode;

  BaseNewsReqEntity.fromJson(Map<String, dynamic> json) {
    reason = json['reason'];
    errorCode = json['error_code'];
    result = JsonConvert<T>().fromJson(json['result']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['reason'] = reason;
    map['error_code'] = errorCode;
    map['result'] = JsonConvert.fromJsonAsT(result);
    return map;
  }
}
