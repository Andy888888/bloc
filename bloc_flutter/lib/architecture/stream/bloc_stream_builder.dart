import 'package:flutter/cupertino.dart';

import 'bloc_bo.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/16
class BlocStreamBuilder {
  static StreamBuilder<BlocBo<T>> create<T>({
    Key key,
    BlocBo<T> initialData,
    Stream<BlocBo<T>> stream,
    @required AsyncWidgetBuilder<BlocBo<T>> builder,
  }) {
    assert(builder != null, 'builder must not is null !');
    return StreamBuilder<BlocBo<T>>(key: key, initialData: initialData, stream: stream, builder: builder);
  }
}
