import 'package:bloc_flutter/page/property_detail/bloc.dart';
import 'package:bloc_flutter/page/property_detail/page.dart';
import 'package:bloc_flutter/widgets/alert_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:stark/bloc_provider/bloc_provider.dart';
import 'package:stark/stark.dart';
import '../../app_base/apluspro_bloc_page.dart';
import '../property_detail/bloc.dart';
import '../property_detail/page.dart';
import 'bloc.dart';

/// @description 房源页面
///
/// @author 燕文强
///
/// @date 2020/7/16

class PropertyPage extends APlusProBlocPage<PropertyBloc> {
  @override
  String get title => '房源列表';

  @override
  bool get bindingObserver => true;

  @override
  Widget widget(BuildContext context, PropertyBloc bloc) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: streamBuilder<String>(
        stream: bloc.controller.stream,
        completedView: (context, data) {
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
                  onTap: () => Views.launch(
                      context, BlocProvider<PropertyDetailBloc>(child: PropertyDetailPage(), bloc: PropertyDetailBloc())),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        onPressed: () {
          _showDialog(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  void _showDialog(BuildContext context) {
    AlertDialogWidget(
      context: context,
      content: '这是一个弹框消息',
      rightClick: (dialog) {
        dialog.update(
          AlertBuilder.create(
            context: context,
            content: '弹框不消失，修改弹框内容',
            rightClick: (dialog) {
              dialog.dispose();
              Views.finish(context);
            },
          ),
        );
      },
      canUpdate: true,
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    logFormat('$title生命周期：$state');
  }
}
