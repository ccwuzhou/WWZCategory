//
//  CALayer+WWZ.m
//  wwz_objc
//
//  Created by wwz on 17/3/6.
//  Copyright © 2017年 tijio. All rights reserved.
//

#import "CALayer+WWZ.h"

@implementation CALayer (WWZ)
/**
 *  设置圆角半径
 */
- (void)wwz_setCornerRadius:(CGFloat)radius{
    [self wwz_setCornerRadius:radius borderWidth:0 borderColor:[UIColor blackColor]];
}

/**
 *  设置圆形描边
 */
- (void)wwz_setMasksBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor{
    [self wwz_setCornerRadius:MIN(self.frame.size.width, self.frame.size.height)*0.5 borderWidth:borderWidth borderColor:borderColor];
}

/**
 *  设置描边
 */
- (void)wwz_setCornerRadius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor{
    self.masksToBounds = YES;
    self.cornerRadius = radius;
    self.borderWidth = borderWidth;
    self.borderColor = borderColor.CGColor;
}

/**
 *  设置阴影
 */
- (void)wwz_setShadowWithColor:(UIColor *)shadowColor offset:(CGSize)offset{
    [self wwz_setShadowWithColor:shadowColor offset:offset radius:0 opacity:1];
}

/**
 *  设置阴影
 */
- (void)wwz_setShadowWithColor:(UIColor *)shadowColor offset:(CGSize)offset radius:(CGFloat)radius opacity:(CGFloat)opacity{
    self.shadowColor = [shadowColor CGColor];
    self.shadowOffset = offset;
    self.shadowOpacity = opacity;
    self.shadowRadius = radius;
}

/**
 绘制渐变层
 */
- (void)wwz_drawGradientLayerWithColors:(NSArray *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    gradientLayer.colors = colors;
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    [self insertSublayer:gradientLayer atIndex:0];
}

@end
