//
//  UIWindow+WWZ.m
//  ZCCarOwner
//
//  Created by apple on 2017/10/15.
//  Copyright © 2017年 zhichekeji. All rights reserved.
//

#import "UIWindow+WWZ.h"

@implementation UIWindow (WWZ)

/**
 获取Window当前显示的ViewController

 @return 当前显示的ViewController
 */
+ (UIViewController*)wwz_currentViewController{
    //获得当前活动窗口的根视图
    UIViewController* vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (1)
    {
        //根据不同的页面切换方式，逐步取得最上层的viewController
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController*)vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController*)vc).visibleViewController;
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            break;
        }
    }
    return vc;
}

@end
