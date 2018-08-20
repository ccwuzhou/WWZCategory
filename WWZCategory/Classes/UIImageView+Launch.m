//
//  UIImageView+Launch.m
//  ZCCarOwner
//
//  Created by apple on 2017/7/19.
//  Copyright © 2017年 zhichekeji. All rights reserved.
//

#import "UIImageView+Launch.h"

@implementation UIImageView (Launch)
#pragma mark - launch image

/**
 *  获取启动图片并保持
 *
 *  @param duration duration后启动图片消失
 *
 *  @return 启动图片
 */
+ (UIImageView *)wwz_launchImageAnimateWithDuration:(NSTimeInterval)duration{
    
    CGSize viewSize = [UIScreen mainScreen].bounds.size;
    
    NSString *viewOrientation = @"Portrait";    //横屏请设置成 @"Landscape"
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        viewOrientation = @"Landscape";
        viewSize = CGSizeMake(viewSize.height, viewSize.width);
    }
    NSString *launchImage = nil;
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    
    for (NSDictionary* dict in imagesDict){
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]]){
            launchImage = dict[@"UILaunchImageName"];
        }
    }
    UIImageView *launchView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:launchImage]];
    launchView.frame = [UIScreen mainScreen].bounds;
    launchView.contentMode = UIViewContentModeScaleAspectFill;
    [[UIApplication sharedApplication].keyWindow addSubview:launchView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self wwz_dismissLaunchImageView:launchView];
    });
    return launchView;
}

/**
 *  启动图片消失动画
 *
 *  @param launchView 启动图片
 */
+ (void)wwz_dismissLaunchImageView:(UIView *)launchView{
    [UIView animateWithDuration:0.5f delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        launchView.alpha = 0.0f;
        launchView.layer.transform = CATransform3DScale(CATransform3DIdentity, 1.2, 1.2, 1);
    } completion:^(BOOL finished) {
        [launchView removeFromSuperview];
    }];
}
@end
