//
//  ELSimpleFunctionViewController.m
//  ELTool
//
//  Created by speedsnail on 2018/5/10.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ELSimpleFunctionViewController.h"


@interface ELSimpleFunctionViewController ()
@property (nonatomic, assign) NSInteger page ;
@end

@implementation ELSimpleFunctionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"ELSimgpleFunction";
    [self createUserInterface];
}

- (void)createUserInterface
{
//   self.view.backgroundColor = [UIColor whiteColor];
//   static const CGFloat buttonWidth = 100;
//   static const CGFloat buttonHeight = 50;
//   UIButton *soretedBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, buttonWidth, buttonHeight)];
//   [soretedBtn addTarget:self action:@selector(soredArrayItems) forControlEvents:UIControlEventTouchUpInside];
//   soretedBtn.backgroundColor = [UIColor cyanColor];
//   [soretedBtn setTitle:@"soretedBtn" forState:UIControlStateNormal];
//   [self.view addSubview:soretedBtn];
//
//   UIButton *blockBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100 + buttonHeight + 50, buttonWidth, buttonHeight)];
//   [blockBtn addTarget:self action:@selector(blockChange) forControlEvents:UIControlEventTouchUpInside];
//   blockBtn.backgroundColor = [UIColor cyanColor];
//   [blockBtn setTitle:@"BlockBtn" forState:UIControlStateNormal];
//   [self.view addSubview:blockBtn];
//
//
//
//   self.page = 3;
//   __weak __typeof(&*self)weakSelf = self;
//   self.myBlock = ^{
//      weakSelf.page ++;
//   };
   
//   UIView *firstView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//   [self.view addSubview:firstView];
//   firstView.backgroundColor = [UIColor cyanColor];
//
//   UIView *secondView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
//   secondView.backgroundColor = [UIColor greenColor];
//
//   [firstView addSubview:secondView];
   
   CGFloat btnWidth = 80;
   CGFloat btnHeight = 20;
   UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
   button.frame = CGRectMake(100, 100, btnWidth, btnHeight);
   button.backgroundColor = [UIColor clearColor];
   //设置button正常状态下的图片
//   [button setImage:[UIImage imageNamed:@"chatVCImageReloadBtn.png"] forState:UIControlStateNormal];
   //设置button高亮状态下的图片
//   [button setImage:[UIImage imageNamed:@"chatVCImageReloadBtn.png"] forState:UIControlStateHighlighted];
//   CGFloat btnImageWidth = button.imageView.frame.size.width;
//   //设置button正常状态下的背景图
//   [button setBackgroundImage:[UIImage imageNamed:@"_normal.png"] forState:UIControlStateNormal];
//   //设置button高亮状态下的背景图
//   [button setBackgroundImage:[UIImage imageNamed:@"_highlighted.png"] forState:UIControlStateHighlighted];
   //button图片的偏移量，距上左下右分别(10, 10, 10, 60)像素点
//   button.imageEdgeInsets = UIEdgeInsetsMake(0, -(btnWidth - btnImageWidth), 0, 0);
//   [button setTitle:@"重" forState:UIControlStateNormal];
//   button.titleLabel.adjustsFontSizeToFitWidth = YES;
   //button标题的偏移量，这个偏移量是相对于图片的
//   button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
   //设置button正常状态下的标题颜色
   [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
   //设置button高亮状态下的标题颜色
   [button setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
   button.titleLabel.font = [UIFont systemFontOfSize:12];
   [self.view addSubview:button];
   button.backgroundColor = [UIColor cyanColor];
   [button addTarget:self action:@selector(userTap:) forControlEvents:UIControlEventTouchUpInside];
   
   //uiimageView
   UIImage *picImage = [UIImage imageNamed:@"chatVCImageReloadBtn.png"];
   UIImageView *picImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, btnHeight, btnHeight)];
   [picImageView setImage:picImage];
   [button addSubview:picImageView];
   // uilabel
   UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(picImageView.frame), CGRectGetMinY(picImageView.frame), btnWidth - btnHeight, btnHeight)];
   titleLabel.textAlignment = NSTextAlignmentLeft;
   titleLabel.textColor = [UIColor blueColor];
   titleLabel.font = [UIFont systemFontOfSize:12];
   titleLabel.text = @"重新加载";
   [button addSubview:titleLabel];
}

- (void)userTap:(UIButton *)btn
{
   ELLogDebug(@"babyHasTouch");
}


- (void)blockChange
{
//   self.myBlock();
//   ELLogDebug(@"page:%ld",self.page);
   
   UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"" message:@"哈哈哈" preferredStyle:UIAlertControllerStyleAlert];
   
   UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
      NSLog(@"Cancel Action");
   }];
   
   UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
      NSLog(@"OK Action");
   }];
   
   [alertVC addAction:cancelAction];
   [alertVC addAction:okAction];
   [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)soredArrayItems
{
    NSMutableArray *oriArray = [[NSMutableArray alloc] init];
    NSArray *numArray = @[@"1",@"3",@"9",@"2",@"6"];
    NSArray *tempOneArray = [numArray sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1,NSString *obj2) {
        if ([obj1 compare:obj2] == NSOrderedAscending) {
            return NSOrderedAscending;
        } else {
            return NSOrderedDescending;
        }
    }];
    
    
    NSArray *tempSecondArray = [numArray sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1,NSString *obj2) {
        if ([obj1 compare:obj2] == NSOrderedAscending) {
            return NSOrderedDescending;
        } else {
            return NSOrderedAscending;
        }
    }];
    
    NSLog(@"%@",numArray);
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
