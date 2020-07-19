import 'dart:async';
import 'package:bloc_flutter/architecture/net/utils/logger.dart';
import 'package:bloc_flutter/architecture/stream/state_bo.dart';

import 'deliver.dart';
import 'network/api.dart';
import 'network/requester.dart';

/// @description Observable
///
/// @author 燕文强
///
/// @date 2019-12-30
class Observable<S extends Api, T> {
  final StreamController<S> streamController = StreamController<S>();

  Stream<StateBo<T>> stream;

  StreamTransformer<S, StateBo<T>> _transformer;
  final S api;
  Deliver deliver;
  Function() _onSubscribe;
  Function() _onCompleted;

  Observable({this.api, this.deliver}) {
    _transformer = StreamTransformer<S, StateBo<T>>.fromHandlers(handleData: (value, sink) {
      Request(
          api: value,
          onStart: (api) {
            sink.add(StateBo.loading());
            _onSubscribe();
          },
          onSuccess: (response) {
            _onCompleted();
            sink.add(StateBo<T>(response.data));
            deliver.applySuccess<StateBo<T>>(sink, response);
          },
          onFail: (response) {
            _onCompleted();
            sink.add(StateBo.networkFail());
            deliver.applyFail<StateBo<T>>(sink, response);
          },
          onError: (error) {
            _onCompleted();
            sink.add(StateBo.error());
            deliver.applyError<StateBo<T>>(sink, error);
          },
          onCatchError: (error) {
            _onCompleted();
            sink.add(StateBo.error());
            deliver.applyCatchError<StateBo<T>>(sink, error);
          });
    });
    stream = compose();
  }

  Stream<StateBo<T>> compose() {
    return streamController.stream.transform(_transformer);
  }

  void subscribe({void Function() onSubscribe, void Function() onCompleted}) {
    assert(_transformer == null, '_transformer cannot be empty');
    if (deliver == null) {
      deliver = ApiDeliver();
    }
    _onSubscribe = onSubscribe;
    _onCompleted = onCompleted;
    streamController.add(api);
  }

  void close() {
    streamController.close();
  }
}
