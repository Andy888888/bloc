import 'package:bloc_flutter/app_base/apluspro_bloc.dart';
import 'package:flutter/material.dart';
import 'package:stark/bloc_provider/bloc_provider.dart';
import 'apluspro_bloc_page.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/28
class APlusProBlocProvider<T extends APlusProBloc> extends BlocProvider<T> {
  APlusProBlocProvider({
    Key key,
    @required T bloc,
    @required APlusProBlocPage<T> child,
  }) : super(key: key, bloc: bloc, child: child);
}
