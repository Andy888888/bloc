import 'package:flutter/material.dart';
import 'bloc_provider/bloc_provider.dart';
import 'bloc_provider/impl/bloc.dart';
import 'bloc_provider/impl/page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<MainBloc>(bloc: MainBloc(), child: MainPage()),
    );
  }
}
