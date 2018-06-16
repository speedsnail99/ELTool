//
//  ELScrollViewController.m
//  ELTool
//
//  Created by snailspeed on 2018/6/3.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ELScrollViewController.h"

@interface ELScrollViewController ()

@end

@implementation ELScrollViewController

- (void)viewDidLoad
{
    [self createUserInterface];
}


/**
 创建视图
 */
- (void)createUserInterface
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(50, 100, 320, 300)];
    [self.view addSubview:scrollView];
    //imageView
    UIImageView *picImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jay.jpg"]];
//    CGSize imageSize = picImageView.image.size;
    //设置contentView
    scrollView.contentSize = picImageView.frame.size;
    [scrollView addSubview:picImageView];
    
}


@end
