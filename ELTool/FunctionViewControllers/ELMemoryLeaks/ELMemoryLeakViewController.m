//
//  ELMemoryLeakViewController.m
//  ELTool
//
//  Created by speed snail on 2018/8/20.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ELMemoryLeakViewController.h"
#import "ELFriends.h"

@interface ELMemoryLeakViewController ()

@end

@implementation ELMemoryLeakViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"内存泄漏检测";
    // Do any additional setup after loading the view.
    [self createLeakFunction];
}

- (void)createLeakFunction
{
    ELFriends *friend = [[ELFriends alloc] init];
    friend.block(@"cc_test");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
