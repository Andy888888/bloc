import 'package:bloc_flutter/app_base/apluspro_page.dart';
import 'package:bloc_flutter/page/property_detail/bloc.dart';
import 'package:bloc_flutter/page/property_detail/page.dart';
import 'package:bloc_flutter/widgets/alert_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:stark/stark.dart';
import 'bloc.dart';

/// @description 房源页面
///
/// @author 燕文强
///
/// @date 2020/7/16

class PropertyPage extends APlusProPage<PropertyBloc> {
  PropertyPage(String title, PropertyBloc bloc) : super(title, bloc);

  @override
  BlocState<BlocWidget<PropertyBloc>> state() {
    return _PropertyState();
  }
}

class _PropertyState extends APlusState<PropertyPage> {
  @override
  Widget build(BuildContext context) {
    logFormat('${widget.title}执行一次Build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: streamBuilder<String>(
        stream: widget.bloc.controller.stream,
        completedView: (data) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(data),
                GestureDetector(
                  child: Container(
                    color: Colors.blue,
                    width: Screen.width(context),
                    height: 80,
                    margin: EdgeInsets.only(top: 30),
                    child: Center(
                        child: Text(
                      '跳转详情页',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
                  ),
                  onTap: () => launch(PropertyDetailPage('房源详情', PropertyDetailBloc())),
                ),
              ],
            ),
          );
        },
      ),
//        child: StreamBuilder<StateBo<String>>(
//          stream: widget.bloc.controller.stream,
//          initialData: StateBo<String>(data: '您要的房源正在赶来的路上'),
//          builder: (BuildContext context, AsyncSnapshot<StateBo<String>> snapshot) {
//            log('状态：${snapshot.connectionState}');
//            return Text(snapshot.data.data);
//          },
//        ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        onPressed: () {
          dialog(
            content: '这是一个弹框消息',
            rightClick: () {
              alertDialog.update(
                AlertBuilder.create(
                  context: context,
                  content: '弹框不消失，修改弹框内容',
                  rightClick: () {
                    finish();
                  },
                ),
              );
            },
            canUpdate: true,
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  @override
  bool isBindingObserver() => true;

  @override
  viewDidLoad(callback) {
    widget.bloc.requestProperties();
  }
}
