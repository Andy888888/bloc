import 'package:bloc_flutter/bloc/home/bloc.dart';
import 'package:bloc_flutter/bloc/ybloc/alert_dialog_widget.dart';
import 'package:bloc_flutter/bloc/ybloc/logger.dart';
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
//          widget.bloc.plus();
          showMsg(
              content: '你好是但是弹道式导弹',
              rightClick: () {
                alertDialog.update(AlertBuilder.create(
                    context: context,
                    content: '再不打招呼，就当不知道',
                    rightClick: () {
                      Navigator.pop(alertDialog.context);
                    }));
              },
              canUpdate: true);
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
