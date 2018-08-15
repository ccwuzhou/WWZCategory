//
//  WWZUIHeader.h
//  Pods
//
//  Created by apple on 2018/2/28.
//

#ifndef WWZUIHeader_h
#define WWZUIHeader_h

#define ZCTColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define ZCTColorFromRGBA(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF000000) >> 24))/255.0 \
green:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
blue:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
alpha:((float)(rgbValue & 0xFF))/255.0]

#define ZCT_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define ZCT_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define ZCT_4_SCREEN_HEIGHT 568.0
#define ZCT_47_SCREEN_HEIGHT 667.0
#define ZCT_55_SCREEN_HEIGHT 736.0
#define ZCT_58_SCREEN_HEIGHT 812.0

#define ZCT_NAV_BAR_HEIGHT (ZCT_SCREEN_HEIGHT == 812.0 ? 88 : 64)
#define ZCT_STATUS_HEIGHT (ZCT_SCREEN_HEIGHT == 812.0 ? 44 : 20)
#define ZCT_TAB_BAR_HEIGHT 49
#define ZCT_SAFE_AREA_BOTTOM_HEIGHT (ZCT_SCREEN_HEIGHT == 812.0 ? 34 : 0)

#endif /* WWZUIHeader_h */
