import 'package:bloc_flutter/bloc/ybloc/y_base_bloc.dart';
import 'package:flutter/material.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/14
abstract class BlocWidget<T extends YBlocBase> extends StatefulWidget {
  final T bloc;

  BlocWidget({
    Key key,
    @required this.bloc,
  }) : super(key: key);

  @override
  BlocState<T> createState() => state();

  BlocState<T> state();
}

abstract class BlocState<T> extends State<BlocWidget<YBlocBase>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
