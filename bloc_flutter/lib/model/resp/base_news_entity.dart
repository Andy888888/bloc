import 'package:bloc_flutter/generated/json/base/json_convert_content.dart';

class BaseNewsEntity with JsonConvert<BaseNewsEntity> {
	String reason;
	int errorCode;
	dynamic result;
}
