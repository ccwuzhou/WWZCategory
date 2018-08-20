//
//  UIImageView+Launch.h
//  ZCCarOwner
//
//  Created by apple on 2017/7/19.
//  Copyright © 2017年 zhichekeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Launch)
/**
 *  获取启动图片并保持
 *
 *  @param duration duration后启动图片消失
 *
 *  @return 启动图片
 */
+ (UIImageView *)wwz_launchImageAnimateWithDuration:(NSTimeInterval)duration;

@end
