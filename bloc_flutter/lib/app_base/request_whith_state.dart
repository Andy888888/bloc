import 'package:dio/dio.dart';
import 'package:stark/network/network.dart';
import 'package:stark/network/utils/logger.dart';
import 'package:stark/stream/state_bo.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/21
class RequestWithState<S extends Api<T>, T extends StatusModel> {
  void send(S api,
      {Function(S api) onStart, Function onCompleted, Function(StateBo<T> data) onSuccess, Function(StateBo<T> data) onFail}) {
    Request<T>(
      api: api,
      onStart: (api) {
        if (onStart != null) onStart(api);
      },
      onSuccess: (response) {
        if (onCompleted != null) onCompleted();
        onSuccess(StateBo<T>(response.data));
      },
      onFail: (response) {
        if (onCompleted != null) onCompleted();
        onFail(StateBo.businessFail(code: 120, message: response.data.toString()));
      },
      onError: (error) {
        if (onCompleted != null) onCompleted();
        if (error.runtimeType is DioError) {
          DioError dioError = error;
          int statusCode = dioError.response.statusCode + 1000;
          Net.logFormat('request error status code:$statusCode');
          onFail(StateBo.networkFail(code: statusCode));
        } else {
          Net.logFormat('request error:${error.toString()}');
          onFail(StateBo.networkFail(code: 119, message: error.toString()));
        }
      },
      onCatchError: (error) {
        if (onCompleted != null) onCompleted();
        Net.logFormat('catch error:${error.toString()}');
        if (error.runtimeType is CastError) {
          onFail(StateBo.error(code: 110, message: error.toString()));
        }
        onFail(StateBo.error());
      },
    );
  }
}

class StatusModel {
  int code;
  String message;
}

class MyModel extends StatusModel {}

class MyApi extends Api<MyModel> {
  @override
  bool state(MyModel obj) {
    return obj.code == 200;
  }
}
