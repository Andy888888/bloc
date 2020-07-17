import 'package:flutter/material.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/17
mixin StateView {
  Widget noNetworkView();

  Widget networkPoorView();

  Widget loadingView();

  Widget errorView();

  Widget noDataView();

//  Widget completedView(dynamic data);
}
