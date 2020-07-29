import 'package:bloc_flutter/app_base/apluspro_bloc_page.dart';
import 'package:bloc_flutter/page/property/bloc.dart';
import 'package:bloc_flutter/page/property/page.dart';
import 'package:flutter/material.dart';
import 'package:stark/bloc/bloc.dart';
import 'package:stark/common/views.dart';
import 'package:stark/utils/logger.dart';
import '../property/bloc.dart';
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
      body: streamBuilder<String>(
        stream: bloc.controller.stream,
        completedView: (context, data) {
          logFormat('得到数据了$data');
          return Center(
            child: Text(data),
          );
        },
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 80, right: 40),
        child: FloatingActionButton(
          child: Icon(Icons.navigate_next),
          onPressed: () {
            Views.launch(context, BlocProvider<PropertyBloc>(child: PropertyPage(), bloc: PropertyBloc()));
          },
        ),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    logFormat('$title生命周期：$state');
  }
}
