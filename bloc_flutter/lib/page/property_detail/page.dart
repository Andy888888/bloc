import 'package:bloc_flutter/app_base/apluspro_page.dart';
import 'package:bloc_flutter/architecture/bloc/bloc_widget.dart';
import 'package:bloc_flutter/page/property_detail/bloc.dart';
import 'package:flutter/material.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/19

class PropertyDetailPage extends APlusProPage<PropertyDetailBloc> {
  PropertyDetailPage(String title, PropertyDetailBloc bloc) : super(title, bloc);

  @override
  BlocState<BlocWidget<PropertyDetailBloc>> state() => _PropertyDetailState();
}

class _PropertyDetailState extends APlusState<PropertyDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: streamBuilder<List<String>>(
          stream: widget.bloc.requestStreamController.stream,
          completedView: (data) {
            return Text(data[1]);
          },
        ),
      ),
    );
  }

  @override
  viewDidLoad(callback) {
    widget.bloc.propertyDetail();
  }
}
