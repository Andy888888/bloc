import 'package:bloc_flutter/bloc/bloc/base_bloc.dart';
import 'package:flutter/cupertino.dart';

/// @description Bloc方式提供者，以Provider来粘合页面和Bloc逻辑
///
/// @author 燕文强
///
/// @date 2020/7/13
class BlocProvider<T extends BlocBase> extends StatefulWidget {
  final T bloc;
  final Widget child;
  
  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }) : super(key: key);

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends BlocBase>(BuildContext context) {
    BlocProvider<T> provider =  context.findAncestorWidgetOfExactType();

    return provider.bloc;
  }
}

class _BlocProviderState<T> extends State<BlocProvider<BlocBase>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
