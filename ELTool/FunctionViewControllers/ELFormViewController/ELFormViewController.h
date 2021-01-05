//
//  ELFormViewController.h
//  ELTool
//
//  Created by Fang on 2020/12/28.
//  Copyright © 2020 speedsnail. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ELFormViewController : UIViewController
@property(nonatomic,strong)NSMutableDictionary *requestDict;
@property(nonatomic,strong)NSMutableDictionary *uploadDict;
@property (nonatomic, strong) UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *datas;
@property(nonatomic, copy)void(^block)(void);

-(void)loadDataWithFileName:(NSString *)fileName;
-(void)checkHaveEmptyField:(void(^)(BOOL result,NSString *message))block;

@end

NS_ASSUME_NONNULL_END
