//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<kommunicate_flutter/KommunicateFlutterPlugin.h>)
#import <kommunicate_flutter/KommunicateFlutterPlugin.h>
#else
@import kommunicate_flutter;
#endif

#if __has_include(<url_launcher_ios/FLTURLLauncherPlugin.h>)
#import <url_launcher_ios/FLTURLLauncherPlugin.h>
#else
@import url_launcher_ios;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [KommunicateFlutterPlugin registerWithRegistrar:[registry registrarForPlugin:@"KommunicateFlutterPlugin"]];
  [FLTURLLauncherPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTURLLauncherPlugin"]];
}

@end
