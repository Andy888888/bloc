import 'package:bloc_flutter/bloc/home/bloc.dart';
import 'package:flutter/material.dart';
import '../ybloc/bloc_widget.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/15
class HomePage extends BlocWidget<HomeBloc> {
  HomePage(String title, HomeBloc bloc) : super(title, bloc);

  @override
  BlocState<BlocWidget<HomeBloc>> state() => _HomeState();
}

class _HomeState extends BlocState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: widget.bloc.stream,
          initialData: 0,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Text('HomePage: ${snapshot.data} 下');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          widget.bloc.plus();
        },
      ),
    );
  }

  @override
  bool isBindingObserver() => true;

  @override
  void prepare() {
    // TODO: implement prepare
  }

  @override
  viewDidLoad(callback) {
    // TODO: implement viewDidLoad
    return null;
  }
}
