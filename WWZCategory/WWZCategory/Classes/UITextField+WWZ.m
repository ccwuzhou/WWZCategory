//
//  UITextField+WWZ.m
//  ZCCarOwner
//
//  Created by apple on 2018/3/8.
//  Copyright © 2018年 zhichekeji. All rights reserved.
//

#import "UITextField+WWZ.h"

@implementation UITextField (WWZ)

- (void)wwz_setPlaceholderTextColor:(UIColor *)color{
    [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
}
@end
