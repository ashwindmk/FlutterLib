#import "FlutterLibPlugin.h"
#import <IosLib/IosLib.h>

@implementation FlutterLibPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutterlib"
            binaryMessenger:[registrar messenger]];
  FlutterLibPlugin* instance = [[FlutterLibPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"log" isEqualToString:call.method]) {
      NSDictionary* map = call.arguments;
      NSString* message = map[@"message"];
      [IosLib log:message];
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
