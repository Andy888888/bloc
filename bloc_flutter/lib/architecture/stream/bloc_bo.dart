/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/16
class BlocBo<T> {
  T data;
  UIState uiState;

  BlocBo({this.data, this.uiState = UIState.done});
}

enum UIState {
  networkOffline,
  networkPoor,
  networkError,
  loading,
  dataIsNull,
  error,
  done,
}
