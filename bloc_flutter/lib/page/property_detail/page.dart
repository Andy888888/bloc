import 'package:bloc_flutter/model/resp/news_resp_entity.dart';
import 'package:bloc_flutter/page/property_detail/bloc.dart';
import 'package:flutter/material.dart';
import 'package:stark/stark.dart';
import '../../app_base/apluspro_bloc_page.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/19

class PropertyDetailPage extends APlusProBlocPage<PropertyDetailBloc> {
  @override
  String get title => '房源详情';

  @override
  Widget widget(BuildContext context, PropertyDetailBloc bloc) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: streamBuilder<NewsRespEntity>(
        stream: bloc.requestStreamController.stream,
        completedView: (context, data) {
          return _listView(context, data.result.data);
        },
      ),
    );
  }

  Widget _listView(BuildContext context, List<NewsRespResultData> listData) {
    return ListView.separated(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: Screen.safeAreaHeight(context)),
      itemCount: listData.length,
      itemBuilder: (context, index) {
        return Row(
          children: <Widget>[
            Expanded(child: Text(listData[index].title)),
            Image.network(listData[index].thumbnailPicS, height: 80),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Container(height: 0.5, color: Colors.grey),
        );
      },
    );
  }
}
