/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/13
class BlocModel<T> {
  T data;
  BlocStatus status;
}

enum BlocStatus {
  networkOffline,
  networkPoor,
  networkError,
  loading,
  dataIsNull,
}
