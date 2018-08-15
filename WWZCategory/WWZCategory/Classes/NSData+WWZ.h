//
//  NSData+WWZ.h
//  ZCCarOwner
//
//  Created by apple on 2017/11/1.
//  Copyright © 2017年 zhichekeji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (WWZ)

- (NSData *)wwz_subdataWithRange:(NSRange)range;

@end


@interface NSMutableData (WWZ)

- (void)wwz_replaceBytesInRange:(NSRange)range withBytes:(const void *)replacementBytes length:(NSUInteger)replacementLength;

@end
