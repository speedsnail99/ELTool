//
//  ELGCDSemaphoreViewController.m
//  ELTool
//
//  Created by speedsnail on 2018/6/6.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ELGCDSemaphoreViewController.h"
#import "AFNetworking.h"

@interface ELGCDSemaphoreViewController ()

@end

@implementation ELGCDSemaphoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUserInterface];
}

- (void)createUserInterface
{
    NSArray *itemArray = [[NSArray alloc] initWithObjects:@"请求",@"空白", nil];
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:itemArray];
    segmentControl.frame = CGRectMake(100, 100, kScreenWidth - 2*100, 30);
    [self.view addSubview:segmentControl];
    [segmentControl addTarget:self action:@selector(changeSegmentControl:) forControlEvents:UIControlEventValueChanged];
}

- (void)changeSegmentControl:(UISegmentedControl *)segment
{
    [self getNetworkingData];
}



/**
 *https://blog.csdn.net/intheair100/article/details/51492262
 *GCD－两个网络请求同步问题
 */
- (void)getNetworkingData
{
    
    NSString *appIdKey = @"8781e4ef1c73ff20a180d3d7a42a8c04";
    NSString* urlString_1 = @"http://api.openweathermap.org/data/2.5/weather";
    NSString* urlString_2 = @"http://api.openweathermap.org/data/2.5/forecast/daily";
    NSDictionary* dictionary =@{@"lat":@"40.04991291",
                                @"lon":@"116.25626162",
                                @"APPID" : appIdKey};
    
    
    // 创建组
    dispatch_group_t group = dispatch_group_create();
    // 将第一个网络请求任务添加到组中
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 创建信号量
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        // 开始网络请求任务
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager GET:urlString_1
          parameters:dictionary
            progress:nil
             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                 NSLog(@"成功请求数据1:%@",[responseObject class]);
                 // 如果请求成功，发送信号量
                 dispatch_semaphore_signal(semaphore);
                 
                 NSLog(@"%@",[NSThread currentThread]);
                 NSLog(@"");
             } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                 NSLog(@"失败请求数据");
                 // 如果请求失败，也发送信号量
                 dispatch_semaphore_signal(semaphore);
             }];
        // 在网络请求任务成功之前，信号量等待中
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    });
    
    dispatch_group_notify(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"完成了网络请求，不管网络请求失败了还是成功了。");
    });
    
    // 将第二个网络请求任务添加到组中
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 创建信号量
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        // 开始网络请求任务
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager GET:urlString_2
          parameters:dictionary
            progress:nil
             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                 NSLog(@"成功请求数据2:%@",[responseObject class]);
                 // 如果请求成功，发送信号量
                 dispatch_semaphore_signal(semaphore);
             } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                 NSLog(@"失败请求数据");
                 // 如果请求失败，也发送信号量
                 dispatch_semaphore_signal(semaphore);
             }];
        // 在网络请求任务成功之前，信号量等待中
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    });
    
    
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
