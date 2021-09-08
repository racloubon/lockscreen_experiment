#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "FlutterLockscreenCheckPlugin.h"

FOUNDATION_EXPORT double flutter_lockscreen_checkVersionNumber;
FOUNDATION_EXPORT const unsigned char flutter_lockscreen_checkVersionString[];

