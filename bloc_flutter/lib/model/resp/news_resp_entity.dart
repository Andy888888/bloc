import 'package:bloc_flutter/generated/json/base/json_convert_content.dart';
import 'package:bloc_flutter/generated/json/base/json_filed.dart';

class NewsRespEntity with JsonConvert<NewsRespEntity> {
	String reason;
	NewsRespResult result;
	@JSONField(name: "error_code")
	int errorCode;
}

class NewsRespResult with JsonConvert<NewsRespResult> {
	String stat;
	List<NewsRespResultData> data;
}

class NewsRespResultData with JsonConvert<NewsRespResultData> {
	String uniquekey;
	String title;
	String date;
	String category;
	@JSONField(name: "author_name")
	String authorName;
	String url;
	@JSONField(name: "thumbnail_pic_s")
	String thumbnailPicS;
	@JSONField(name: "thumbnail_pic_s02")
	String thumbnailPicS02;
	@JSONField(name: "thumbnail_pic_s03")
	String thumbnailPicS03;
}
