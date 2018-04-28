//
//  ELFoodPieModel.h
//  ELTool
//
//  Created by speedsnail on 2018/4/23.
//  Copyright © 2018年 speedsnail. All rights reserved.
//  参考资料 https://www.jianshu.com/p/bc9029c32fc1

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface ELFoodPieModel : NSObject
/**
 名称
 */
@property (copy, nonatomic) NSString *name;

/**
 数值
 */
@property (assign, nonatomic) CGFloat value;

/**
 比例
 */
@property (assign, nonatomic) CGFloat rate;

@end
