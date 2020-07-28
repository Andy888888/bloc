import 'package:bloc_flutter/app_base/apluspro_bloc_page.dart';
import 'package:bloc_flutter/page/property/bloc.dart';
import 'package:bloc_flutter/page/property/page.dart';
import 'package:flutter/material.dart';
import 'package:stark/common/views.dart';
import 'package:stark/utils/logger.dart';
import 'bloc.dart';

/// @description Provider方式的页面
///
/// @author 燕文强
///
/// @date 2020/7/14

class MainPage extends APlusProBlocPage<MainBloc> {
  @override
  String get title => 'MainPage';

  @override
  bool get bindingObserver => true;

  @override
  Widget widget(BuildContext context, MainBloc bloc) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: Center(
          child: streamBuilder(
            stream: bloc.controller.stream,
            completedView: (context, data) {
              return Text(data);
            },
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 80, right: 40),
        child: FloatingActionButton(
          child: Icon(Icons.navigate_next),
          onPressed: () {
            Views.launch(context, PropertyPage(PropertyBloc()));
          },
        ),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    logFormat('这里是新的生命周期：$state');
  }
}
