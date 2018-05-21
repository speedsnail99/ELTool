//
//  ElWindowTestViewController.m
//  ELTool
//
//  Created by speedsnail on 2018/5/14.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ElWindowTestViewController.h"

@interface ElWindowTestViewController ()
// 创建属性
@property (nonatomic, strong)UIWindow *myWindow1;
@property (nonatomic, strong)UIWindow *myWindow2;
@property (nonatomic, strong)UIWindow *myWindow3;

@end

@implementation ElWindowTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"ELWindow";
    [self createUserInterface];
}

- (void)createUserInterface
{
    NSLog(@"windowLevels:%f,%f,%f",UIWindowLevelNormal,UIWindowLevelAlert,UIWindowLevelStatusBar);
    
    UIButton *tempBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    tempBtn.frame = CGRectMake(100, 100, 30, 30);
//    tempBtn.backgroundColor = [UIColor cyanColor];
    // 通过按钮的点击事件生成不同windowLevel级别的window
    [tempBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [tempBtn setImage:[UIImage imageNamed:@"quickselectHisDelete.png"] forState:UIControlStateNormal];
    [tempBtn setBackgroundImage:[UIImage imageNamed:@"quickselectHisDelete.png"] forState:UIControlStateNormal];
    [self.view addSubview:tempBtn];
    
}

- (void)clickBtn:(UIButton *)btn
{
//    [self test1];
//    [self test2];
//    [self test3];
}


/**
 *  这个方法证明两个问题
 *1、创建 window 不用添加到任何的控件上面，直接创建完毕就能添加
 *2、创建一个比默认window的windowLevel大的window来看一下什么效果，效果是会盖在原来的window上面
 */
- (void)test1
{
    // 创建window
    if (self.myWindow1 == nil) {
        self.myWindow1 = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        
        UIButton *windowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [windowBtn setTitle:@"window1点我隐藏" forState:UIControlStateNormal];
        windowBtn.backgroundColor = [UIColor redColor];
        windowBtn.frame = CGRectMake(100, 300, 100, 100);
        [windowBtn addTarget:self action:@selector(clickWindowBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.myWindow1 addSubview:windowBtn];
        
    }
    // 设置window的颜色，这里设置成半透明的，方便查看window的层级关系
    self.myWindow1.backgroundColor = [UIColor colorWithRed:0.00f green:1.00f blue:0.01f alpha:0.50f];
    // 设置 window 的 windowLevel
    self.myWindow1.windowLevel = 100;
    self.myWindow1.hidden = NO;
}


/**
 *  这个方法证明两个问题
 *1、创建 window 不用添加到任何的控件上面，直接创建完毕就能添加
 *2、创建一个和默认window的windowLevel一样大的window来看一下什么效果，效果是会盖在原来的window上面
 */
- (void)test2
{
    // 创建window
    if (self.myWindow2 == nil) {
        self.myWindow2 = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        
        UIButton *windowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [windowBtn setTitle:@"window2点我隐藏" forState:UIControlStateNormal];
        windowBtn.backgroundColor = [UIColor greenColor];
        windowBtn.frame = CGRectMake(100, 300, 200, 100);
        [windowBtn addTarget:self action:@selector(clickWindow2Btn:) forControlEvents:UIControlEventTouchUpInside];
        [self.myWindow2 addSubview:windowBtn];
        
    }
    // 设置window的颜色，这里设置成半透明的，方便查看window的层级关系
    self.myWindow2.backgroundColor = [UIColor colorWithRed:0.91f green:0.13f blue:0.13f alpha:0.50f];
    
    // 设置 window 的 windowLevel，设置的和当前存在的window一样
    self.myWindow2.windowLevel = self.view.window.windowLevel;
    self.myWindow2.hidden = NO;
    [self.myWindow2 makeKeyAndVisible];
    
    // 查看当前所有的window
    NSLog(@"当前所有的window = %@ \n self.myWindow1 = %@",[UIApplication sharedApplication].windows,self.myWindow3);
    NSLog(@"");
}


/**
 *  这个方法证明两个问题
 *1、创建 window 不用添加到任何的控件上面，直接创建完毕就能添加
 *2、创建一个和默认window的windowLevel一样大的window来看一下什么效果，效果是会在在原来的window下面
 */

- (void)test3
{
    // 为了展示相关的效果，把当前的window的透明度设置为0.5
    self.view.window.alpha = 0.5;
    
    // 创建window
    if (self.myWindow3 == nil) {
        self.myWindow3 = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    // 设置window的颜色，这里设置成半透明的，方便查看window的层级关系
    self.myWindow3.backgroundColor = [UIColor blueColor];
    
    // 设置 window 的 windowLevel，设置的比当前存在的window的小
    self.myWindow3.windowLevel = -1;
    self.myWindow3.hidden = NO;
    [self.myWindow3 makeKeyAndVisible];
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
