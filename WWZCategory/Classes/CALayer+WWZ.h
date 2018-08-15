//
//  CALayer+WWZ.h
//  wwz_objc
//
//  Created by wwz on 17/3/6.
//  Copyright © 2017年 tijio. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
@interface CALayer (WWZ)

/**
 *  设置圆角半径
 */
- (void)wwz_setCornerRadius:(CGFloat)radius;

/**
 *  设置圆形描边
 */
- (void)wwz_setMasksBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/**
 *  设置描边
 */
- (void)wwz_setCornerRadius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/**
 绘制渐变层
 */
- (void)wwz_drawGradientLayerWithColors:(NSArray *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;
@end
