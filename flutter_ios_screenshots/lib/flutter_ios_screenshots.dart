import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/services.dart';

///平台信道
final MethodChannel _channel = const MethodChannel('flutter_ios_screenshots');

///监测截屏回调
typedef endResultCallBack = Function(Uint8List endResult);

///类
class FlutterIosScreenshots {
  ///监测原生
  static listeningPlatform(endResultCallBack endResultCall) {
    _channel.setMethodCallHandler((call) {
      if (call.method == "iosEndScreenshots") {
        Map map = call.arguments;
        Uint8List result = map["image"];
        endResultCall(result);
      }
      return null;
    });
  }

  ///开始截屏
  static Future<Uint8List> get iosStartScreenshots async {
    final Uint8List startResult =
        await _channel.invokeMethod('iosStartScreenshots');
    return startResult;
  }
}
