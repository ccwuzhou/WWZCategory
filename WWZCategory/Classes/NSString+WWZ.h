//
//  NSString+WWZ.h
//  ZCCarOwner
//
//  Created by apple on 2017/6/23.
//  Copyright © 2017年 zhichekeji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WWZ)

/**
 documentPath下文件路径
 */
+ (NSString *)wwz_filePathWithFileName:(NSString *)fileName;

/**
 是否是手机号
 */
+ (BOOL)wwz_isMobileNumber:(NSString *)mobileNum;

/**
 同时包含数字和字符
 */
+ (BOOL)wwz_judgePassWordLegal:(NSString *)pass;

/**
 判断是否以字母开头
 */
+ (BOOL)wwz_judgeOwnerNumberLegal:(NSString *)ownerNumber;

/**
 *  MD5加密
 */
- (NSString *)wwz_md5String;
@end
