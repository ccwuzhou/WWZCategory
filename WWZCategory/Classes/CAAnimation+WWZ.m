//
//  CAAnimation+WWZ.m
//  ZCCarOwner
//
//  Created by apple on 2017/8/17.
//  Copyright © 2017年 zhichekeji. All rights reserved.
//

#import "CAAnimation+WWZ.h"

@implementation CAAnimation (WWZ)

/**
 *  永久闪烁的动画
 */
+ (CABasicAnimation *)wwz_opacityForeverAnimationWithDuration:(CFTimeInterval)duration{
    return [self wwz_opacityAnimationFromValue:1.0 toValue:0.0 drution:duration repeatCount:FLT_MAX autoreverses:YES];
}

/**
 *  透明度动画
 */
+ (CABasicAnimation *)wwz_opacityAnimationFromValue:(CGFloat)fromValue toValue:(CGFloat)toValue drution:(CFTimeInterval)duration repeatCount:(float)repeatCount autoreverses:(BOOL)autoreverses{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = [NSNumber numberWithFloat:fromValue];
    animation.toValue = [NSNumber numberWithFloat:toValue];
    animation.duration = duration;
    animation.autoreverses = autoreverses;
    animation.repeatCount = repeatCount;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    return animation;
}

@end
