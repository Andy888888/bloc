import 'package:bloc_flutter/page/property/bloc.dart';
import 'package:bloc_flutter/page/property/page.dart';
import 'package:flutter/material.dart';
import 'package:stark/bloc_provider/bloc_provider.dart';
import 'package:stark/network/network.dart';
import 'package:stark/utils/logger.dart';
import 'bloc.dart';

/// @description Provider方式的页面
///
/// @author 燕文强
///
/// @date 2020/7/14

class MainPage extends BlocWidget<MainBloc> {
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
//          child: StateStreamBuilder.create(stateView: this, completedView: (context) {}),
          child: StreamBuilder<int>(
            stream: bloc.stream,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text('你点击了我: ${snapshot.data} 下');
            },
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 80, right: 40),
        child: FloatingActionButton(
          child: Icon(Icons.navigate_next),
          onPressed: () {
            bloc.plus();
            Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold(body: PropertyPage(PropertyBloc()))));
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
