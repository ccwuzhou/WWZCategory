//
//  UIImage+ImageEffects.h
//  CosBeauty
//
//  Created by Donny2g Hu on 15/7/15.
//  Copyright (c) 2015年 Donny2g Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Effect)
- (UIImage *)applyLightEffect;
- (UIImage *)applyExtraLightEffect;
- (UIImage *)applyDarkEffect;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;

- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;

@end
