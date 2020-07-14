import 'package:flutter/material.dart';
import 'bloc/bloc/bloc_provider.dart';
import 'bloc/main/bloc.dart';
import 'bloc/main/page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<MainBloc>(bloc: MainBloc(), child: MainPage()),
    );
  }
}
