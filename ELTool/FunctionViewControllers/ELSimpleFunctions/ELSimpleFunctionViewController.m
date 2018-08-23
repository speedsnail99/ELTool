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
   
   
   //判断 componentsSeparated方法切割在特殊位置的数据，生成的数组
//   [self createStringSeparate];

   //判断特殊枚举值
//   [self createEnumator];
  
   //tag值判断视图
//   [self createTagView];
  
}

- (void)createTagView
{
   CGFloat holdViewHeight = 200;
   UIView *holdView = [[UIView alloc] initWithFrame:CGRectMake(10, 100, kScreenWidth - 2*10, holdViewHeight)];
   holdView.backgroundColor = [UIColor cyanColor];
   [self.view addSubview:holdView];
   
   UIView *firstV = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
   firstV.backgroundColor = [UIColor redColor];
   firstV.tag = 10031;
   [holdView addSubview:firstV];
   
   UIView *secondV = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(firstV.frame) + 10, 20, 20)];
   secondV.backgroundColor = [UIColor purpleColor];
   secondV.tag = 10031;
   [holdView addSubview:secondV];
   
}


/**
 判断 componentsSeparated方法切割在特殊位置的数据，生成的数组
 */
- (void)createStringSeparate
{
      NSString  *tempStr = @"a你好的";
      NSArray *resultArray = [tempStr componentsSeparatedByString:@"a"];
      ELLogDebug(@"resultArray%@",resultArray);
}


/**
 判断特殊枚举值
 */
- (void)createEnumator
{
   //自定义枚举类型参数如果没有赋值，那么默认值 self.ctype 会是0
      if (self.ctype == SFNoticeDetailType_normal) {
         ELLogDebug(@"true");
      } else {
         ELLogDebug(@"false");
      }
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
   CGFloat btnHeight = 100;
   UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
   button.frame = CGRectMake(100, 100, btnWidth, btnHeight);
   button.backgroundColor = [UIColor cyanColor];
   [button addTarget:self action:@selector(callSomeBody) forControlEvents:UIControlEventTouchUpInside];
   [self.view addSubview:button];
   
   UIButton *secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
   secondButton.frame = CGRectMake(CGRectGetMinX(button.frame), CGRectGetMaxY(button.frame) + 20, btnWidth, btnHeight);
   secondButton.backgroundColor = [UIColor blueColor];
   [self.view addSubview:secondButton];
   [secondButton addTarget:self action:@selector(secondDoSomeThing) forControlEvents:UIControlEventTouchUpInside];
   
   /*
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
   
   //BlockBtn
   
   UIButton *blockbutton = [UIButton buttonWithType:UIButtonTypeCustom];
   blockbutton.frame = CGRectMake(100, CGRectGetMaxY(button.frame) + 30, btnWidth, btnHeight);
   blockbutton.backgroundColor = [UIColor cyanColor];
   [blockbutton setTitle:@"Block" forState:UIControlStateNormal];
   blockbutton.backgroundColor = [UIColor cyanColor];
   [blockbutton addTarget:self action:@selector(changeMYBlock) forControlEvents:UIControlEventTouchUpInside];
   [self.view addSubview:blockbutton];
    
    */
}

- (void)callSomeBody
{
   

   
//   for (int i = 0 ; i < 10 ; i ++) {
//      dispatch_async(dispatch_queue_create("saveSocketMessage", DISPATCH_QUEUE_SERIAL), ^{
//         ELLogDebug(@"currentThread:%@",[NSThread currentThread]);
//      });
//   }
   
   // 主线程队列
//   dispatch_queue_t queue1=  dispatch_get_main_queue();
//   dispatch_async(queue1, ^{
//      ELLogDebug(@"callSomeBody:%@",[NSThread currentThread]);
//   });
   
   
   /***串行队列****/
//   dispatch_queue_t seria1 = dispatch_queue_create("helloSeria", DISPATCH_QUEUE_SERIAL);
//
//   dispatch_async(seria1, ^{
//       NSLog(@"我是第一个任务, 当前线程:%@ ,是否主线程%d",[NSThread currentThread],[NSThread isMainThread]);
//   });
//
//   dispatch_async(seria1, ^{
//       NSLog(@"我是第二个任务, 当前线程:%@ ,是否主线程%d",[NSThread currentThread],[NSThread isMainThread]);
//   });
//
//   dispatch_async(seria1, ^{
//       NSLog(@"我是第三个任务, 当前线程:%@ ,是否主线程%d",[NSThread currentThread],[NSThread isMainThread]);
//   });
//
//   dispatch_async(seria1, ^{
//       NSLog(@"我是第四个任务, 当前线程:%@ ,是否主线程%d",[NSThread currentThread],[NSThread isMainThread]);
//   });
   
   /****并行队列***/
//   dispatch_queue_t concurrentQ = dispatch_queue_create("concurrentQ", DISPATCH_QUEUE_CONCURRENT);
//   dispatch_async(concurrentQ , ^{
//
//   });
   
//   dispatch_queue_t queueC;
//   if (!queueC) {
//      ELLogDebug(@"不存在");
//   } else {
//      ELLogDebug(@"存在")
//   }
   
//   NSString *myName = nil;
//   NSAssert(myName != nil, @"名字不能为空！");
//   NSLog(@"My name is %@.",myName);

   
   [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"iOSTencentTest://cc.com"]];

}

- (void)secondDoSomeThing
{
   ELLogDebug(@"secondButtonTapeed");
}

//block赋值
- (void)simpleFuntionBlock:(ccBlock)completion
{
   self.myBlock = completion;
}

//执行block
- (void)changeMYBlock
{
   self.myBlock();
}

- (void)userTap:(UIButton *)btn
{
   ELLogDebug(@"postZhou");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"zhou" object:nil];
   
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
