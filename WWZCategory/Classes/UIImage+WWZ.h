//
//  UIImage+WWZ.h
//  ZCCarOwner
//
//  Created by apple on 2017/9/22.
//  Copyright © 2017年 zhichekeji. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, GradientType) {
    topToBottom = 0,//从上到小
    leftToRight = 1,//从左到右
    upleftTolowRight = 2,//左上到右下
    uprightTolowLeft = 3,//右上到左下
};

@interface UIImage (WWZ)

+ (instancetype)wwz_imageWithImage:(UIImage *)image size:(CGSize)size;
/**
 *  由二维码生成图片
 */
+ (instancetype)wwz_imageWithQRCode:(NSString *)qrcode size:(CGSize)size;
/**
 *  从图片中获取url
 */
+ (NSString *)wwz_imageMessageString:(UIImage *)image;

+ (instancetype)wwz_imageWithColor:(UIColor *)color size:(CGSize)size alpha:(float)alpha;
/**
 获取矩形的渐变色的UIImage
 */
+ (instancetype)wwz_gradientImageWithSize:(CGSize)size colors:(NSArray *)colors gradientType:(GradientType)gradientType;

+ (instancetype)wwz_imageWithImage:(UIImage *)image angle:(CGFloat )angle;

+ (instancetype)wwz_annotationImageWithImage:(UIImage *)image bgColor:(UIColor *)bgColor;
/**
 压缩图片
 */
- (UIImage *)wwz_compressedImageToMaxFileSize:(NSInteger)maxFileSize;

/**
 压缩图片
 */
- (NSData *)wwz_compressedDataToMaxFileSize:(NSInteger)maxFileSize;

/**
 *  通过图片Data数据第一个字节 来获取图片扩展名
 *
 *  @param data image data
 *
 *  @return image type
 */
+ (NSString *)wwz_contentTypeForImageData:(NSData *)data;
@end
