//
//  ELSudoLayoutViewController.m
//  ELTool
//
//  Created by speed snail on 2018/7/27.
//  Copyright © 2018年 speedsnail. All rights reserved.
//  iOS 多个不同宽度button布局自动换行

#import "ELSudoLayoutViewController.h"

@interface ELSudoLayoutViewController ()

@end

@implementation ELSudoLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"多行button布局";
    [self createViewWithTitleArr];

}


#pragma mark - 多个不同宽度button自动换行
-(void)createViewWithTitleArr
{
    CGFloat WID = kScreenWidth;
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 250, WID, 45)];
    bgView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:bgView];
    
    NSArray *titleAry = @[@"安徽发克鲁斯",
                          @"啥就开始打开",
                          @"等哈说楼房吉安老师发货啦",
                          @"盛开的花",
                          @"就发生；楼房吉安；十分骄傲；十分骄傲；是否",
                          @"中文"];
    CGFloat pointX = 10.0; //button X坐标
    CGFloat pointY = 10.0; //button Y坐标
    CGFloat padding = 5.0; //button 间距
    CGFloat btnHeight = 30; //button高度
    CGFloat allWidth = WID - 10;
    UIFont *titleFont = [UIFont systemFontOfSize:15];
    for (int i = 0; i < titleAry.count; i++) {
        CGRect rect = [titleAry[i] boundingRectWithSize:CGSizeMake(MAXFLOAT, 30) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : titleFont} context:nil];
        CGFloat btnWidth = rect.size.width + 20;
        
        if (pointX + btnWidth > allWidth) {//换行
            pointX = 10;//X从新开始
            pointY += (btnHeight + padding);//换行后Y+
        }
        UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
        but.frame = CGRectMake(pointX, pointY, btnWidth, btnHeight);
        but.tag = i + 1000;
        [but addTarget:self action:@selector(clickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        but.layer.masksToBounds = YES;
        but.layer.cornerRadius = btnHeight/2;
        but.layer.borderWidth = 1;
        but.layer.borderColor = [UIColor magentaColor].CGColor;
        [but setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [but setTitle:titleAry[i] forState:UIControlStateNormal];
        but.titleLabel.font = titleFont;//一定要一样
        pointX += (btnWidth + padding);//每次X都加上button宽和间距5
        
        [bgView addSubview:but];
    }
    CGRect rect2 = bgView.frame;
    rect2.size.height = pointY + btnHeight + 10;
    bgView.frame = rect2;
}

-(void)clickButtonAction:(UIButton *)sender
{
    if (sender.selected) {
        return;
    }
//    _tempButton.selected = NO;
//    _tempButton.backgroundColor = [UIColor clearColor];
//
//    sender.selected = YES;
//    sender.backgroundColor = [UIColor magentaColor];
//    _tempButton = sender;
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
