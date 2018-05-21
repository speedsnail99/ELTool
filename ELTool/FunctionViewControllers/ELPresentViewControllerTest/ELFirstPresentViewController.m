//
//  ELFirstPresentViewController.m
//  ELTool
//
//  Created by speedsnail on 2018/5/21.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ELFirstPresentViewController.h"

@interface ELFirstPresentViewController ()

@end

@implementation ELFirstPresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"FirstPresentVC";
    [self createUserInterface];
}

- (void)createUserInterface
{
    self.view.backgroundColor = [UIColor purpleColor];
    UIButton *closeButton = [[UIButton alloc] initWithFrame:CGRectMake(100,100,100,50)];
    closeButton.backgroundColor = [UIColor blueColor];
    [closeButton setTitle:@"close" forState:UIControlStateNormal];
    [closeButton addTarget:self  action:@selector(closePresentVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeButton];
}


/**
 关闭模态视图

 @param close 关闭按钮
 */
- (void)closePresentVC:(UIButton *)close
{
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"隐藏模态视图");
    }];
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
