import 'package:bloc_flutter/page/main/bloc.dart';
import 'package:bloc_flutter/page/main/page.dart';
import 'package:flutter/material.dart';
import 'package:stark/bloc/bloc.dart';
import 'package:stark/stark.dart';
import 'page/main/bloc.dart';
import 'page/main/page.dart';

void main() => runApp(App().main());

class App {
  MaterialApp main() {
    return MaterialApp(
      home: BlocProvider<MainBloc>(bloc: MainBloc(), child: MainPage()),
    );
  }
}
