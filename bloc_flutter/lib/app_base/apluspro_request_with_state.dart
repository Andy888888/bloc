import 'package:dio/dio.dart';
import 'package:stark/network/network.dart';
import 'package:stark/network/state_bo.dart';
import 'package:stark/network/utils/logger.dart';
import 'package:stark/stark.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/21
class APlusProRequestWithState<S, T> extends AbsRequestWithState<S, T> {
  @override
  void send(
    Api<S, T> api, {
    Function(Api<S, T> api) onStart,
    Function onCompleted,
    Function(StateBo<T> data) onSuccess,
    Function(StateBo<T> data) onFail,
  }) {
    Request<S, T>(
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
        int code = response.metadata.data['Flag'];
        String message = response.metadata.data['Message'];
        onFail(StateBo.businessFail(code: code, message: message));
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

test() {
  APlusProRequestWithState<String, _ResponseModel>().send(
    _MyApi.webContent(),
    onSuccess: (data) {
      log(data.data.result);
    },
    onFail: (data) {
      logFormat('code:${data.code}，message:${data.message}');
    },
  );
}

class _ResponseModel {
  int code;
  String message;
  String result;
}

class _MyApi<S, T> extends Api<S, T> {
  @override
  bool state(dynamic obj) {
    return obj['code'] == 200;
  }

  static _MyApi<String, _ResponseModel> webContent() => _MyApi<String, _ResponseModel>()
    ..method = Method.GET
    ..dataConvert = (data) {
      return _ResponseModel();
    };
}
