import 'package:bloc_flutter/bloc_provider/bloc_provider.dart';
import 'package:bloc_flutter/page/property/bloc.dart';
import 'package:bloc_flutter/page/property/page.dart';
import 'package:flutter/material.dart';
import 'bloc.dart';

/// @description Provider方式的页面
///
/// @author 燕文强
///
/// @date 2020/7/14
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MainBloc bloc = BlocProvider.of<MainBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('MainPage'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: bloc.stream,
          initialData: 0,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Text('你点击了我: ${snapshot.data} 下');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          bloc.plus();
          Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold(body: PropertyPage('房源列表', PropertyBloc()))));
        },
      ),
    );
  }
}
