import 'dart:async';

import 'package:flutter/services.dart';

class FlutterLibPlugin {
  static const MethodChannel _channel = const MethodChannel('flutterlib');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static log(String message) {
    _channel.invokeMethod("log", {"message": message});
  }
}
