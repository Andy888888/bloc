import 'package:bloc_flutter/widgets/alert_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:stark/network/state_bo.dart';
import 'package:stark/stark.dart';

/// @description 应用层页面基类
///
/// @author 燕文强
///
/// @date 2020/7/15
abstract class APlusBloc extends Bloc {}

abstract class APlusProPage<T extends APlusBloc> extends BlocWidget<T> {
  APlusProPage(T bloc) : super(bloc);
}

/// todo: 应该把默认的StateView在这里实现
abstract class APlusState<T extends APlusProPage> extends BlocState<T> {
  AlertDialogWidget alertDialog;

  @override
  void prepare() {
    logFormat('GrowingIO记录访问页面：${widget.title}');
  }

  @override
  void dispose() {
    super.dispose();
    if (alertDialog != null) alertDialog.dispose();
  }

  void dialog({
    String content,
    String title,
    String leftButtonText,
    String rightButtonText,
    Function leftButtonResponse,
    Function leftClick,
    Function rightButtonResponse,
    Function rightClick,
    bool barrierDismissible = true,
    bool isCompulsory = false,
    bool canUpdate = false,
  }) {
    if (leftClick != null) {
      leftButtonResponse = leftClick;
    }
    if (rightClick != null) {
      rightButtonResponse = rightClick;
    }
    alertDialog = AlertDialogWidget(
      context: context,
      title: title,
      content: content,
      leftButtonText: leftButtonText,
      rightButtonText: rightButtonText,
      leftButtonResponse: leftButtonResponse,
      leftClick: leftClick,
      rightButtonResponse: rightButtonResponse,
      rightClick: rightClick,
      barrierDismissible: barrierDismissible,
      isCompulsory: isCompulsory,
      canUpdate: canUpdate,
    );
  }

  @override
  Widget errorView(StateBo data) {
    return GestureDetector(
      child: Text('哎呀，出错了(${data.code})'),
      onTap: () => retry(),
    );
  }

  @override
  Widget loadingView() {
    return SafeArea(
      child: Container(
        height: Screen.height(context),
        width: Screen.width(context),
        color: Colors.white,
        padding: EdgeInsets.only(left: 100, right: 100),
        child: Image.asset('images/loading_state.gif'),
      ),
    );
  }

  @override
  Widget networkPoorView(StateBo data) {
    return GestureDetector(
      child: Text('网络差'),
      onTap: () => retry(),
    );
  }

  @override
  Widget noDataView() {
    return SafeArea(
      child: Container(
        height: Screen.height(context),
        width: Screen.width(context),
        color: Colors.white,
        padding: EdgeInsets.only(left: 100, right: 100),
        child: Image.asset('images/no_data_state.png'),
      ),
    );
  }

  @override
  Widget noNetworkView(StateBo data) {
    return GestureDetector(
      child: SafeArea(
        child: Container(
          height: Screen.height(context),
          width: Screen.width(context),
          color: Colors.white,
          padding: EdgeInsets.only(left: 100, right: 100),
          child: Image.asset('images/net_exception_state.png'),
        ),
      ),
      onTap: () => retry(),
    );
  }

  @override
  Widget networkFailView(StateBo data) {
    return GestureDetector(
      child: SafeArea(
        child: Container(
          height: Screen.height(context),
          width: Screen.width(context),
          color: Colors.white,
          padding: EdgeInsets.only(left: 100, right: 100),
          child: Image.asset('images/network_fail_state.png'),
        ),
      ),
      onTap: () => retry(),
    );
  }
}
