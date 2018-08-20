//
//  UIViewController+Storyboard.m
//  ZCCarOwner
//
//  Created by apple on 2017/6/16.
//  Copyright © 2017年 zhichekeji. All rights reserved.
//

#import "UIViewController+Storyboard.h"

@implementation UIViewController (Storyboard)

+ (instancetype)instanceFormStoryboard{
    NSString *identifier = NSStringFromClass([self class]);
    // 取缓存的storyboard名
    NSCache *cache = [self cache];
    NSString *cacheStoryboardName = [cache objectForKey:identifier];
    if (cacheStoryboardName) {
        return [self tryTakeOutInstanceFromStoryboardNamed:cacheStoryboardName identifier:identifier];
    }
    // 未缓存，遍历storyboard文件名列表，开始尝试取出实例。
    for (NSString *name in [self storyboardList]) {
        UIViewController *instance = [self tryTakeOutInstanceFromStoryboardNamed:name identifier:identifier];
        if (instance) {
            // 成功获取实例后，对storyboard名进行缓存
            [cache setObject:name forKey:identifier];
            return instance;
        }
    }
    return nil;
}

+ (nullable instancetype)tryTakeOutInstanceFromStoryboardNamed:(nonnull NSString *)storyboardName identifier:(nonnull NSString *)identifier{
    if (!storyboardName || !identifier) {
        return nil;
    }
    @try {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
        UIViewController *vc = [sb instantiateViewControllerWithIdentifier:identifier];
        return vc;
    }
    @catch (NSException *exception) {
        return nil;
    }
    @finally {
        
    }
}

+ (nonnull NSArray*)storyboardList{
    static NSArray *kBundleStoryboardNameList;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSMutableArray *tmp = [NSMutableArray array];
        /**
         *  找到所有storyboard文件。
         *  @warning 会忽略带有 ~iphone(iPhone应用)或 ~ipad(ipad应用)标志的 storyboard文件名
         */
        NSArray *list = [NSBundle pathsForResourcesOfType:@"storyboardc" inDirectory:[NSBundle mainBundle].resourcePath];
        for (NSString *path in list) {
            NSString *ext = [path lastPathComponent];
            NSString *name = [ext stringByDeletingPathExtension];
            if ([name rangeOfString:@"~"].location == NSNotFound) {
                [tmp addObject:name];
            }
        }
        kBundleStoryboardNameList = [NSArray arrayWithArray:tmp];
    });
    return kBundleStoryboardNameList;
}

+ (NSCache *)cache{
    static NSCache *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [[NSCache alloc] init];
    });
    return cache;
}
@end
