import 'package:bloc_flutter/bloc/ybloc/bloc_view.dart';
import 'package:bloc_flutter/bloc/ybloc/bloc.dart';
import 'package:bloc_flutter/bloc/ybloc/views.dart';
import 'package:flutter/material.dart';
import 'alert_dialog_widget.dart';
import 'logger.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/14
abstract class BlocWidget<T extends Bloc> extends StatefulWidget {
  final T bloc;
  final String title;

  BlocWidget(this.title, this.bloc, {Key key}) : super(key: key) {
    assert(title != null, 'title must not is null');
    assert(bloc != null, 'bloc must not is null');
  }

  BlocState<BlocWidget<T>> state();

  @override
  State<StatefulWidget> createState() => state();
}

abstract class BlocState<T extends BlocWidget> extends State<T> with BlocView, WidgetsBindingObserver {
  bool _bindingObserver;
  AlertDialogWidget alertDialog;

  @override
  void dispose() {
    widget.bloc.dispose();
    alertDialog.dispose();
    super.dispose();
    if (_bindingObserver) {
      logFormat('remove WidgetsBindingObserver');
      WidgetsBinding.instance.removeObserver(this);
    }
  }

  @override
  void initState() {
    super.initState();
    _bindingObserver = isBindingObserver();
    prepare();
    if (_bindingObserver) {
      logFormat('bind WidgetsBindingObserver');
      WidgetsBinding.instance.addObserver(this);
    }

    WidgetsBinding.instance.addPostFrameCallback((callback) {
      viewDidLoad(callback);
    });
  }

  bool isBindingObserver() => false;

  viewDidLoad(callback);

  void prepare();

  @override
  void didChangeAccessibilityFeatures() {}

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    logFormat('lifecycle changed: $state');
  }

  @override
  void didChangeLocales(List<Locale> locale) {}

  @override
  void didChangeMetrics() {}

  @override
  void didChangePlatformBrightness() {}

  @override
  void didChangeTextScaleFactor() {}

  @override
  void didHaveMemoryPressure() {}

  @override
  bool finish() {
    return Views.finish(context);
  }

  @override
  BuildContext getContext() => this.context;

  @override
  Future launch(Widget widget, {bool stack = false}) {
    return Views.launch(context, widget, stack: stack);
  }

  @override
  Future launchAndCloseSelf(Widget widget, {bool stack = false}) {
    return Views.launchAndCloseSelf(context, widget, stack: stack);
  }

  @override
  void toast(String msg,
      {int gravity = 1,
      int duration = 1,
      Color backgroundColor = const Color(0xAA000000),
      Color textColor = Colors.white,
      double backgroundRadius = 20,
      Border border}) {
    Views.toast(context, msg,
        gravity: gravity,
        duration: duration,
        backgroundColor: backgroundColor,
        textColor: textColor,
        backgroundRadius: backgroundRadius,
        border: border);
  }

  void showMsg({
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
}
