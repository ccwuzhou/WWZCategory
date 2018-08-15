//
//  UIWindow+WWZ.h
//  ZCCarOwner
//
//  Created by apple on 2017/10/15.
//  Copyright © 2017年 zhichekeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (WWZ)
/**
 获取Window当前显示的ViewController
 
 @return 当前显示的ViewController
 */
+ (UIViewController*)wwz_currentViewController;
@end
