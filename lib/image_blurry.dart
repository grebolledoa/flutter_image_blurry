import 'dart:async';

import 'package:flutter/services.dart';

class ImageBlurry {
  static const MethodChannel _channel = const MethodChannel('image_blurry');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<bool> isImageBlurry(String imagepath) async {
    final int result = await _channel
        .invokeMethod('isImageBlurry', {'filePath': imagepath});
    if (result == 1) {
      return true;
    } else if (result == -1) {
      throw ('image not found');
    } else {
      return false;
    }
  }
}
