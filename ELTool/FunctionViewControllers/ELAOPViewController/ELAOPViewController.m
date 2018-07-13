//
//  ELAOPViewController.m
//  ELTool
//
//  Created by speed snail on 2018/7/9.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ELAOPViewController.h"

@interface ELAOPViewController ()

@end

@implementation ELAOPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"AOPViewController";
    [self createUserInterface];
//    [self configerData];
}

- (void)configerData
{
    //初始化数据
    NSMutableArray *resultArray = [NSMutableArray array];
    [resultArray addObject:@"1"];
    [resultArray addObject:@"2"];
   
    NSString *resultItem = [resultArray objectAtIndex:3];
    ELLogDebug(@"isBreak");
  
    
}

- (void)createUserInterface
{
    NSArray *sementArray = @[@"NSDictionary",@"NSArray"];
    UISegmentedControl *segmengtControl = [[UISegmentedControl alloc] initWithItems:sementArray];
    segmengtControl.frame = CGRectMake(50, 100, kScreenWidth - 2*50, 50);
    [self.view addSubview:segmengtControl];
    [segmengtControl addTarget:self action:@selector(changeSegmentControl:) forControlEvents:UIControlEventValueChanged];
}


/**
 选择对应的功能

 @param segment 选段
 */
- (void)changeSegmentControl:(UISegmentedControl *)segment
{
    switch (segment.selectedSegmentIndex ) {
        case 0:
            ELLogDebug(@"selectDict");
            [self configerData];
            break;
        case 1:
            ELLogDebug(@"selectArray");
            break;
            
        default:
            break;
    }
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
