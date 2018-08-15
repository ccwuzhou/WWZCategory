//
//  NSData+WWZ.m
//  ZCCarOwner
//
//  Created by apple on 2017/11/1.
//  Copyright © 2017年 zhichekeji. All rights reserved.
//

#import "NSData+WWZ.h"

@implementation NSData (WWZ)

- (NSData *)wwz_subdataWithRange:(NSRange)range{
    if (range.location+range.length > self.length) {
        return nil;
    }
    return [self subdataWithRange:range];
}

@end

@implementation NSMutableData (WWZ)

- (void)wwz_replaceBytesInRange:(NSRange)range withBytes:(const void *)replacementBytes length:(NSUInteger)replacementLength{
    if (range.location+range.length > self.length) {
        [self replaceBytesInRange:NSMakeRange(range.location, self.length-range.location) withBytes:replacementBytes length:replacementLength];
        return;
    }
    
    [self replaceBytesInRange:range withBytes:replacementBytes length:replacementLength];
}

@end
