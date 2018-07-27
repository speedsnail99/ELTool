//
//  Dog.m
//  ELTool
//
//  Created by speed snail on 2018/7/13.
//  Copyright © 2018年 speedsnail. All rights reserved.
//  https://www.jianshu.com/p/45cbd324ea65

#import "Dog.h"

@implementation Dog




/*********************以下均是NSObjcet中的KVC对应的方法****************/
+(BOOL)accessInstanceVariablesDirectly
{

    return YES;
}

-(id)valueForUndefinedKey:(NSString *)key{
    ELLogDebug(@"出现异常，该key不存在%@",key);
    
    return nil;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    ELLogDebug(@"该key不存在，key:%@",key);
}
@end
