//
//  ELScrollViewController.m
//  ELTool
//
//  Created by snailspeed on 2018/6/3.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ELScrollViewController.h"


@interface ELScrollViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
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
    //    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    ////    scrollView.tag = 836913;
    //    scrollView.backgroundColor = [UIColor yellowColor];
    //
    //    [self.view addSubview:scrollView];
    //    //imageView
    //    UIImageView *picImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jay.jpg"]];
    ////    CGSize imageSize = picImageView.image.size;
    //    //设置contentView
    //
    //    scrollView.contentSize = picImageView.frame.size;
    //    [scrollView addSubview:picImageView];
    
    
    // 1.创建UIScrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(100, 100, 250, 250); // frame中的size指UIScrollView的可视范围
    scrollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scrollView];
    scrollView.tag = 836913;
    self.scrollView = scrollView;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIView *holdView  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250*2, 250)];
    [self.view addSubview:holdView];
    holdView.backgroundColor = [UIColor cyanColor];
    scrollView.contentSize = CGSizeMake(250*2, 250*2);
    
    [scrollView addSubview:holdView];
    
//    // 2.创建UIImageView（图片）
//    UIImageView *imageView = [[UIImageView alloc] init];
//    imageView.image = [UIImage imageNamed:@"jay.jpg"];
//    CGFloat imgW = imageView.image.size.width; // 图片的宽度
//    CGFloat imgH = imageView.image.size.height; // 图片的高度
//    imageView.frame = CGRectMake(0, 0, imgW, imgH);
//    [scrollView addSubview:imageView];
//    // 设置UIScrollView的滚动范围（内容大小）
//    scrollView.contentSize = imageView.image.size;
//    _scrollView = scrollView;
    
    
    //b
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, CGRectGetMaxY(scrollView.frame) + 50, 100, 50)];
    btn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(doSomething) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.scrollView flashScrollIndicators];
}

- (void)doSomething
{
    [UIView animateWithDuration:1.0 animations:^{
        //三个步骤
        CGPoint offset = _scrollView.contentOffset;
        offset.y += 150;
        _scrollView.contentOffset = offset;
        
        //_scrollView.contentOffset = CGPointMake(0, 0);
    }];
}


@end
