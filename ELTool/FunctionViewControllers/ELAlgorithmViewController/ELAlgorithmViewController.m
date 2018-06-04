//
//  ELAlgorithmViewController.m
//  ELTool
//
//  Created by speedsnail on 2018/6/1.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ELAlgorithmViewController.h"

@interface ELAlgorithmViewController ()

@end

@implementation ELAlgorithmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"algorithm";
    [self createUserInterface];
}

- (void)createUserInterface
{
    //barButton
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"去重" style:UIBarButtonItemStylePlain target:self action:@selector(removeRepeatWord)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

/**
 去处重复不相邻的字符串
 */
- (void)removeRepeatWord
{
//    NSMutableString * str1 = [[NSMutableString alloc] initWithFormat:@"aabcad"];
    
    NSMutableString * str1 = [[NSMutableString alloc] initWithFormat:@"aabacada"];
    for (int i = 0; i < str1.length - 1; i++) {
        for (int j = i + 1; j < str1.length ; j++) {
            // 由于字符的特殊性  无法使用 字符串 isEqualToString 进行比较 只能转化为ASCII 值进行比较  所以 需要加 unsigined 修饰
            unsigned char a = [str1 characterAtIndex:i];
            unsigned char b = [str1 characterAtIndex:j];
            if (a == b) {
                if (j - i > 1) {
                    // NSRange:  截取字符串   {j, 1} j: 第一个字符开始  1: 截取几个字符
                    NSRange  range = {j, 1};
                    [str1 deleteCharactersInRange:range];
                    j = i--;
                }
            }
        }
    }
    NSLog(@"------ %@-------", str1);
    
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
