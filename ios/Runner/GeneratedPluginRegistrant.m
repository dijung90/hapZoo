//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<flutter_naver_login/FlutterNaverLoginPlugin.h>)
#import <flutter_naver_login/FlutterNaverLoginPlugin.h>
#else
@import flutter_naver_login;
#endif

#if __has_include(<google_sign_in/FLTGoogleSignInPlugin.h>)
#import <google_sign_in/FLTGoogleSignInPlugin.h>
#else
@import google_sign_in;
#endif

#if __has_include(<kakao_flutter_sdk_common/KakaoFlutterSdkPlugin.h>)
#import <kakao_flutter_sdk_common/KakaoFlutterSdkPlugin.h>
#else
@import kakao_flutter_sdk_common;
#endif

#if __has_include(<package_info_plus/FLTPackageInfoPlusPlugin.h>)
#import <package_info_plus/FLTPackageInfoPlusPlugin.h>
#else
@import package_info_plus;
#endif

#if __has_include(<shared_preferences_ios/FLTSharedPreferencesPlugin.h>)
#import <shared_preferences_ios/FLTSharedPreferencesPlugin.h>
#else
@import shared_preferences_ios;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FlutterNaverLoginPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterNaverLoginPlugin"]];
  [FLTGoogleSignInPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTGoogleSignInPlugin"]];
  [KakaoFlutterSdkPlugin registerWithRegistrar:[registry registrarForPlugin:@"KakaoFlutterSdkPlugin"]];
  [FLTPackageInfoPlusPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPackageInfoPlusPlugin"]];
  [FLTSharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharedPreferencesPlugin"]];
}

@end
