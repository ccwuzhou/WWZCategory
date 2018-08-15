//
//  NSTimer+WWZ.m
//  ZCCarOwner
//
//  Created by apple on 2017/8/9.
//  Copyright © 2017年 zhichekeji. All rights reserved.
//

#import "NSTimer+WWZ.h"

@implementation NSTimer (WWZ)

+ (NSTimer *)wwz_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block{
    
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(wwz_blockInvoke:) userInfo:[block copy] repeats:repeats];
}

+ (void)wwz_blockInvoke:(NSTimer *)timer{
    
    void (^block)(NSTimer *timer) = timer.userInfo;
    
    if (block) {
        block(timer);
    }
}

@end
