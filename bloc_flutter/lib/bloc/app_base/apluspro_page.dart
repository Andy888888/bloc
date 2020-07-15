import 'package:bloc_flutter/bloc/ybloc/bloc.dart';
import 'package:bloc_flutter/bloc/ybloc/bloc_widget.dart';
import 'package:flutter/src/widgets/framework.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/15
abstract class APlusBloc extends Bloc {
  String ccc();
}

abstract class APlusProPage<T extends APlusBloc> extends BlocWidget<T> {
  APlusProPage(String title, T bloc) : super(title, bloc);
}

abstract class APlusState<T extends APlusProPage> extends BlocState<T> {}

// -----------------------------------------------------------------------

class APlusBlocImpl extends APlusBloc {
  @override
  String ccc() {
    // TODO: implement ccc
    return null;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  String news;
}

class AppPageImpl extends APlusProPage<APlusBlocImpl> {
  AppPageImpl(String title, APlusBlocImpl bloc) : super(title, bloc);

  @override
  BlocState<BlocWidget<APlusBlocImpl>> state() {
    // TODO: implement state
    return null;
  }
}

class AppStateImpl extends APlusState<AppPageImpl> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
