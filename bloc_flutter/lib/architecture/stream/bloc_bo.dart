/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/16
class BlocBo<T> {
  T data;
  UIStatus uiStatus;

  BlocBo({this.data, this.uiStatus = UIStatus.done});
}

enum UIStatus {
  networkOffline,
  networkPoor,
  networkError,
  loading,
  dataIsNull,
  error,
  done,
}
