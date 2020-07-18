import 'package:bloc_flutter/architecture/bloc/bloc.dart';
import 'package:bloc_flutter/architecture/bloc/bloc_widget.dart';
import 'package:bloc_flutter/architecture/utils/logger.dart';
import 'package:bloc_flutter/widgets/alert_dialog_widget.dart';

/// @description 应用层页面基类
///
/// @author 燕文强
///
/// @date 2020/7/15
abstract class APlusBloc extends Bloc {
  void done();
}

abstract class APlusProPage<T extends APlusBloc> extends BlocWidget<T> {
  APlusProPage(String title, T bloc) : super(title, bloc);
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
}
