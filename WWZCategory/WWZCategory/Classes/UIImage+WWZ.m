//
//  UIImage+WWZ.m
//  ZCCarOwner
//
//  Created by apple on 2017/9/22.
//  Copyright © 2017年 zhichekeji. All rights reserved.
//

#import "UIImage+WWZ.h"

@implementation UIImage (WWZ)

+ (instancetype)wwz_imageWithImage:(UIImage *)image angle:(CGFloat )angle{
    CGSize size = image.size;
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    //2. 获取上下文
    UIGraphicsGetCurrentContext();
    //3. 画圆
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.width*0.5, size.height*0.5) radius:sqrtf(size.width*0.5*size.width*0.5 + size.height*0.5*size.height*0.5) startAngle:M_PI_2 endAngle:M_PI_2+angle clockwise:YES];
    [bezierPath addLineToPoint:CGPointMake(size.width*0.5, size.height*0.5)];
    
    bezierPath.lineWidth = 0;
    [bezierPath closePath];
    
    [bezierPath stroke];
    //4. 使用BezierPath进行剪切
    [bezierPath addClip];
    //5. 画图
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    //6. 从内存中创建新图片对象
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //7. 结束图片上下文
    UIGraphicsEndImageContext();
    return newImage;
}

+ (instancetype)wwz_annotationImageWithImage:(UIImage *)image bgColor:(UIColor *)bgColor{
    
    CGSize size = CGSizeMake(36, 47);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    UIGraphicsGetCurrentContext();
    // 底图
    UIBezierPath *bezierPath1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.width*0.5, size.width*0.5) radius:size.width*0.5 startAngle:53*M_PI/180+M_PI_2 endAngle:M_PI*2+M_PI_2-53*M_PI/180 clockwise:YES];
    [bezierPath1 addLineToPoint:CGPointMake(size.width*0.5, size.height)];
    bezierPath1.lineWidth = 0;
    [bezierPath1 closePath];
    [bgColor setFill];
    [bezierPath1 fill];
    // image
    UIBezierPath *bezierPath2 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.width*0.5, size.width*0.5) radius:size.width*0.5-3 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    bezierPath2.lineWidth = 0;
    [bezierPath2 stroke];
    [bezierPath2 addClip];
    //5. 画图
    [image drawInRect:CGRectMake(3, 3, size.width-6, size.width-6)];
    //6. 从内存中创建新图片对象
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //7. 结束图片上下文
    UIGraphicsEndImageContext();
    return newImage;
}


- (UIImage *)wwz_compressedImageToMaxFileSize:(NSInteger)maxFileSize{
    return [UIImage imageWithData:[self wwz_compressedDataToMaxFileSize:maxFileSize]];
}

- (NSData *)wwz_compressedDataToMaxFileSize:(NSInteger)maxFileSize{
    CGFloat compression = 0.9f;
    CGFloat maxCompression = 0.1f;
    
    NSData *imageData = UIImageJPEGRepresentation(self, compression);
    
    while ([imageData length] > maxFileSize && compression > maxCompression) {
        compression -= 0.1;
        imageData = UIImageJPEGRepresentation(self, compression);
    }
    return imageData;
}
#pragma mark - 图片扩展名
/**
 *  通过图片Data数据第一个字节 来获取图片扩展名
 *
 *  @param data image data
 *
 *  @return image type
 */
+ (NSString *)wwz_contentTypeForImageData:(NSData *)data{
    
    uint8_t c;
    
    [data getBytes:&c length:1];
    
    switch (c) {
        case 0xFF:
            return @"jpeg";
        case 0x89:
            return @"png";
        case 0x47:
            return @"gif";
        case 0x49:
        case 0x4D:
            return @"tiff";
        case 0x52:
            if ([data length] < 12) {
                return nil;
            }
            NSString *testString = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
            if ([testString hasPrefix:@"RIFF"] && [testString hasSuffix:@"WEBP"]) {
                return @"webp";
            }
            return nil;
    }
    return nil;
}
@end
