import 'package:bloc_flutter/bloc/ybloc/bloc.dart';
import 'package:bloc_flutter/bloc/ybloc/bloc_widget.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/15
abstract class APlusProPage<T extends CCC> extends BlocWidget {
  APlusProPage(String title, Bloc bloc) : super(title, bloc);
//  APlusProPage(String title, T bloc) : super(title, bloc);
//
//  @override
//  BlocState<BlocWidget<T>> state();
}

//abstract class BlocState<T extends BlocWidget> extends State<T> with BlocView, WidgetsBindingObserver {
abstract class APlusState<T extends APlusProPage> extends BlocState {

}

class CCC extends Bloc {
  String ccc() {}

  @override
  void dispose() {
    // TODO: implement dispose
  }
}

class Ap extends APlusProPage<CCC> {
  Ap(String title, CCC bloc) : super(title, bloc);

  @override
  BlocState<BlocWidget<CCC>> state() {
    return null;
  }
}

class a extends APlusState<Ap>{
  @override
  Widget build(BuildContext context) {
    // TODO: widget.bloc 类型
    return null;
  }

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
