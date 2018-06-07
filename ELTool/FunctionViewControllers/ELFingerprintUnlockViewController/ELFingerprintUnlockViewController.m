//
//  ELFingerprintUnlockViewController.m
//  ELTool
//
//  Created by speedsnail on 2018/6/6.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ELFingerprintUnlockViewController.h"
#import "TDTouchID.h"


@interface ELFingerprintUnlockViewController ()

@end

@implementation ELFingerprintUnlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"指纹解锁";
    [self createuserInterface];
}

- (void)createuserInterface
{
    UIButton *touchIDButton = [[UIButton alloc] init];
    [touchIDButton setBackgroundImage:[UIImage imageNamed:@"touchID.png"] forState:UIControlStateNormal];
    [touchIDButton addTarget:self action:@selector(touchVerification) forControlEvents:UIControlEventTouchDown];
    touchIDButton.frame = CGRectMake((self.view.frame.size.width / 2) - 30, (self.view.frame.size.height / 2) - 30, 60, 60);
    [self.view addSubview:touchIDButton];
   
}





/**
 验证 TouchID
 
 */
- (void)touchVerification {
    
    TDTouchID *touchID = [[TDTouchID alloc] init];
    
    [touchID td_showTouchIDWithDescribe:nil BlockState:^(TDTouchIDState state, NSError *error) {
        
        if (state == TDTouchIDStateNotSupport) {    //不支持TouchID
            
            UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"当前设备不支持TouchID" message:@"请输入密码" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            alertview.alertViewStyle = UIAlertViewStyleSecureTextInput;
            [alertview show];
            
            
        } else if (state == TDTouchIDStateSuccess) {    //TouchID验证成功
            
//            NSLog(@"jump");
//            TDHomeViewController *homeVc = [[TDHomeViewController alloc] init];
//            [self.navigationController pushViewController:homeVc animated:YES];
            
        } else if (state == TDTouchIDStateInputPassword) { //用户选择手动输入密码
            
            UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:nil message:@"请输入密码" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            alertview.alertViewStyle = UIAlertViewStyleSecureTextInput;
            [alertview show];
            
        }
        
        // ps:以上的状态处理并没有写完全!
        // 在使用中你需要根据回调的状态进行处理,需要处理什么就处理什么
        
        
        
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
