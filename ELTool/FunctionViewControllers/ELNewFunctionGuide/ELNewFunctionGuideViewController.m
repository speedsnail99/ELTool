//
//  ELNewFunctionGuideViewController.m
//  ELTool
//
//  Created by speedsnail on 2018/5/19.
//  Copyright © 2018年 speedsnail. All rights reserved.
//  新功能引导页面
//  https://www.cnblogs.com/XYQ-208910/p/5714352.html

#import "ELNewFunctionGuideViewController.h"

// 颜色RGB

#define XYQColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

@interface ELNewFunctionGuideViewController ()

@end

@implementation ELNewFunctionGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self newUserGuide];
}


- (void)newUserGuide
{
    // 这里创建指引在这个视图在window上(蒙版、手势)
    CGRect frame = [UIScreen mainScreen].bounds;
    UIView * bgView = [[UIView alloc]initWithFrame:frame];
    CGFloat naviAndStatusHeight = 64;
    
    //   bgView.backgroundColor = XYQColorRGBA(50, 50, 50, 0.8);
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sureTapClick:)];
    [bgView addGestureRecognizer:tap];
    
    //添加子视图控件
    UIView *navigationTopView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, naviAndStatusHeight)];
    navigationTopView.backgroundColor = XYQColorRGBA(50, 50, 50, 0.8);
    [bgView addSubview:navigationTopView];
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(navigationTopView.frame),frame.size.width, frame.size.height - naviAndStatusHeight)];;
    imageView.image = [UIImage imageNamed:@"payQRGuideImage.png"];
    [bgView addSubview:imageView];
    [[UIApplication sharedApplication].keyWindow addSubview:bgView];
    
}
/**
 *   新手指引确定
 */
- (void)sureTapClick:(UITapGestureRecognizer *)tap
{
    UIView *guidevView = tap.view;
    [guidevView removeFromSuperview]; //移除蒙版
    [guidevView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];//移除所有子视图
    [guidevView removeGestureRecognizer:tap]; //移除手势
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
