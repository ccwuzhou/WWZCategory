//
//  UIImage+ScreenShot.m
//  CosBeauty
//
//  Created by Donny2g Hu on 15/7/15.
//  Copyright (c) 2015年 Donny2g Hu. All rights reserved.
//

#import "UIImage+ScreenShot.h"

@implementation UIImage (ScreenShot)


+ (UIImage *)takeScreenshot {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
        UIGraphicsBeginImageContextWithOptions(window.bounds.size, NO, [UIScreen mainScreen].scale);
    else
        UIGraphicsBeginImageContext(window.bounds.size);
    
    [window.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)takeViewShot:(UIView *)view
{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, [UIScreen mainScreen].scale);
    else
        UIGraphicsBeginImageContext(view.bounds.size);
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


@end
