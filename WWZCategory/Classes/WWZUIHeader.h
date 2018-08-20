//
//  WWZUIHeader.h
//  Pods
//
//  Created by apple on 2018/2/28.
//

#ifndef WWZUIHeader_h
#define WWZUIHeader_h

#define WWZColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define WWZColorFromRGBA(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF000000) >> 24))/255.0 \
green:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
blue:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
alpha:((float)(rgbValue & 0xFF))/255.0]

#define WWZ_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define WWZ_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define WWZ_NAV_BAR_HEIGHT (WWZ_SCREEN_HEIGHT == 812.0 ? 88 : 64)
#define WWZ_STATUS_HEIGHT (WWZ_SCREEN_HEIGHT == 812.0 ? 44 : 20)
#define WWZ_TAB_BAR_HEIGHT 49
#define WWZ_SAFE_AREA_BOTTOM_HEIGHT (WWZ_SCREEN_HEIGHT == 812.0 ? 34 : 0)

static float const WWZ_4_SCREEN_HEIGHT = 568.0;
static float const WWZ_47_SCREEN_HEIGHT = 667.0;
static float const WWZ_55_SCREEN_HEIGHT = 736.0;
static float const WWZ_58_SCREEN_HEIGHT = 812.0;

#endif /* WWZUIHeader_h */
