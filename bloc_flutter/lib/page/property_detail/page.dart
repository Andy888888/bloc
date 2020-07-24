import 'dart:convert';
import 'package:bloc_flutter/app_base/apluspro_page.dart';
import 'package:bloc_flutter/model/resp/news_resp_entity.dart';
import 'package:bloc_flutter/page/property_detail/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stark/stark.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/19

class PropertyDetailPage extends APlusProPage<PropertyDetailBloc> {
  PropertyDetailPage(PropertyDetailBloc bloc) : super(bloc);

  @override
  BlocState<BlocWidget<PropertyDetailBloc>> state() => _PropertyDetailState();

  @override
  String get title => '房源详情';
}

class _PropertyDetailState extends APlusState<PropertyDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: streamBuilder<NewsRespEntity>(
          stream: widget.bloc.requestStreamController.stream,
          completedView: (data) {
            String title = data.result.data[0].title;
            logFormat(data.reason);
            return Text(title);
          },
        ),
      ),
    );
  }

  @override
  void prepare() {
    _networkInit();
    super.prepare();
  }

  _networkInit() {
    /// 定义一个拦截器
    Interceptor interceptor = InterceptorsWrapper(onRequest: (RequestOptions option) {
      /// 可统一制定请求日志
      logFormat('请求地址 => ${option.uri.toString()}'
          '\n  请求header => ${json.encode(option.headers)}'
          '\n  请求body => ${json.encode(option.data)}');
    }, onResponse: (Response response) {
      /// 可统一制定请求日志
      logFormat('响应 => ${response.data.toString()}');
    });

    /// 注册并注入拦截器
    Request.register([interceptor]);
    Request.logEnable();
  }

  @override
  viewDidLoad(callback) {
    widget.bloc.initData();
  }
}
