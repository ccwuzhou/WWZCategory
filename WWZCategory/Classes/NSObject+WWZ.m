//
//  NSObject+WWZ.m
//  tttt
//
//  Created by apple on 2018/8/20.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSObject+WWZ.h"
#import <objc/runtime.h>
@implementation NSObject (WWZ)

- (NSMutableDictionary *)wwz_dictionayFromModelProperties{
    NSMutableDictionary *propsDic = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    // class:获取哪个类的成员属性列表
    // count:成员属性总数
    // 拷贝属性列表
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    
    for (i = 0; i<outCount; i++) {
        objc_property_t property = properties[i];
        const char* char_f = property_getName(property);
        // 属性名
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        // 属性值
        id propertyValue = [self valueForKey:(NSString *)propertyName];
        // 设置KeyValues
        if (propertyValue) [propsDic setObject:propertyValue forKey:propertyName];
    }
    // 需手动释放 不受ARC约束
    free(properties);
    return propsDic;
}

+ (void)load{
//    [self switchMethod];
}

+ (void)switchMethod{
    method_exchangeImplementations(class_getClassMethod([self class], @selector(addObserver:forKeyPath:options:context:)),
                                   class_getClassMethod([self class], @selector(wwz_addObserver:forKeyPath:options:context:)));
    method_exchangeImplementations(class_getClassMethod([self class], @selector(removeObserver:forKeyPath:context:)),
                                   class_getClassMethod([self class], @selector(wwz_removeObserver:forKeyPath:context:)));
}


#pragma mark - 第一种方案，利用@try @catch
//// 交换后的方法
//- (void)removeDasen:(NSObject *)observer forKeyPath:(NSString *)keyPath
//{
//    @try {
//        [self removeDasen:observer forKeyPath:keyPath];
//    } @catch (NSException *exception) {}
//
//}

//// 交换后的方法
//- (void)addDasen:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
//{
//    [self addDasen:observer forKeyPath:keyPath options:options context:context];
//
//}

#pragma mark - 第二种方案，利用私有属性
//// 交换后的方法
//- (void)removeDasen:(NSObject *)observer forKeyPath:(NSString *)keyPath
//{
//    NSMutableArray *Observers = [DSObserver sharedDSObserver];
//    ObserverData *userPathData = [self observerKeyPath:keyPath];
//    // 如果有该key值那么进行删除
//    if (userPathData) {
//        [Observers removeObject:userPathData];
//        [self removeDasen:observer forKeyPath:keyPath];
//    }
//    return;
//}
//
//// 交换后的方法
//- (void)addDasen:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
//{
//    ObserverData *userPathData= [[ObserverData alloc]initWithObjc:self key:keyPath];
//    NSMutableArray *Observers = [DSObserver sharedDSObserver];
//
//    // 如果没有注册，那么才进行注册
//    if (![self observerKeyPath:keyPath]) {
//        [Observers addObject:userPathData];
//        [self addDasen:observer forKeyPath:keyPath options:options context:context];
//    }
//
//}
//
//// 进行检索，判断是否已经存储了该Key值
//- (ObserverData *)observerKeyPath:(NSString *)keyPath
//{
//    NSMutableArray *Observers = [DSObserver sharedDSObserver];
//    for (ObserverData *data in Observers) {
//        if ([data.objc isEqual:self] && [data.keyPath isEqualToString:keyPath]) {
//            return data;
//        }
//    }
//    return nil;
//}

#pragma mark - 第三种方案，利用私有属性
// 交换后的方法
- (void)wwz_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath context:(void *)context{
    if ([self observerKeyPath:keyPath observer:observer]) {
        [self wwz_removeObserver:observer forKeyPath:keyPath context:context];
    }
}

// 交换后的方法
- (void)wwz_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context{
    if (![self observerKeyPath:keyPath observer:observer]) {
        [self wwz_addObserver:observer forKeyPath:keyPath options:options context:context];
    }
}

// 进行检索获取Key
- (BOOL)observerKeyPath:(NSString *)key observer:(id )observer{
    id info = self.observationInfo;
    NSArray *array = [info valueForKey:@"_observances"];
    for (id objc in array) {
        id Properties = [objc valueForKeyPath:@"_property"];
        id newObserver = [objc valueForKeyPath:@"_observer"];
        
        NSString *keyPath = [Properties valueForKeyPath:@"_keyPath"];
        if ([key isEqualToString:keyPath] && [newObserver isEqual:observer]) {
            return YES;
        }
    }
    return NO;
}

@end
