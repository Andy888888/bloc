import 'package:bloc_flutter/bloc/bloc/bloc_provider.dart';
import 'package:bloc_flutter/bloc/home/bloc.dart';
import 'package:bloc_flutter/bloc/home/page.dart';
import 'package:flutter/material.dart';

import 'bloc.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/14
// ignore: must_be_immutable
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
//          bloc.plus();
          Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold(body: HomePage('null', HomeBloc()))));
        },
      ),
    );
  }
}
