import 'package:bloc_flutter/app_base/apluspro_bloc_provider.dart';
import 'package:bloc_flutter/page/main/bloc.dart';
import 'package:bloc_flutter/page/main/page.dart';
import 'package:flutter/material.dart';

import 'page/main/bloc.dart';
import 'page/main/bloc.dart';
import 'page/main/page.dart';
import 'page/property_detail/page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: APlusProBlocProvider<MainBloc>(bloc: MainBloc(), child: MainPage()),
    );
  }
}
