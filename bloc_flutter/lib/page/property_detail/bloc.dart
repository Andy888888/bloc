import 'package:bloc_flutter/app_base/apluspro_page.dart';
import 'package:bloc_flutter/architecture/stream/request_stream_controller.dart';
import 'package:bloc_flutter/repository/apluspro_api.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/19

class PropertyDetailBloc extends APlusBloc {
  RequestStreamController<APlusProApi, List<String>> requestStreamController;

//  PropertyDetailBloc() {
//    requestStreamController = RequestStreamController<APlusProApi, String>(
//      APlusProApi(),
//      onStart: () {},
//      onCompleted: () {},
//    );
//  }

  void propertyDetail() {
    requestStreamController = RequestStreamController<APlusProApi, List<String>>(
      APlusProApi(),
      onStart: () {},
      onCompleted: () {},
    );
  }

  @override
  void dispose() {
    requestStreamController.close();
  }

  @override
  void retry() {
    // TODO: implement retry
  }
}
