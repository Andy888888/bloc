import 'package:bloc_flutter/page/main/bloc.dart';
import 'package:bloc_flutter/page/main/page.dart';
import 'package:flutter/material.dart';
import 'package:stark/bloc/bloc.dart';
import 'page/main/bloc.dart';
import 'page/main/page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<MainBloc>(bloc: MainBloc(), child: MainPage()),
    );
  }
}
