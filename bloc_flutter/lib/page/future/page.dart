import 'dart:convert';
import 'dart:io';
import 'package:bloc_flutter/architecture/utils/logger.dart';
import 'package:flutter/material.dart';

/// @description FuturePage
///
/// @author 燕文强
///
/// @date 2020/7/17

class FuturePage extends StatefulWidget {
  @override
  State createState() => _FutureState();
}

class _FutureState extends State<FuturePage> {
  var futureFetchData;

  @override
  void initState() {
    super.initState();
    futureFetchData = fetchData();
  }

  Future<String> fetchData() async {
    var httpClient = new HttpClient();
    var uri = Uri.parse('http://www.baidu.com');
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    return responseBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("futureBuilder")),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder<String>(
            future: futureFetchData,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              log(snapshot.connectionState);
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('状态：done');
                case ConnectionState.active:
                  return Text('状态：active');
                case ConnectionState.waiting:
                  return Text('状态：waiting');
                case ConnectionState.done:
                  if (snapshot.hasError) return Text('状态：done \n 错误: ${snapshot.error}');
                  return Text('状态：done \n 结果: ${snapshot.data}');
              }
              return null; // unreachable
            },
          ),
        ),);
  }
}
