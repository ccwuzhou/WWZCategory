//
//  UIView+Show.h
//  ZCCarOwner
//
//  Created by apple on 2017/6/30.
//  Copyright © 2017年 zhichekeji. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, WWZShowViewAnimateType) {
    WWZShowViewAnimateTypeAlpha,         // 透明度
    WWZShowViewAnimateTypeFromTop,      // 从上面弹出
    WWZShowViewAnimateTypeFromLeft,     // 从左面弹出
    WWZShowViewAnimateTypeFromBottom,   // 从下面弹出
    WWZShowViewAnimateTypeFromRight     // 从右面弹出
};

@interface UIView (Show)

- (void)wwz_showWithAnimateType:(WWZShowViewAnimateType)animateType;
- (void)wwz_showWithAnimateType:(WWZShowViewAnimateType)animateType dismissTapEnable:(BOOL)enable;
- (void)wwz_showWithAnimateType:(WWZShowViewAnimateType)animateType dismissTapEnable:(BOOL)enable bgColor:(UIColor *)bgColor;
- (void)wwz_dismiss;

@end
