import 'package:bloc_flutter/model/resp/base_news_entity.dart';

baseNewsEntityFromJson(BaseNewsEntity data, Map<String, dynamic> json) {
	if (json['reason'] != null) {
		data.reason = json['reason']?.toString();
	}
	if (json['errorCode'] != null) {
		data.errorCode = json['errorCode']?.toInt();
	}
	if (json['result'] != null) {
		data.result = json['result'];
	}
	return data;
}

Map<String, dynamic> baseNewsEntityToJson(BaseNewsEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['reason'] = entity.reason;
	data['errorCode'] = entity.errorCode;
	data['result'] = entity.result;
	return data;
}