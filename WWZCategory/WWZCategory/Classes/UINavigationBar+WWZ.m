//
//  UINavigationBar+WWZ.m
//  ZCCarOwner
//
//  Created by apple on 2017/7/4.
//  Copyright © 2017年 zhichekeji. All rights reserved.
//

#import "UINavigationBar+WWZ.h"
#import <objc/runtime.h>

static NSString *const WWZ_NAVBAR_OVERLAY_KEY = @"WWZ_NAVBAR_OVERLAY_KEY";

@implementation UINavigationBar (WWZ)

/**
 *  设置背景颜色
 */
- (void)wwz_setBackgroundColor:(UIColor *)color{
    if (!self.wwz_overlay) {
        [self setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
        CGFloat overlayHeight = [UIScreen mainScreen].bounds.size.height == 812.0 ? 88 : 64;
        self.wwz_overlay = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width,overlayHeight)];
        self.wwz_overlay.userInteractionEnabled = NO;
        self.wwz_overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    }
    self.wwz_overlay.backgroundColor = color;
    [self.subviews.firstObject insertSubview:self.wwz_overlay atIndex:0];
}

/**
 *  是否隐藏下面线
 */
- (void)wwz_setShadowImage:(BOOL)isHidden{
    UIImageView *lineImageView = [self wwz_findNavLineImageViewOnView:self];
    lineImageView.hidden = isHidden;
}

#pragma mark - 私有方法
- (UIImageView *)wwz_findNavLineImageViewOnView:(UIView *)view{
    if ([view isKindOfClass:[UIImageView class]] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subView in view.subviews) {
        UIImageView *imageView = [self wwz_findNavLineImageViewOnView:subView];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}


- (UIView *)wwz_overlay{
    return objc_getAssociatedObject(self, &WWZ_NAVBAR_OVERLAY_KEY);
}

- (void)setWwz_overlay:(UIView *)wwz_overlay{
    objc_setAssociatedObject(self, &WWZ_NAVBAR_OVERLAY_KEY, wwz_overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
