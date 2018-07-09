//
//  ELSimpleFunctionViewController.h
//  ELTool
//
//  Created by speedsnail on 2018/5/10.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ccBlock) (void);

@interface ELSimpleFunctionViewController : UIViewController
@property (nonatomic, copy)ccBlock myBlock;
@end
