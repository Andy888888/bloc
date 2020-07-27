import 'package:bloc_flutter/widgets/alert_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:stark/bloc_provider/bloc_provider.dart';
import 'package:stark/common/screen.dart';
import 'package:stark/network/state_bo.dart';
import 'package:stark/network/stream/state_stream_builder.dart';
import 'package:stark/network/view/state_view.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/27
abstract class APlusProBlocPage<T extends BlocBase> extends BlocWidget<T> with StateView {
  StreamBuilder<StateBo<M>> streamBuilder<M>({
    Key key,
    StateBo<M> initialData,
    @required Stream<StateBo<M>> stream,
    @required Function(BuildContext context, M data) completedView,
  }) {
    assert(completedView != null, 'completedView must not is null !');
    return StateStreamBuilder.create(
      key: key,
      initialData: initialData,
      stream: stream,
      stateView: this,
      completedView: completedView,
    );
  }

  @override
  Widget errorView(BuildContext context, StateBo data) {
    return GestureDetector(
      child: Text('哎呀，出错了(${data.code})'),
      onTap: () => retry(bloc(context)),
    );
  }

  @override
  Widget loadingView(BuildContext context) {
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
  Widget networkPoorView(BuildContext context, StateBo data) {
    return GestureDetector(
      child: Text('网络差'),
      onTap: () => retry(bloc(context)),
    );
  }

  @override
  Widget noDataView(BuildContext context) {
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
  Widget noNetworkView(BuildContext context, StateBo data) {
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
      onTap: () => retry(bloc(context)),
    );
  }

  @override
  Widget networkFailView(BuildContext context, StateBo data) {
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
      onTap: () => retry(bloc(context)),
    );
  }

  @override
  Widget businessFail(BuildContext context, StateBo data) {
    return GestureDetector(
      child: Text('哎呀，业务处理出错了(${data.code})'),
      onTap: () => retry(bloc(context)),
    );
  }
}
