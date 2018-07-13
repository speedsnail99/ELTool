//
//  UIViewController+safeViewAppear.m
//  ELTool
//
//  Created by speed snail on 2018/7/11.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "UIViewController+safeViewAppear.h"
#import <objc/runtime.h>

@implementation UIViewController (safeViewAppear)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        id obj = [[self alloc] init];
        //        [obj swizzleMethod:@selector(addObject:) withMethod:@selector(safeAddObject:)];
        
        [obj swizzleMethod:@selector(viewWillAppear:) withMethod:@selector(fang_viewWillAppear:)];
        
    });
}

- (void)swizzleMethod:(SEL)origSelector withMethod:(SEL)newSelector
{
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, origSelector);
    Method swizzledMethod = class_getInstanceMethod(class, newSelector);
    
    BOOL didAddMethod = class_addMethod(class,
                                        origSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class,
                            newSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (void)fang_viewWillAppear:(BOOL)animated {
    
    
    [self fang_viewWillAppear:animated];
}

@end
