import 'package:bloc_flutter/generated/json/base/json_convert_content.dart';
import 'package:bloc_flutter/generated/json/base/json_filed.dart';
import 'package:bloc_flutter/model/resp/base_news_entity.dart';

class ToutiaoRoot extends BaseNewsEntity with JsonConvert<ToutiaoRoot>{
	ToutiaoNewsRespEntity result;
}

class ToutiaoNewsRespEntity with JsonConvert<ToutiaoNewsRespEntity> {
	String stat;
	List<ToutiaoNewsRespData> data;
}

class ToutiaoNewsRespData with JsonConvert<ToutiaoNewsRespData> {
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
