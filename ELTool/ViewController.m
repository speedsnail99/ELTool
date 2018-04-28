//
//  ViewController.m
//  ELTool
//
//  Created by speedsnail on 2018/4/4.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ViewController.h"
#import "ELUtilityHelper.h"
#import "AFNetworking.h"
#import "ELCollectionViewController.h"
#import "ELRefreshViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"HOME";
  
    //使用url
    [self createCustomeUrl];
    //系统排序方法
    [self sortedArray];
    //创建AFnetWorking请求按钮
    [self createMutipleFunctionButtons];

}

- (void)createMutipleFunctionButtons
{
    //creatAfNetRequest
    UIButton *requestButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    [self.view addSubview:requestButton];
    requestButton.backgroundColor = [UIColor cyanColor];
    [requestButton setTitle:@"AFNet" forState:UIControlStateNormal];
    [requestButton addTarget:self action:@selector(creatAfNetRequest) forControlEvents:UIControlEventTouchUpInside];
    //创建collectioViewController跳转接Button
    UIButton *collectionVCBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, CGRectGetMaxY(requestButton.frame)+10, 100, 50)];
    [collectionVCBtn addTarget:self action:@selector(jumpToCollectionVC) forControlEvents:UIControlEventTouchUpInside];
    collectionVCBtn.backgroundColor = [UIColor cyanColor];
    [collectionVCBtn setTitle:@"CollectionVCJump" forState:UIControlStateNormal];
    [self.view addSubview:collectionVCBtn];
    //MJRefresh
    UIButton *mjRefreshBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, CGRectGetMaxY(collectionVCBtn.frame)+10, 100, 50)];
    [mjRefreshBtn addTarget:self action:@selector(createMjRefreshViewController) forControlEvents:UIControlEventTouchUpInside];
    mjRefreshBtn.backgroundColor = [UIColor cyanColor];
    [mjRefreshBtn setTitle:@"MJRefresh" forState:UIControlStateNormal];
    [self.view addSubview:mjRefreshBtn];
}

- (void)createMjRefreshViewController
{
    ELRefreshViewController *refreshVC = [[ELRefreshViewController alloc] init];
    [self.navigationController pushViewController:refreshVC animated:YES];
}

- (void)creatAfNetRequest
{
    NSString *strJson = @"http://www.kuaidi100.com/query?type=yuantong";
    
    NSMutableDictionary *paraDict = [[NSMutableDictionary alloc] init];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer new];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    [manager GET:strJson parameters:paraDict progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"result:%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
    }];
}

- (void)jumpToCollectionVC
{
    ELCollectionViewController *collectVC = [[ELCollectionViewController alloc] init];
    [self.navigationController pushViewController:collectVC animated:YES];
}

- (void)createCustomeUrl
{
    //测试功能
    NSDictionary *paraDict = @{@"nane":@"liudehua",@"age":@"18",@"school":@"yangguang"};
    NSString *resultStr = [ELUtilityHelper createUrl:@"http://baidu.com" WithParaDict:paraDict];
    NSLog(@"result:%@",resultStr);
}

- (void)sortedArray
{
    NSMutableArray *allParaKeysArray = [[NSMutableArray alloc] initWithCapacity:3];
    NSArray *dataArray = @[@"1",@"5",@"2",@"8",@"12",@"4"];
    [allParaKeysArray addObjectsFromArray:dataArray];
    NSArray *resultArray = [allParaKeysArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        NSNumber *tNumber1 = (NSNumber *)obj1;
        NSNumber *tNumber2 = (NSNumber *)obj2;
        //因为不满足sortedArrayUsingComparator方法的默认排序顺序，则需要交换
        if ([tNumber1 integerValue] < [tNumber2 integerValue])
            return NSOrderedDescending;
        return NSOrderedAscending;
    }];
    NSLog(@"sortedResult:%@",resultArray);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
