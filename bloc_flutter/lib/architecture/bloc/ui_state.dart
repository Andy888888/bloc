import 'package:flutter/material.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/17
mixin UIState {
  Widget networkOffline();

  Widget networkPoor();

  Widget networkError();

  Widget loading();

  Widget dataIsNull();

  Widget error();

  Widget done();
}