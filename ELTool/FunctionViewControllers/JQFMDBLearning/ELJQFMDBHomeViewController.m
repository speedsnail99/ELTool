//
//  ELJQFMDBHomeViewController.m
//  ELTool
//
//  Created by snailspeed on 2018/5/31.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ELJQFMDBHomeViewController.h"
#import "ProductionView.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height


static const int kStatusAndNaviHeight = 64;

@interface ELJQFMDBHomeViewController ()

@end

@implementation ELJQFMDBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"JQFMDBHome";
    [self createUserInterface];
}

- (void)createUserInterface
{
    ProductionView *productView = [[ProductionView alloc] initWithFrame:CGRectMake(0, 64, kWidth, kHeight/2)];
    productView.backgroundColor = [UIColor redColor];
    [self.view addSubview:productView];
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
