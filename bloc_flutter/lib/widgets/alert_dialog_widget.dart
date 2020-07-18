import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 屏幕宽度
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
// 屏幕高度
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
// 屏幕适配的比例，按照iPhone6s的屏幕为基础
double ratio(BuildContext context) => MediaQuery.of(context).size.width / 375.0;

fontSize18(BuildContext context) => 18 * ratio(context);

fontSize16(BuildContext context) => 16 * ratio(context);

color0xFF060E1D() => Color(0xFF060E1D);

color0xFF666666() => Color(0xFF666666);

color0xFF2A3137() => Color(0xFF2A3137);

color0xFFFF3333() => Color(0xFFFF3333);

/// @description AlertDialogWidget
///
/// @author 燕文强
///
/// @date 2020/7/15
class AlertDialogWidget {
  // 上下文
  final BuildContext context;

  // title
  final String title;

  // 内容
  final String content;

  // 左按钮文本
  final String leftButtonText;

  // 右按钮文本
  final String rightButtonText;

  // // 取消响应
  // final Function leftButtonResponse;
  // // 确定响应
  // final Function rightButtonResponse;
  // 左按钮响应
  final Function leftButtonResponse;
  final Function leftClick;

  // 右按钮响应
  final Function rightButtonResponse;
  final Function rightClick;

  // 障碍可解雇的
  final bool barrierDismissible;

  // 强制，永远不可以取消
  final bool isCompulsory;

  final bool canUpdate;

  StreamController<AlertBuilder> _streamController = StreamController<AlertBuilder>();

  // // 点击内部区域是否消失
  // final bool onTapInside;
  stream() {
    _streamController = StreamController<AlertBuilder>();
  }

  dispose() {
    _streamController.close();
  }

  update(AlertBuilder builder) {
    _streamController.add(builder);
  }

  AlertDialogWidget({
    @required this.context,
    this.content,
    this.title,
    this.leftButtonText,
    this.rightButtonText,
    this.leftButtonResponse,
    this.leftClick,
    this.rightButtonResponse,
    this.rightClick,
    this.barrierDismissible = true,
    this.isCompulsory = false,
    this.canUpdate = false,
  }) {
    showGeneralDialog(
      context: context,
      barrierLabel: "弹窗提示",
      barrierDismissible: false,
      transitionDuration: Duration(milliseconds: 1),
      pageBuilder: (
        BuildContext context,
        Animation animation,
        Animation secondaryAnimation,
      ) {
        AlertBuilder alertBuilder = AlertBuilder(
          context,
          title,
          content,
          leftButtonText,
          rightButtonText,
          leftButtonResponse,
          leftClick,
          rightButtonResponse,
          rightClick,
          barrierDismissible,
          isCompulsory,
        );

        if (!canUpdate) {
          AsyncSnapshot<AlertBuilder> asyncSnapshot = AsyncSnapshot.withData(ConnectionState.done, alertBuilder);
          return view(asyncSnapshot);
        }

        stream();
        return StreamBuilder(
          stream: _streamController.stream,
          initialData: alertBuilder,
          builder: (context, AsyncSnapshot<AlertBuilder> snapshot) {
            return view(snapshot);
          },
        );
      },
    );
  }

  Widget view(AsyncSnapshot<AlertBuilder> snapshot) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: GestureDetector(
        child: Material(
          color: Colors.black.withOpacity(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      10 * ratio(context),
                    ),
                    child: Container(
                      width: screenWidth(context) - 24 * 2 * ratio(context),
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                        left: 24 * ratio(context),
                        right: 24 * ratio(context),
                        bottom: 24 * ratio(context),
                      ),
                      color: Colors.white,
                      child: childWidget(snapshot),
                    ),
                  ),
                  onTap: () {
                    //  if(onTapInside){
                    //    Navigator.of(context).pop();
                    //  }
                  })
            ],
          ),
        ),
        onTap: () {
          if (snapshot.data.barrierDismissible) {
            if (snapshot.data.isCompulsory == false) Navigator.of(context).pop();
          }
        },
      ),
    );
  }

  childWidget(AsyncSnapshot<AlertBuilder> snapshot) {
    if (snapshot.data.title == null &&
        snapshot.data.content == null &&
        snapshot.data.leftButtonResponse == null &&
        snapshot.data.rightButtonResponse == null) {
      // 什么都没有
      return Container();
    } else if ((snapshot.data.title == null && snapshot.data.content != null) ||
        (snapshot.data.title != null && snapshot.data.content == null)) {
      // 只有标题的情况
      if (snapshot.data.leftButtonResponse == null && snapshot.data.rightButtonResponse == null) {
        // 一个按钮都没有
        return Column(
          children: <Widget>[
            onlyTitle(snapshot),
          ],
        );
      } else if (snapshot.data.leftButtonResponse == null && snapshot.data.rightButtonResponse != null) {
        // 只有右部按钮
        return Column(
          children: <Widget>[
            onlyTitle(snapshot),
            onlyRightButton(snapshot),
          ],
        );
      } else if (snapshot.data.leftButtonResponse != null && snapshot.data.rightButtonResponse == null) {
        // 只有左部按钮
        return Column(
          children: <Widget>[
            onlyTitle(snapshot),
            onlyLeftButton(snapshot),
          ],
        );
      } else if (snapshot.data.leftButtonResponse != null && snapshot.data.rightButtonResponse != null) {
        // 有两个按钮
        return Column(
          children: <Widget>[
            onlyTitle(snapshot),
            leftAddRightButton(snapshot),
          ],
        );
      } else {
        // 未知
        return Container();
      }
    } else if (snapshot.data.title != null && snapshot.data.content != null) {
      // 标题加内容
      if (snapshot.data.leftButtonResponse == null && snapshot.data.rightButtonResponse == null) {
        // 一个按钮都没有
        return Column(
          children: <Widget>[
            titleAddContent(snapshot),
          ],
        );
      } else if (snapshot.data.leftButtonResponse == null && snapshot.data.rightButtonResponse != null) {
        // 只有右部按钮
        return Column(
          children: <Widget>[
            titleAddContent(snapshot),
            onlyRightButton(snapshot),
          ],
        );
      } else if (snapshot.data.leftButtonResponse != null && snapshot.data.rightButtonResponse == null) {
        // 只有左部按钮
        return Column(
          children: <Widget>[
            titleAddContent(snapshot),
            onlyLeftButton(snapshot),
          ],
        );
      } else if (snapshot.data.leftButtonResponse != null && snapshot.data.rightButtonResponse != null) {
        // 有两个按钮
        return Column(
          children: <Widget>[
            titleAddContent(snapshot),
            leftAddRightButton(snapshot),
          ],
        );
      } else {
        // 未知
        return Container();
      }
    }
  }

  // 只有标题
  onlyTitle(AsyncSnapshot<AlertBuilder> snapshot) {
    String text = '';
    if (snapshot.data.title == null) {
      text = snapshot.data.content;
    } else {
      text = snapshot.data.title;
    }
    return Container(
      margin: EdgeInsets.only(
        top: 44 * ratio(snapshot.data.context),
        bottom: 44 * ratio(snapshot.data.context),
        left: 24 * ratio(snapshot.data.context),
        right: 24 * ratio(snapshot.data.context),
      ),
      constraints: BoxConstraints(
        maxHeight: screenHeight(snapshot.data.context) - 200 * ratio(snapshot.data.context),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize18(snapshot.data.context),
          color: color0xFF060E1D(),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // 标题加内容
  titleAddContent(AsyncSnapshot<AlertBuilder> snapshot) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 24 * ratio(snapshot.data.context),
            bottom: 16 * ratio(snapshot.data.context),
            left: 24 * ratio(snapshot.data.context),
            right: 24 * ratio(snapshot.data.context),
          ),
          constraints: BoxConstraints(
            maxHeight: screenHeight(snapshot.data.context) - 200 * ratio(snapshot.data.context),
          ),
          child: Text(
            snapshot.data.title ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize18(snapshot.data.context),
              color: color0xFF060E1D(),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            bottom: 24 * ratio(snapshot.data.context),
            left: 24 * ratio(snapshot.data.context),
            right: 24 * ratio(snapshot.data.context),
          ),
          constraints: BoxConstraints(
            maxHeight: screenHeight(snapshot.data.context) - 200 * ratio(snapshot.data.context),
          ),
          child: Text(
            snapshot.data.content ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize16(snapshot.data.context),
              color: color0xFF666666(),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  // 只有左部button
  onlyLeftButton(AsyncSnapshot<AlertBuilder> snapshot) {
    return GestureDetector(
      child: Container(
        child: DecoratedBox(
          position: DecorationPosition.background,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              5 * ratio(snapshot.data.context),
            ),
            color: Colors.white,
            border: Border.all(
              color: color0xFF2A3137(),
              width: 1 * ratio(snapshot.data.context),
            ),
          ),
          child: Container(
            width: 279 * ratio(snapshot.data.context),
            height: 44 * ratio(snapshot.data.context),
            alignment: Alignment.center,
            child: Center(
              child: Text(
                snapshot.data.leftButtonText ?? '取消',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize18(snapshot.data.context),
                  color: color0xFF060E1D(),
                  // height: 1,
                ),
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        if (snapshot.data.leftClick != null) {
          snapshot.data.leftClick();
          return;
        }

        if (snapshot.data.isCompulsory == false) Navigator.of(snapshot.data.context).pop();
        if (snapshot.data.leftButtonResponse != null) {
          snapshot.data.leftButtonResponse();
        }
      },
    );
  }

  // 只有右部button
  onlyRightButton(AsyncSnapshot<AlertBuilder> snapshot) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          5 * ratio(snapshot.data.context),
        ),
        child: Container(
          width: 279 * ratio(snapshot.data.context),
          height: 44 * ratio(snapshot.data.context),
          color: color0xFFFF3333(),
          alignment: Alignment.center,
          child: Center(
            child: Text(
              snapshot.data.rightButtonText ?? '确定',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize18(snapshot.data.context),
                color: Colors.white,
                // height: 1,
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        if (snapshot.data.rightClick != null) {
          snapshot.data.rightClick();
          return;
        }

        if (snapshot.data.isCompulsory == false) Navigator.of(snapshot.data.context).pop();
        if (snapshot.data.rightButtonResponse != null) {
          snapshot.data.rightButtonResponse();
        }
      },
    );
  }

  // 左右按钮都有
  leftAddRightButton(AsyncSnapshot<AlertBuilder> snapshot) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          child: Container(
            child: DecoratedBox(
              position: DecorationPosition.background,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  5 * ratio(snapshot.data.context),
                ),
                color: Colors.white,
                border: Border.all(
                  color: color0xFF2A3137(),
                  width: 1 * ratio(snapshot.data.context),
                ),
              ),
              child: Container(
                width: 127 * ratio(snapshot.data.context),
                height: 44 * ratio(snapshot.data.context),
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    snapshot.data.leftButtonText ?? '取消',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: fontSize18(snapshot.data.context),
                      color: color0xFF060E1D(),
                      // height: 1,
                    ),
                  ),
                ),
              ),
            ),
          ),
          onTap: () {
            if (snapshot.data.leftClick != null) {
              snapshot.data.leftClick();
              return;
            }

            if (snapshot.data.isCompulsory == false) Navigator.of(snapshot.data.context).pop();
            if (snapshot.data.leftButtonResponse != null) {
              snapshot.data.leftButtonResponse();
            }
          },
        ),
        Container(
          width: 25 * ratio(snapshot.data.context),
        ),
        GestureDetector(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              width: 127 * ratio(snapshot.data.context),
              height: 44 * ratio(snapshot.data.context),
              color: color0xFFFF3333(),
              alignment: Alignment.center,
              child: Center(
                child: Text(
                  snapshot.data.rightButtonText ?? '确定',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: fontSize18(snapshot.data.context),
                    color: Colors.white,
                    // height: 1,
                  ),
                ),
              ),
            ),
          ),
          onTap: () {
            if (snapshot.data.rightClick != null) {
              snapshot.data.rightClick();
              return;
            }
            if (snapshot.data.isCompulsory == false) Navigator.of(snapshot.data.context).pop();
            if (snapshot.data.rightButtonResponse != null) {
              snapshot.data.rightButtonResponse();
            }
          },
        ),
      ],
    );
  }
}

class AlertBuilder {
  BuildContext context;

  // title
  String title;

  // 内容
  String content;

  // 左按钮文本
  String leftButtonText;

  // 右按钮文本
  String rightButtonText;

  // // 取消响应
  // final Function leftButtonResponse;
  // // 确定响应
  // final Function rightButtonResponse;
  // 左按钮响应
  Function leftButtonResponse;
  Function leftClick;

  // 右按钮响应
  Function rightButtonResponse;
  Function rightClick;

  // 障碍可解雇的
  bool barrierDismissible;

  // 强制，永远不可以取消
  bool isCompulsory;

  AlertBuilder.create({
    @required this.context,
    this.title,
    this.content,
    this.leftButtonText,
    this.rightButtonText,
    this.leftButtonResponse,
    this.leftClick,
    this.rightButtonResponse,
    this.rightClick,
    this.barrierDismissible,
    this.isCompulsory,
  }) {
    if (leftClick != null) {
      leftButtonResponse = leftClick;
    }
    if (rightClick != null) {
      rightButtonResponse = rightClick;
    }
  }

  AlertBuilder(
    this.context,
    this.title,
    this.content,
    this.leftButtonText,
    this.rightButtonText,
    this.leftButtonResponse,
    this.leftClick,
    this.rightButtonResponse,
    this.rightClick,
    this.barrierDismissible,
    this.isCompulsory,
  );
}

// ----------------------------

class AlertDialogWidget3 {
  // 上下文
  final BuildContext context;

  // 标题
  final String title;

  // 内容
  final String content;

  // 按钮内容
  final List<String> buttonTextList;

  // 按钮回调
  final Function(int index, String text) response;

  AlertDialogWidget3({
    @required this.context,
    this.title,
    this.content,
    @required this.buttonTextList,
    @required this.response,
  }) {
    if (buttonTextList == null || buttonTextList.length == 0) {
      return;
    }
    showDialog<bool>(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: title == null
              ? null
              : Text(
                  title,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
          content: content == null
              ? null
              : Text(
                  content,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
          actions: buttonWidget(),
        );
      },
    );
  }

  buttonWidget() {
    List list = List<CupertinoDialogAction>();
    for (int i = 0; i < buttonTextList.length; i++) {
      CupertinoDialogAction cda = CupertinoDialogAction(
        child: Text(
          buttonTextList[i] ?? '',
          style: TextStyle(
            fontSize: 17,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
          if (response != null) {
            response(i, buttonTextList[i] ?? '');
          }
        },
      );
      list.add(cda);
    }

    return list;
  }
}
