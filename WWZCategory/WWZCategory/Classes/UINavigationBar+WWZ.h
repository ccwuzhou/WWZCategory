//
//  UINavigationBar+WWZ.h
//  ZCCarOwner
//
//  Created by apple on 2017/7/4.
//  Copyright © 2017年 zhichekeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (WWZ)

@property (nonatomic, strong) UIView *wwz_overlay;

/**
 *  设置背景颜色
 */
- (void)wwz_setBackgroundColor:(UIColor *)color;

/**
 *  是否隐藏下面线
 */
- (void)wwz_setShadowImage:(BOOL)isHidden;

@end
