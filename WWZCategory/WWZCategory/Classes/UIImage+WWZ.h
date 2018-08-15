//
//  UIImage+WWZ.h
//  ZCCarOwner
//
//  Created by apple on 2017/9/22.
//  Copyright © 2017年 zhichekeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WWZ)

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
