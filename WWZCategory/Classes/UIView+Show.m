//
//  UIView+ZCTShow.m
//  ZCCarOwner
//
//  Created by apple on 2017/6/30.
//  Copyright © 2017年 zhichekeji. All rights reserved.
//

#import "UIView+Show.h"

@implementation UIView (Show)

static WWZShowViewAnimateType _showViewAnimateType = WWZShowViewAnimateTypeAlpha;

- (void)wwz_showWithAnimateType:(WWZShowViewAnimateType)animateType{
    
    [self wwz_showWithAnimateType:animateType dismissTapEnable:NO];
}

- (void)wwz_showWithAnimateType:(WWZShowViewAnimateType)animateType dismissTapEnable:(BOOL)enable{
    [self wwz_showWithAnimateType:animateType dismissTapEnable:enable bgColor:[UIColor colorWithWhite:0 alpha:0.4]];
}

- (void)wwz_showWithAnimateType:(WWZShowViewAnimateType)animateType dismissTapEnable:(BOOL)enable bgColor:(UIColor *)bgColor{
    _showViewAnimateType = animateType;
    // 背景view
    UIButton *containButton = [[UIButton alloc] initWithFrame:[UIScreen mainScreen].bounds];
    containButton.backgroundColor = bgColor;
    if (enable) {
        [containButton addTarget:self action:@selector(wwz_dismiss) forControlEvents:UIControlEventTouchUpInside];
    }
    [containButton addSubview:self];
    // 添加到window
    [[UIApplication sharedApplication].keyWindow addSubview:containButton];
    containButton.alpha = 0;
    [self p_originalTransform:animateType];
    [UIView animateWithDuration:0.3
                     animations:^{
                         [self p_endTransform:animateType];
                     }
                     completion:nil];
}

- (void)wwz_dismiss{
    [UIView animateWithDuration:0.3
                     animations:^{
                         [self p_originalTransform:_showViewAnimateType];
                     }
                     completion:^(BOOL finished) {
                         [self.superview removeFromSuperview];
                         [self removeFromSuperview];
                     }];
}

#pragma mark - 私有方法
- (void)p_originalTransform:(WWZShowViewAnimateType)animateType{
    
    self.superview.alpha = 0.0;
    
    switch (animateType) {
        case WWZShowViewAnimateTypeAlpha:
            self.alpha = 0.0;
            break;
        case WWZShowViewAnimateTypeFromTop:
            self.transform = CGAffineTransformMakeTranslation(0, -self.frame.size.height);
            break;
        case WWZShowViewAnimateTypeFromLeft:
            self.transform = CGAffineTransformMakeTranslation(-self.frame.size.width, 0);
            break;
        case WWZShowViewAnimateTypeFromBottom:
            self.transform = CGAffineTransformMakeTranslation(0, self.superview.frame.size.height);
            break;
        case WWZShowViewAnimateTypeFromRight:
            self.transform = CGAffineTransformMakeTranslation(self.superview.frame.size.width, 0);
            break;
        default:
            break;
    }
}

- (void)p_endTransform:(WWZShowViewAnimateType)animateType{
    
    self.superview.alpha = 1.0;
    
    switch (animateType) {
        case WWZShowViewAnimateTypeAlpha:
            self.alpha = 1.0;
            break;
        default:
            self.transform = CGAffineTransformIdentity;
            break;
    }
}

@end
