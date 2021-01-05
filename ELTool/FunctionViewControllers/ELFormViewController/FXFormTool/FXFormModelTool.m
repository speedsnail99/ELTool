//
//  FXFormModelTool.m
//  ELTool
//
//  Created by Fang on 2021/1/4.
//  Copyright © 2021 speedsnail. All rights reserved.
//

#import "FXFormModelTool.h"
#import "FXFormHeaderModel.h"
#import "MJExtension.h"

@implementation FXFormModelTool
+(NSArray *)getFieldModelsWithFileName:(NSString *)fileName{
    BOOL isPlistFile = [fileName containsString:@"plist"];
    BOOL isJsonFile = [fileName containsString:@"json"];
    
    //目前看来，路径不写类型，也可以在后边识别出来（)
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    if (isPlistFile) {
        //plist可以直接转换数组
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        return [self getModelsWithDatas:arr];
    } else if (isJsonFile) {
        
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        return [self getModelsWithDatas:arr];
        
    } else {
        //断言的作用
        NSAssert((isPlistFile || isJsonFile ), @"fileName必须是plist或者json文件");
    }

    
    return nil;
}

+(NSArray *)getModelsWithDatas:(NSArray *)arr{
    NSDictionary *dict = arr.firstObject;
    if ([dict.allKeys containsObject:@"header"]) {
        NSArray *datas = [FXFormHeaderModel mj_objectArrayWithKeyValuesArray:arr];
        for (FXFormHeaderModel *header in datas) {
            [self handeModelCellTypeWithModels:header.content];
        }
        return datas;
        
    } else {
        
        NSArray *result  = [FXFormModel mj_objectArrayWithKeyValuesArray:arr];
        [self handeModelCellTypeWithModels:result];
        return result;
    }
}

+(void)handeModelCellTypeWithModels:(NSArray *)models{
    for (FXFormModel *model in models) {
        [FXFormModelTool handeModelCellType:model];
    }
}


+(void)handeModelCellType:(FXFormModel *)model{
    
    switch (model.cellType) {
        case FXCellTypeArrow:
            model.cellID = FXArrowCellID;
        break;
        case FXCellTypeLabel:
            model.cellID = FXLabelCellID;
        break;
        case FXCellTypeSwitch:
            model.cellID = FXSwitchCellID;
        break;
        case FXCellTypeTextView:
            model.cellID = FXTextViewCellID;
        break;
        case FXCellTypeRadioBox:
            model.cellID = FXRadioBoxCellID;
        break;
        case FXCellTypeCheckBox:
            model.cellID = FXCheckBoxCellID;
        break;
        case FXCellTypeMeida:
            model.cellID = FXMediaViewCellID;
        break;
        default:
            model.cellID = FXTextFieldCellID;
            break;
    }
}


@end
