//
//  ELSimpleFunctionViewController.h
//  ELTool
//
//  Created by speedsnail on 2018/5/10.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ccBlock) (void);
typedef NS_ENUM(NSInteger,SFNoticeDetailType)
{
    SFNoticeDetailType_normal = 1,//默认通知详情类型，不做特殊处理
    SFNoticeDetailType_performance = 2 //销售绩效考核类型通知
};

@interface ELSimpleFunctionViewController : UIViewController
@property (nonatomic, copy)ccBlock myBlock;
@property (nonatomic, assign) SFNoticeDetailType ctype;

- (void)simpleFuntionBlock:(ccBlock)completion;

@end
