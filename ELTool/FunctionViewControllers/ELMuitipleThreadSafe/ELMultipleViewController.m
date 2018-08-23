//
//  ELMultipleViewController.m
//  ELTool
//
//  Created by speed snail on 2018/8/8.
//  Copyright © 2018年 speedsnail. All rights reserved.
//  iOS多线程下的数据安全
//  https://www.jianshu.com/p/2b973cb8a272

#import "ELMultipleViewController.h"

@interface ELMultipleViewController ()
@property (nonatomic,strong) NSMutableArray *dataSource;




@end


@implementation ELMultipleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title  = @"多线程访问数据安全";
    [self createUserInterface];
    [self configData];

}

- (void)configData
{
    self.dataSource = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0 ; i < 100; i ++) {
        NSString *str = [NSString stringWithFormat:@"Obj - %i", i];
        [self.dataSource addObject:str];
    }
}

- (void)createUserInterface
{
    
    
    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    startButton.frame = CGRectMake(100, 100, 100, 100);
    startButton.backgroundColor = [UIColor cyanColor];
    [startButton setTitle:@"start" forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startButton];
    
    
    UIButton *removeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    removeButton.frame = CGRectMake(100, CGRectGetMaxY(startButton.frame) +20, 100, 100);
    removeButton.backgroundColor = [UIColor cyanColor];
    [removeButton setTitle:@"remove" forState:UIControlStateNormal];
    [removeButton addTarget:self action:@selector(removeAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:removeButton];

}

- (void)startAction:(UIButton *)btn
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        @synchronized (self.dataSource) {
            for (int i = 0 ; i < self.dataSource.count ; i ++) {
                [NSThread sleepForTimeInterval:1];
                ELLogDebug(@"%@",self.dataSource[i]);
                ELLogDebug(@"currentThread:%@" ,[NSThread currentThread]);
            }
        }
    
    });
    
    
}

- (void)removeAction:(UIButton *)btn
{
    @synchronized (self.dataSource) {
       [self.dataSource removeAllObjects];
    }
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
