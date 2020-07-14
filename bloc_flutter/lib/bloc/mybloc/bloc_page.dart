import 'dart:async';

import 'package:bloc_flutter/bloc/mybloc/bloc_controller.dart';
import 'package:bloc_flutter/bloc/mybloc/bloc_model.dart';
import 'package:flutter/cupertino.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/13
abstract class BasePage<T extends Bloc<M>, M> extends StatefulWidget {
  final T bloc;
  final String title;

  const BasePage({Key key, this.bloc, this.title}) : super(key: key);

  @override
  BlocState<T, M> createState() => state();

  BlocState<T, M> state();
}

abstract class BlocState<T, M> extends State<BasePage<Bloc, M>> implements StreamState<M> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BlocModel<M>>(
        initialData: null,
        stream: widget.bloc.stream,
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.data.status == BlocStatus.networkOffline) return networkOffline();
          if (asyncSnapshot.data.status == BlocStatus.networkPoor) return networkPoor();
          if (asyncSnapshot.data.status == BlocStatus.networkError) return networkError();
          if (asyncSnapshot.data.status == BlocStatus.loading) return loading();
          if (asyncSnapshot.data.status == BlocStatus.dataIsNull) return dataIsNull();
          if (asyncSnapshot.hasError) return error();
          return done(asyncSnapshot.data.data);
        });
  }

  StreamBuilder<BlocModel<M>> getStream<T>(Stream<BlocModel> stream) {
    return StreamBuilder<BlocModel<M>>(
        initialData: null,
        stream: stream,
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.data.status == BlocStatus.networkOffline) return networkOffline();
          if (asyncSnapshot.data.status == BlocStatus.networkPoor) return networkPoor();
          if (asyncSnapshot.data.status == BlocStatus.networkError) return networkError();
          if (asyncSnapshot.data.status == BlocStatus.loading) return loading();
          if (asyncSnapshot.data.status == BlocStatus.dataIsNull) return dataIsNull();
          if (asyncSnapshot.hasError) return error();
          return done(asyncSnapshot.data.data);
        });
  }

//  StreamBuilder<BlocModel<T>> streamBuilder<T>(Stream<BlocModel<T>> stream) {
//    return StreamBuilder<BlocModel<T>>(
//        initialData: null,
//        stream: stream,
//        builder: (context, asyncSnapshot) {
//          if (asyncSnapshot.data.status == BlocStatus.networkOffline) return networkOffline();
//          if (asyncSnapshot.data.status == BlocStatus.networkPoor) return networkPoor();
//          if (asyncSnapshot.data.status == BlocStatus.networkError) return networkError();
//          if (asyncSnapshot.data.status == BlocStatus.loading) return loading();
//          if (asyncSnapshot.data.status == BlocStatus.dataIsNull) return dataIsNull();
//          if (asyncSnapshot.hasError) return error();
//          return done(asyncSnapshot.data.data);
//        });
//  }
}

abstract class StreamState<M> {
  Widget networkOffline();

  Widget networkPoor();

  Widget networkError();

  Widget loading();

  Widget dataIsNull();

  Widget error();

  Widget done(M data);
}

// -----------------------------

class Page extends BasePage<PageBloc, String> {
  @override
  BlocState<PageBloc, String> state() {
    // TODO: implement state
    return null;
  }
}

class PageState extends BlocState<Page, String> {
  @override
  Widget dataIsNull() {
    return null;
  }

  @override
  Widget done(String data) {
    return null;
  }

  @override
  Widget error() {
    return null;
  }

  @override
  Widget loading() {
    return null;
  }

  @override
  Widget networkError() {
    return null;
  }

  @override
  Widget networkOffline() {
    return null;
  }

  @override
  Widget networkPoor() {
    return null;
  }
}

class PageBloc extends Bloc<String> {}
