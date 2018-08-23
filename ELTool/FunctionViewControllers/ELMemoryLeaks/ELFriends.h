//
//  ELFriends.h
//  ELTool
//
//  Created by speed snail on 2018/8/20.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^FriendBlock)(NSString *name);

@interface ELFriends : NSObject
@property (nonatomic, strong) NSArray *arr;
@property (nonatomic, copy) FriendBlock block;
@end
