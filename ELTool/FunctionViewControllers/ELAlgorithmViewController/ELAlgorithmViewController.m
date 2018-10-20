//
//  ELAlgorithmViewController.m
//  ELTool
//
//  Created by speedsnail on 2018/6/1.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ELAlgorithmViewController.h"

@interface ELAlgorithmViewController ()
@property (nonatomic, strong) UICollectionView *mainCollectionView;
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
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"去重" style:UIBarButtonItemStylePlain target:self action:@selector(findRepeatedCharacter)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}




/**注此方法有一个重大的漏洞，在去重过程中不断去修改原字符串导致其他重复字符串判断会有问题
 *假设有一个字符串aabcad，请写一段程序，去掉字符串中不相邻的重复字符串，
 *即上述字符串处理之后的输出结果为：aabcd
 *
 */

/*
- (void)removeRepeatWord
{
//    NSMutableString * str1 = [[NSMutableString alloc] initWithFormat:@"aabcad"];
    
    NSMutableString * str1 = [[NSMutableString alloc] initWithFormat:@"aabcacd"];
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
                    --j; //这一步操作存疑，不知道是为什么
                }
            }
        }
    }
    NSLog(@"------ %@-------", str1);
    
}
*/


/*https://blog.csdn.net/ada19950118/article/details/49952189
 字符串剔除不相邻的重复字符
 */
- (void)findRepeatedCharacter
{
    NSString *originStr = @"aabcacd";
    int i=0, j=0, count, flag=0;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    for (i=0; i<originStr.length; i++)
    {
        count = 0;
        for (j=0; j<i; j++)
        {
            flag = 0;
            if ([originStr characterAtIndex:i] ==  [originStr characterAtIndex:j])
            {
                flag = 1;
                break;
            }
        }
        if (flag == 1)
            continue;
        for (j=i; j<originStr.length;j++)
        {
            if ([originStr characterAtIndex:i] ==  [originStr characterAtIndex:j])
            {
                count++;
            }
        }
        printf("%c字符的个数：%d\n",[originStr characterAtIndex:i],count);
        NSString *countStr = [NSString stringWithFormat:@"%d",count];
        NSString *characterStr = [NSString stringWithFormat:@"%c",[originStr characterAtIndex:i]];
        [dict setValue:countStr forKey:characterStr];
    }
    
    //下面我们要将个数不为1的字符单独抽离出来
    NSMutableDictionary *newDict = [NSMutableDictionary dictionary];
    for (NSString *key in dict) {
        if ([dict[key] intValue] != 1) {
            [newDict setValue:dict[key] forKey:key];
        }
    }
    
    //在接下来，确定这些字符在字符串中位置：
    NSMutableDictionary *resultDict = [NSMutableDictionary dictionary];
    for (NSString *key in newDict) {
        NSMutableArray *array = [NSMutableArray array];
        for (int i = 0; i<originStr.length; i++) {
            if ([[NSString stringWithFormat:@"%c",[originStr characterAtIndex:i]] isEqualToString:key] ) {
                [array addObject:[NSString stringWithFormat:@"%d",i]];
                [resultDict setValue:array forKey:key];
            }
        }
    }
    
    //接来下，我们需要判断相邻的位置是否相同的字符
    for (NSString *key in resultDict) {
        NSMutableArray *array = resultDict[key];
        for (int i = 0; i <array.count-1; i++) {
            if ([array[i] intValue]+1 != [array[i+1] intValue]) {
                NSUInteger number = (NSUInteger)[array[i+1] integerValue];
                NSLog(@"number %lu",(unsigned long)number);
                NSRange range = NSMakeRange(number, 1);
                originStr = [originStr stringByReplacingCharactersInRange:range  withString:@" "];
            }
        }
        
    }
    originStr = [originStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"%@",originStr);
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
