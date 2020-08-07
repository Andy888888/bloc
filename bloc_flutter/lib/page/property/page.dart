import 'package:bloc_flutter/page/property_detail/bloc.dart';
import 'package:bloc_flutter/page/property_detail/page.dart';
import 'package:bloc_flutter/widgets/alert_dialog_widget.dart';
import 'package:flutter/material.dart';
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
    List<String> menu = List<String>();
    menu.add('复制');
    menu.add('粘贴');
    menu.add('全选');

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
                PopMenu(menu, itemClick: (context, index) {
                  Views.launch(
                      context, BlocProvider<PropertyDetailBloc>(child: PropertyDetailPage(), bloc: PropertyDetailBloc()));
                }),
                Text(data),
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

class PopMenu extends StatelessWidget {
  final List<String> menu;
  final Function(BuildContext context, int index) itemClick;

  int get count => menu.length;

  PopMenu(this.menu, {this.itemClick});

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry padding = EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6);

    return Container(
      height: 50,
      width: 145,
      alignment: Alignment.center,
//      color: Colors.amber,
      child: ListView.separated(
        itemCount: count,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          BoxDecoration boxDecoration;
          if (index == 0) {
            boxDecoration = BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
              color: Colors.black,
            );
          } else if (index == count - 1) {
            boxDecoration = BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
              color: Colors.black,
            );
          } else {
            boxDecoration = null;
          }

          return GestureDetector(
            child: Center(
              child: Container(
                decoration: boxDecoration,
                color: boxDecoration == null ? Colors.black : null,
                padding: padding,
                child: Text(menu[index], style: TextStyle(color: Colors.white)),
              ),
            ),
            onTap: () {
              itemClick(context, index);
            },
            onTapUp: (TapUpDetails details) {
              print('x:${details.globalPosition.dx},y:${details.globalPosition.dy}');
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(color: Colors.white, width: 0.5);
        },
      ),
    );
  }
}
