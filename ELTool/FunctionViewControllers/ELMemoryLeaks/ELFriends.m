//
//  ELFriends.m
//  ELTool
//
//  Created by speed snail on 2018/8/20.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ELFriends.h"

@implementation ELFriends
- (id)init
{
    if (self = [super init]) {
        self.arr=@[@111,@222,@333];
        self.block= ^(NSString*name){
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                ELLogDebug(@"dispatch:%@",self.arr);
            });
            
        };
    }
        return self;
}

- (void)dealloc
{
    ELLogDebug(@"friendsBlock  Dealloc");
}
@end
