import 'package:stark/bloc/bloc.dart';
import 'package:stark/utils/logger.dart';

/// @description APlusProBloc
///
/// @author 燕文强
///
/// @date 2020/7/28
class APlusProBloc extends BlocBase {
  @override
  void dispose() {}

  @override
  void prepare() {
    logFormat('Bloc准备');
  }

  @override
  void retry() {
    logFormat('Bloc重试');
  }
}
