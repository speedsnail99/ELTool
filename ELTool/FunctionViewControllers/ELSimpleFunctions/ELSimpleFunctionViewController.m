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
   self.view.backgroundColor = [UIColor whiteColor];
   static const CGFloat buttonWidth = 100;
   static const CGFloat buttonHeight = 50;
   UIButton *soretedBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, buttonWidth, buttonHeight)];
   [soretedBtn addTarget:self action:@selector(soredArrayItems) forControlEvents:UIControlEventTouchUpInside];
   soretedBtn.backgroundColor = [UIColor cyanColor];
   [soretedBtn setTitle:@"soretedBtn" forState:UIControlStateNormal];
   [self.view addSubview:soretedBtn];
   
   UIButton *blockBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100 + buttonHeight + 50, buttonWidth, buttonHeight)];
   [blockBtn addTarget:self action:@selector(blockChange) forControlEvents:UIControlEventTouchUpInside];
   blockBtn.backgroundColor = [UIColor cyanColor];
   [blockBtn setTitle:@"BlockBtn" forState:UIControlStateNormal];
   [self.view addSubview:blockBtn];
   
   
   
   self.page = 3;
   __weak __typeof(&*self)weakSelf = self;
   self.myBlock = ^{
      weakSelf.page ++;
   };
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
