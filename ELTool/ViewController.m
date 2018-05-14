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
#import "ELScreenShotsViewController.h"
#import "NSTimerViewController.h"
#import "NSTableViewTestViewController.h"
#import "ELSimpleFunctionViewController.h"
#import "ELWebViewController.h"
#import "ELCircularReferenceViewController.h"
#import "ElWindowTestViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *homeTableView;
@property (nonatomic, strong) NSMutableArray *homedataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"HOME";
  
//    //使用url
//    [self createCustomeUrl];
//    //系统排序方法
//    [self sortedArray];
    //初始化数据
    [self initUserData];
    //创建视图
    [self createUserInterface];

}


/**
 初始化数据
 */
- (void)initUserData
{
    NSArray *tempDataArray = @[@"AFNetworking",@"CollectionView",@"MJRefresh",@"ScreenShots",@"NSTimer"
                               ,@"TableView",@"SimpleFunction",@"ELWebVC",@"CircularReference",@"ELWindow"];
    self.homedataArray = [[NSMutableArray alloc] initWithArray:tempDataArray];
}


/**
 初始化视图
 */
- (void)createUserInterface
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tableView];
    [self.view addSubview:tableView];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.homedataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建、重用cell
    static  NSString *cellId = @"homeCellID";
    UITableViewCell *homeCell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!homeCell) {
        homeCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        homeCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    //cell赋值
    NSString *cellText = @"";
    if (self.homedataArray.count > indexPath.row) {
      cellText = self.homedataArray[indexPath.row];
    }
    homeCell.textLabel.text = cellText;
    return homeCell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0: //AFNetWorking
        {
            [self creatAfNetRequest];
        }
            break;
        case 1: //CollectionView
        {
            [self jumpToCollectionVC];
        }
            break;
        case 2: //MJRefresh
        {
            [self createMjRefreshViewController];
        }
            break;
        case 3: //ScreenShots
        {
            [self createsSreenShotsBtnViewController];
        }
            break;
        case 4: //NSTimer
        {
            [self createsTimerViewController];
        }
            break;
        case 5: //TabelView
        {
            [self createTableViewController];
        }
            break;
        case 6: //simpleVC
        {
            [self createSimpleViewController];
        }
            break;
        case 7: //webVC
        {
            [self createWebViewViewController];
        }
            break;
            
        case 8: //circleReference
        {
            [self createCircleReferenceViewController];
        }
            break;
        case 9: //widow
        {
            [self createWindowViewController];
        }
            break;

        default:
            break;
    }
}

- (void)createWindowViewController
{
    ElWindowTestViewController *windowVC = [[ElWindowTestViewController alloc] init];
    [self.navigationController pushViewController:windowVC animated:YES];
}

- (void)createCircleReferenceViewController
{
    ELCircularReferenceViewController *circularVC  = [[ELCircularReferenceViewController alloc] init];
    [self.navigationController pushViewController:circularVC animated:YES];
}

- (void)createWebViewViewController
{
    ELWebViewController *elWebVC = [[ELWebViewController alloc] init];
    [self.navigationController pushViewController:elWebVC animated:YES];
}

- (void)createSimpleViewController
{
    ELSimpleFunctionViewController *simpleVC = [[ELSimpleFunctionViewController alloc] init];
    [self.navigationController pushViewController:simpleVC animated:YES];
}

- (void)createTableViewController
{
    NSTableViewTestViewController *tableVC = [[NSTableViewTestViewController alloc] init];
    [self.navigationController pushViewController:tableVC animated:YES];
}


- (void)createsTimerViewController
{
    NSTimerViewController *timerVC = [[NSTimerViewController  alloc] init];
    [self.navigationController pushViewController:timerVC animated:YES];
}

- (void)createMjRefreshViewController
{
    ELRefreshViewController *refreshVC = [[ELRefreshViewController alloc] init];
    [self.navigationController pushViewController:refreshVC animated:YES];
}

- (void)createsSreenShotsBtnViewController
{
    ELScreenShotsViewController *shotsVC = [[ELScreenShotsViewController alloc] init];
    [self.navigationController pushViewController:shotsVC animated:YES];
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

/*
 - (void)createMutipleFunctionButtons
 {
 
 
 static const CGFloat  buttonWidth = 200;
 static const CGFloat  buttonHeight = 52;
 //creatAfNetRequest
 UIButton *requestButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, buttonWidth, buttonHeight)];
 [self.view addSubview:requestButton];
 requestButton.backgroundColor = [UIColor cyanColor];
 [requestButton setTitle:@"AFNet" forState:UIControlStateNormal];
 [requestButton addTarget:self action:@selector(creatAfNetRequest) forControlEvents:UIControlEventTouchUpInside];
 //创建collectioViewController跳转接Button
 UIButton *collectionVCBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, CGRectGetMaxY(requestButton.frame)+10, buttonWidth, buttonHeight)];
 [collectionVCBtn addTarget:self action:@selector(jumpToCollectionVC) forControlEvents:UIControlEventTouchUpInside];
 collectionVCBtn.backgroundColor = [UIColor cyanColor];
 [collectionVCBtn setTitle:@"CollectionVCJump" forState:UIControlStateNormal];
 [self.view addSubview:collectionVCBtn];
 //MJRefresh
 UIButton *mjRefreshBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, CGRectGetMaxY(collectionVCBtn.frame)+10, buttonWidth, buttonHeight)];
 [mjRefreshBtn addTarget:self action:@selector(createMjRefreshViewController) forControlEvents:UIControlEventTouchUpInside];
 mjRefreshBtn.backgroundColor = [UIColor cyanColor];
 [mjRefreshBtn setTitle:@"MJRefresh" forState:UIControlStateNormal];
 [self.view addSubview:mjRefreshBtn];
 
 // screenShotsBtn
 UIButton *screenShotsBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, CGRectGetMaxY(mjRefreshBtn.frame)+10, buttonWidth, buttonHeight)];
 [screenShotsBtn addTarget:self action:@selector(createsSreenShotsBtnViewController) forControlEvents:UIControlEventTouchUpInside];
 screenShotsBtn.backgroundColor = [UIColor cyanColor];
 [screenShotsBtn setTitle:@"screenBtn" forState:UIControlStateNormal];
 [self.view addSubview:screenShotsBtn];
 
 // screenShotsBtn
 UIButton *timerBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, CGRectGetMaxY(screenShotsBtn.frame)+10, buttonWidth, buttonHeight)];
 [timerBtn addTarget:self action:@selector(createsTimerViewController) forControlEvents:UIControlEventTouchUpInside];
 timerBtn.backgroundColor = [UIColor cyanColor];
 [timerBtn setTitle:@"timerBtn" forState:UIControlStateNormal];
 [self.view addSubview:timerBtn];
 
 // screenShotsBtn
 UIButton *tableBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, CGRectGetMaxY(timerBtn.frame)+10, buttonWidth, buttonHeight)];
 [tableBtn addTarget:self action:@selector(createTableViewController) forControlEvents:UIControlEventTouchUpInside];
 tableBtn.backgroundColor = [UIColor cyanColor];
 [tableBtn setTitle:@"tableBtn" forState:UIControlStateNormal];
 [self.view addSubview:tableBtn];
 }
 */


@end
