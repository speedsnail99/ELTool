//
//  FXFormModelTool.h
//  ELTool
//
//  Created by Fang on 2021/1/4.
//  Copyright © 2021 speedsnail. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FXFormModel.h"
#import "FXMediaItem.h"
NS_ASSUME_NONNULL_BEGIN

static NSString *const FXTextFieldCellID = @"FXTextFieldCell";
static NSString *const FXArrowCellID = @"FXArrowCell";
static NSString *const FXLabelCellID = @"FXLabelCell";
static NSString *const FXSwitchCellID = @"FXSwitchCell";
static NSString *const FXTextViewCellID = @"FXTextViewCell";
static NSString *const FXRadioBoxCellID = @"FXRadioBoxCell";
static NSString *const FXCheckBoxCellID = @"FXCheckBoxCell";
static NSString *const FXMediaViewCellID = @"FXMediaViewCell";



@interface FXFormModelTool : NSObject
+(NSArray *)getFieldModelsWithFileName:(NSString *)fileName;
@end

NS_ASSUME_NONNULL_END
