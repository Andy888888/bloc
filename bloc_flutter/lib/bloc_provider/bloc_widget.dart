import 'package:bloc_flutter/bloc_provider/base_bloc.dart';
import 'package:bloc_flutter/bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/24

abstract class BlocWidget<T extends BlocBase> extends StatelessWidget {
  String get title;

  @override
  Widget build(BuildContext context) {
    T bloc = BlocProvider.of<T>(context);
    return createWidget(context, bloc);
  }

  void retry(T bloc) {
    bloc.retry();
  }

  Widget createWidget(BuildContext context, final T bloc);
}
