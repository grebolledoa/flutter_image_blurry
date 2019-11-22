#import "ImageBlurryPlugin.h"
#import "OpenCVWrapper.h"

@implementation ImageBlurryPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"image_blurry"
            binaryMessenger:[registrar messenger]];
  ImageBlurryPlugin* instance = [[ImageBlurryPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"Hola iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"isImageBlurry" isEqualToString:call.method]) {
      NSString * path = call.arguments[@"filePath"];
      result([OpenCVWrapper isImageBlurry: path]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
