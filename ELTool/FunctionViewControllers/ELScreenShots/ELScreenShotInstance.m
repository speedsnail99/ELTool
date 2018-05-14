//
//  ELScreenShotInstance.m
//  ELTool
//
//  Created by speedsnail on 2018/5/11.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ELScreenShotInstance.h"

@implementation ELScreenShotInstance

static ELScreenShotInstance *_ELScreenShotInstance = nil;
+ (instancetype)sharedScreenShotInstance
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _ELScreenShotInstance = [[ELScreenShotInstance alloc] init];
    });
    return _ELScreenShotInstance;
}

@end
