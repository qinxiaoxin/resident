//
//  MacroUtils.h
//  resident
//
//  Created by Xin Qin on 2/6/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#ifndef resident_MacroUtils_h
#define resident_MacroUtils_h


#endif

#ifdef DEBUG
#define debugLog(...) NSLog(__VA_ARGS__)
#define debugMethod() NSLog(@"%s", __func__)
#else
#define debugLog(...)
#define debugMethod()
#endif

#define EMPTY_STRING        @""

#define STR(key)            NSLocalizedString(key, nil)

#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define SCREEN_HEIGHT   [[UIScreen mainScreen] applicationFrame].size.height
#define SCREEN_WIDTH    [[UIScreen mainScreen] applicationFrame].size.width
#define SYSTEM_VERSION            ([[[UIDevice currentDevice] systemVersion] floatValue])
#define COLOR(r,g,b,a)  [UIColor colorWithRed:(float)r/255.f green:(float)g/255.f blue:(float)b/255.f  alpha:a]

#define NAV_BG_COLOR    [UIColor colorWithRed:90/255.f green:90/255.f blue:66/255.f  alpha:1.f]
#define TVC_BG_COLOR    [UIColor colorWithRed:10/255.f green:15/255.f blue:10/255.f  alpha:1.f]


#define STATUS_BAR_HEIGHT                           20
#define COVER_IMAGE_VIEW_WIDTH                      180
#define COVER_IMAGE_VIEW_HEIGHT                     270
#define BLUR_DEGREE                                 200
#define CHTWITTERCOVERVIEW_HEIGHT                   320

#define DEMO_VIEW_CONTROLLER_PUSH                   FALSE
