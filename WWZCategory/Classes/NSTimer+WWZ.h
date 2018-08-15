//
//  NSTimer+WWZ.h
//  ZCCarOwner
//
//  Created by apple on 2017/8/9.
//  Copyright © 2017年 zhichekeji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (WWZ)

+ (NSTimer *)wwz_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;

@end
