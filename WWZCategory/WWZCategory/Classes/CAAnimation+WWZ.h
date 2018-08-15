//
//  CAAnimation+WWZ.h
//  ZCCarOwner
//
//  Created by apple on 2017/8/17.
//  Copyright © 2017年 zhichekeji. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CAAnimation (WWZ)
/**
 *  永久闪烁的动画
 */
+ (CABasicAnimation *)wwz_opacityForeverAnimationWithDuration:(CFTimeInterval)duration;

/**
 *  透明度动画
 */
+ (CABasicAnimation *)wwz_opacityAnimationFromValue:(CGFloat)fromValue toValue:(CGFloat)toValue drution:(CFTimeInterval)duration repeatCount:(float)repeatCount autoreverses:(BOOL)autoreverses;
@end
