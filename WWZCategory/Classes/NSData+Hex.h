//
//  NSData+Hex.h
//  ZCCarOwner
//
//  Created by apple on 2017/9/27.
//  Copyright © 2017年 zhichekeji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Hex)

/**
 十进制数值 => NSData
 
 @param value 十进制数值
 @return NSData
 */
+ (NSData *)wwz_dataFromByteValue:(Byte)value;
+ (NSData *)wwz_dataFromUShortValue:(unsigned short)value;
+ (NSData *)wwz_dataFromUIntValue:(unsigned int)value;

/**
 NSData => 十进制
 @return 十进制数值
 */
- (Byte)wwz_byteValue;
- (unsigned short)wwz_uShortValue;
- (unsigned int)wwz_uIntValue;

/**
  gbk编码

 @param string 字符串
 @return gbk字节码
 */
+ (NSData *)wwz_gbkDataFromString:(NSString *)string;

/**
 gbk解码
 @return 中文
 */
- (NSString *)wwz_stringValue;

/**
 *  十六进制的字符串  ==> NSData
 *
 *  @return NSData
 */
+ (NSData *)wwz_hexDataFromHexString:(NSString *)hexString;
@end
