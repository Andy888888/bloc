import 'package:bloc_flutter/app_base/apluspro_page.dart';
import 'package:bloc_flutter/architecture/bloc/bloc_widget.dart';
import 'package:bloc_flutter/architecture/utils/logger.dart';
import 'package:bloc_flutter/widgets/alert_dialog_widget.dart';
import 'package:flutter/material.dart';
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
      body: Center(
        child: streamBuilder<String>(
          stream: widget.bloc.controller.stream,
          completedView: (data) {
            return Text(data);
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
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          dialog(
            content: '这是一个弹框消息',
            rightClick: () {
              alertDialog.update(
                AlertBuilder.create(
                  context: context,
                  content: '再不打招呼，就当不知道',
                  rightClick: () {
                    Navigator.pop(alertDialog.context);
                  },
                ),
              );
            },
            canUpdate: true,
          );
        },
      ),
    );
  }

  @override
  bool isBindingObserver() => true;

  @override
  viewDidLoad(callback) {
    widget.bloc.requestProperties();
  }
}
