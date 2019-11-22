package com.grebolledoa.image_blurry;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** ImageBlurryPlugin */
public class ImageBlurryPlugin implements MethodCallHandler {
  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "image_blurry");
    channel.setMethodCallHandler(new ImageBlurryPlugin());
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE); }
    else if(call.method.equals("isImageBlurry")) {
      result.success(ImageBlur.isBlur((String)call.argument("filePath")));
    } else {
      result.notImplemented();
    }
  }
}
