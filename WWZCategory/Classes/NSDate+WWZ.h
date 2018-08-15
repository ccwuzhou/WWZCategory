//
//  NSDate+WWZ.h
//  ZCCarOwner
//
//  Created by apple on 2017/8/2.
//  Copyright © 2017年 zhichekeji. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const DATA_FORMAT_1 = @"yyyy-MM-dd:EEEE HH:mm";
static NSString *const DATA_FORMAT_2 = @"yyyy-MM-dd HH:mm:ss";
static NSString *const DATA_FORMAT_3 = @"yyyy/MM/dd HH:mm:ss";
static NSString *const DATA_FORMAT_4 = @"MM/dd HH:mm";
static NSString *const DATA_FORMAT_5 = @"MMMdd HH:mm";
static NSString *const DATA_FORMAT_6 = @"yyyy-MM-dd";
static NSString *const DATA_FORMAT_7 = @"HH:mm:ss";
static NSString *const DATA_FORMAT_8 = @"HH:mm";

@interface NSDate (WWZ)

/**
 当前时间截
 */
+ (NSInteger)wwz_timeStamp;

/**
 NSDate 转 NSDateComponents
 */
+ (NSDateComponents *)wwz_utcDateComponentsFromDate:(NSDate *)date;

/**
 日期

 @param dateString 日期字符串
 @param dateFormat 日期格式如 @"yyyy-MM-dd HH:mm:ss"
 @return 日期
 */
+ (NSDate *)wwz_dateFromDateString:(NSString *)dateString dateFormat:(NSString *)dateFormat;

/**
 date格式化

 @param dateFormat 日期格式 如 @"yyyy-MM-dd HH:mm:ss"
 @return 格式化后的日期
 */
- (NSString *)wwz_dateStringFormDateFormat:(NSString *)dateFormat;

/**
 *  是否为今天
 */
- (BOOL)wwz_isToday;

/**
 是否一周之后
 */
+ (BOOL)wwz_isOneWeekLaterFrom:(NSInteger)fromTimestamp;
@end
