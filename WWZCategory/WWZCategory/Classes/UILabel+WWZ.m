//
//  UILabel+WWZ.m
//  WWZKit
//
//  Created by wwz on 17/3/7.
//  Copyright © 2017年 tijio. All rights reserved.
//

#import "UILabel+WWZ.h"

@implementation UILabel (WWZ)

/**
 *  给定frame的label
 */
+ (UILabel *)wwz_labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font tColor:(UIColor *)tColor alignment:(NSTextAlignment)alignment numberOfLines:(NSInteger)numberOfLines{
    
    UILabel *label = [[self alloc] initWithFrame:frame];
    label.text = text;
    label.font = font;
    label.textColor = tColor;
    label.textAlignment = alignment;
    label.numberOfLines = numberOfLines;
    
    return label;
}

@end
