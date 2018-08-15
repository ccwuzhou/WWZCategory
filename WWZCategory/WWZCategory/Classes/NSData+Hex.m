//
//  NSData+Hex.m
//  ZCCarOwner
//
//  Created by apple on 2017/9/27.
//  Copyright © 2017年 zhichekeji. All rights reserved.
//

#import "NSData+Hex.h"

@implementation NSData (Hex)

/**
 十进制数值 => NSData
 
 @param value 十进制数值
 @return NSData
 */
+ (NSData *)wwz_dataFromByteValue:(Byte)value{
    return [NSData dataWithBytes:&value length:sizeof(value)];
}
+ (NSData *)wwz_dataFromUShortValue:(unsigned short)value{
    value = CFSwapInt16BigToHost(value);
    return [NSData dataWithBytes:&value length:sizeof(value)];
}
+ (NSData *)wwz_dataFromUIntValue:(unsigned int)value{
    value = CFSwapInt32BigToHost(value);
    return [NSData dataWithBytes:&value length:sizeof(value)];
}

/**
 NSData => 十进制
 @return 十进制数值
 */
- (Byte)wwz_byteValue{
    Byte i=0;
    [self getBytes:&i length:sizeof(i)];
    return i;
}
- (unsigned short)wwz_uShortValue{
    unsigned short i=0;
    [self getBytes:&i length:sizeof(i)];
    return CFSwapInt16BigToHost(i);
}
- (unsigned int)wwz_uIntValue{
    unsigned int i=0;
    [self getBytes:&i length:sizeof(i)];
    return CFSwapInt32BigToHost(i);
}

+ (NSData *)wwz_gbkDataFromString:(NSString *)string{
    return [string dataUsingEncoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)];
}

- (NSString *)wwz_stringValue{
    return [[NSString alloc] initWithData:self encoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)];
}


/**
 *  十六进制的字符串  ==> NSData
 *
 *  @return NSData
 */
+ (NSData *)wwz_hexDataFromHexString:(NSString *)hexString{
    if (hexString.length == 0) {
        return nil;
    }
    NSMutableData *mHexData = [[NSMutableData alloc] initWithCapacity:8];
    NSRange range;
    if (hexString.length % 2 == 0) {
        range = NSMakeRange(0, 2);
    } else {
        range = NSMakeRange(0, 1);
    }
    for (NSInteger i = range.location; i < hexString.length; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [hexString substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [mHexData appendData:entity];
        
        range.location += range.length;
        range.length = 2;
    }
    return mHexData;
}

@end
