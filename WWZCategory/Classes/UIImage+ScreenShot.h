//
//  UIImage+ScreenShot.h
//  CosBeauty
//
//  Created by Donny2g Hu on 15/7/15.
//  Copyright (c) 2015年 Donny2g Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ScreenShot)

+ (UIImage *)takeScreenshot;
+ (UIImage *)takeViewShot:(UIView *)view;
@end
