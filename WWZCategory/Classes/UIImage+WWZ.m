//
//  UIImage+WWZ.m
//  ZCCarOwner
//
//  Created by apple on 2017/9/22.
//  Copyright © 2017年 zhichekeji. All rights reserved.
//

#import "UIImage+WWZ.h"

@implementation UIImage (WWZ)

+ (instancetype)wwz_imageWithImage:(UIImage *)image size:(CGSize)size{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    //2. 获取上下文
    UIGraphicsGetCurrentContext();
    //5. 画图
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    //6. 从内存中创建新图片对象
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //7. 结束图片上下文
    UIGraphicsEndImageContext();
    return newImage;
}

+ (instancetype)wwz_imageWithQRCode:(NSString *)qrcode size:(CGSize)size{
    // 1、创建滤镜对象
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 恢复滤镜的默认属性
    [filter setDefaults];
    // 将字符串转换成
    NSData *infoData = [qrcode dataUsingEncoding:NSUTF8StringEncoding];
    // 通过KVC设置滤镜inputMessage数据
    [filter setValue:infoData forKeyPath:@"inputMessage"];
    // 3、获得滤镜输出的图像
    CIImage *outputImage = [filter outputImage];
    // 4、将CIImage转换成UIImage，并放大显示
    return [UIImage wwz_imageWithCIImage:outputImage size:size];
}

/** 将CIImage转换成UIImage */
+ (UIImage *)wwz_imageWithCIImage:(CIImage *)ciimage size:(CGSize)size {
    CGRect extent = CGRectIntegral(ciimage.extent);
    CGFloat scale = MIN(size.width/CGRectGetWidth(extent), size.height/CGRectGetHeight(extent));
    
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:ciimage fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

+ (NSString *)wwz_imageMessageString:(UIImage *)image{
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{CIDetectorAccuracy : CIDetectorAccuracyHigh}];
    // 取得识别结果
    NSArray *features = [detector featuresInImage:[CIImage imageWithCGImage:image.CGImage]];
    if (features.count>0) {
        CIQRCodeFeature *feature = features[0];
        return feature.messageString;
    }
    return @"";
}

/**
 *  UIColor ==> UIImage
 *
 *  @param color color
 *  @param size  size
 *  @param alpha alpha
 *
 *  @return UIImage
 */
+ (instancetype)wwz_imageWithColor:(UIColor *)color size:(CGSize)size alpha:(float)alpha{
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetAlpha(context, alpha);
    CGContextSetFillColorWithColor(context,color.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

/**
 获取矩形的渐变色的UIImage
 */
+ (instancetype)wwz_gradientImageWithSize:(CGSize)size colors:(NSArray*)colors gradientType:(GradientType)gradientType {
    NSMutableArray *ar = [NSMutableArray array];
    for(UIColor *c in colors) {
        [ar addObject:(id)c.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(size, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    CGPoint startPoint;
    CGPoint endPoint;
    switch (gradientType) {
        case topToBottom:{
            startPoint = CGPointMake(0.0, 0.0);
            endPoint = CGPointMake(0.0, size.height);
            
        }
            break;
        case leftToRight:{
            startPoint = CGPointMake(0.0, 0.0);
            endPoint = CGPointMake(size.width, 0.0);
        }
            break;
        case upleftTolowRight:{
            startPoint = CGPointMake(0.0, 0.0);
            endPoint = CGPointMake(size.width, size.height);
        }
            break;
        case uprightTolowLeft:{
            startPoint = CGPointMake(size.width, 0.0);
            endPoint = CGPointMake(0.0, size.height);
        }
            break;
        default:
            break;
            
    }
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return image;
}


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
