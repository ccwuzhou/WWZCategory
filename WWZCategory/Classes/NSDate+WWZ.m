//
//  NSDate+WWZ.m
//  ZCCarOwner
//
//  Created by apple on 2017/8/2.
//  Copyright © 2017年 zhichekeji. All rights reserved.
//

#import "NSDate+WWZ.h"

@implementation NSDate (WWZ)

/**
 当前时间截
 */
+ (NSInteger)wwz_timeStamp{
    return [[NSDate date] timeIntervalSince1970];
}

/**
 *  NSDate 转 NSDateComponents
 */
+ (NSDateComponents *)wwz_localDateComponentsFromDate:(NSDate *)date{
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [[NSCalendar currentCalendar] components:unitFlags fromDate:date];
    return dateComponent;
}

/**
 *  NSDate 转 NSDateComponents
 */
+ (NSDateComponents *)wwz_utcDateComponentsFromDate:(NSDate *)date{
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSCalendar *caledar = [NSCalendar currentCalendar];
    [caledar setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSDateComponents *dateComponent = [caledar components:unitFlags fromDate:date];
    return dateComponent;
}

/**
 日期
 
 @param dateString 日期字符串
 @param dateFormat 日期格式如 @"yyyy-MM-dd HH:mm:ss"
 @return 日期
 */
+ (NSDate *)wwz_dateFromDateString:(NSString *)dateString dateFormat:(NSString *)dateFormat{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormat];
    return [formatter dateFromString:dateString];
}

/**
 date格式化
 
 @param dateFormat 日期格式 如 @"yyyy-MM-dd HH:mm:ss"
 @return 格式化后的日期
 */
- (NSString *)wwz_dateStringFormDateFormat:(NSString *)dateFormat{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormat];
    return [formatter stringFromDate:self];
}

/**
 *  是否为今天
 */
- (BOOL)wwz_isToday{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear;
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return (selfCmps.year == nowCmps.year) && (selfCmps.month == nowCmps.month) && (selfCmps.day == nowCmps.day);
}

+ (BOOL)wwz_isOneWeekLaterFrom:(NSInteger)fromTimestamp{
    return (([self wwz_timeStamp] - fromTimestamp) / (3600 * 24)) > 7;
}
@end
