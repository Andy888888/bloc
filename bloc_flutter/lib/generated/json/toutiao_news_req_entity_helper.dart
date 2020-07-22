import 'package:bloc_flutter/model/req/toutiao_news_req_entity.dart';

toutiaoNewsReqEntityFromJson(ToutiaoNewsReqEntity data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['key'] != null) {
		data.key = json['key']?.toString();
	}
	return data;
}

Map<String, dynamic> toutiaoNewsReqEntityToJson(ToutiaoNewsReqEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['key'] = entity.key;
	return data;
}