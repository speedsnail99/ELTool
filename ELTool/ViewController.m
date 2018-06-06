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
#import "ELNewFunctionGuideViewController.h"
#import "ELFirstPresentViewController.h"
#import "ELXMLParseViewController.h"
#import "ELFMDBHomeViewController.h"
#import "ELJQFMDBHomeViewController.h"
#import "ELAVPlayerViewController.h"
#import "ELAlgorithmViewController.h"
#import "ELGCDSemaphoreViewController.h"


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
    NSArray *tempDataArray = @[@"fingerprintUnlock",@"AFNetworking",@"CollectionView",@"MJRefresh",@"AlgorithmViewController",@"ScreenShots",@"NSTimer" ,@"TableView",@"SimpleFunction",@"ELWebVC",@"CircularReference",@"ELWindow",@"ELNewFunctionGuide",@"ELPresentVC",@"XMLParser",@"ELFMDB",@"AVPlyaerViewController",@"JQFMDBLearming",@"GCDSemaphore"];
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
    NSString *name = [self.homedataArray objectAtIndex:indexPath.row];
    if ([name isEqualToString:@"AFNetworking"]) {
        
        [self creatAfNetRequest];
        
    } else if ([name isEqualToString:@"CollectionView"]) {
        [self jumpToCollectionVC];
        
    } else if ([name isEqualToString:@"MJRefresh"]) {
        
        [self createMjRefreshViewController];
        
    } else if ([name isEqualToString:@"ScreenShots"]) {
        
        [self createsSreenShotsBtnViewController];
        
    } else if ([name isEqualToString:@"NSTimer"]) {
        
        [self createsTimerViewController];
        
    } else if ([name isEqualToString:@"TableView"]) {
        
        [self createTableViewController];
        
    } else if ([name isEqualToString:@"SimpleFunction"]) {
        
        [self createSimpleViewController];
        
    } else if ([name isEqualToString:@"ELWebVC"]) {
        
        [self createWebViewViewController];
        
    } else if ([name isEqualToString:@"CircularReference"]) {
        
        [self createCircleReferenceViewController];
        
    } else if ([name isEqualToString:@"ELWindow"]) {
        
        [self createWindowViewController];
        
    } else if ([name isEqualToString:@"ELNewFunctionGuide"]) {
        
        [self createFuntionGuideViewController];
        
    } else if ([name isEqualToString:@"ELPresentVC"]) {
        
        [self createPresentViewController];
        
    } else if ([name isEqualToString:@"XMLParser"]) {
        
        [self createXMLParserViewController];
        
    } else if ([name isEqualToString:@"ELFMDB"]) {
        
        [self createFMDBViewController];
        
    } else if ([name isEqualToString:@"AVPlyaerViewController"]) {
        
        [self createAVPlayerViewController];
        
    } else if ([name isEqualToString:@"JQFMDBLearming"]) {
        
        [self createLearningJQFMDBViewController];
    } else if ([name isEqualToString:@"AlgorithmViewController"]) {
        
        [self createAlgorithmViewController];
    } else if ([name isEqualToString:@"GCDSemaphore"]) {
        
        [self createGCDSemaphoreViewController];
    } else if ([name isEqualToString:@"fingerprintUnlock"]) {
        //指纹解锁
    }
    
}

- (void)createGCDSemaphoreViewController
{
    ELGCDSemaphoreViewController *semaphoreVC = [[ELGCDSemaphoreViewController alloc] init];
    [self.navigationController pushViewController:semaphoreVC animated:YES];
}

- (void)createAlgorithmViewController
{
    ELAlgorithmViewController *algorithmVC = [[ELAlgorithmViewController alloc] init];
    [self.navigationController pushViewController:algorithmVC animated:YES];
}


- (void)createLearningJQFMDBViewController
{
    ELJQFMDBHomeViewController *jqfmVC = [[ELJQFMDBHomeViewController alloc] init];
    [self.navigationController pushViewController:jqfmVC animated:YES];
}


- (void)createAVPlayerViewController
{
    ELAVPlayerViewController *avPlayer = [[ELAVPlayerViewController alloc] init];
    [self.navigationController pushViewController:avPlayer animated:YES];
}

- (void)createFMDBViewController
{
    ELFMDBHomeViewController *fmVC = [[ELFMDBHomeViewController alloc] init];
    [self.navigationController pushViewController:fmVC animated:YES];
}

- (void)createXMLParserViewController
{
    ELXMLParseViewController *xmlParserVC = [[ELXMLParseViewController alloc] init];
    [self.navigationController pushViewController:xmlParserVC animated:YES];
}

- (void)createPresentViewController
{
    ELFirstPresentViewController *firstPresentVC = [[ELFirstPresentViewController alloc] init];
    [self presentViewController:firstPresentVC animated:YES completion:^{
        
        NSLog(@"presentedVC:%@",self.presentedViewController);
        NSLog(@"presentingVC:%@",self.presentingViewController);
        NSLog(@"presentFirstVC");
    }];
    
}

- (void)createFuntionGuideViewController
{
    ELNewFunctionGuideViewController *newFuncionVC = [[ELNewFunctionGuideViewController alloc] init];
    [self.navigationController pushViewController:newFuncionVC animated:YES];
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

- (void)deleteRepititeChracter
{
    NSString *orinStr = @"aabcad";
    NSMutableArray *characterArray = [[NSMutableArray alloc] initWithCapacity:orinStr.length];
    for (int i = 0; i < orinStr.length ; i ++) {
        NSRange characterRange = NSMakeRange(i, 1);
        NSString *subStr = [orinStr substringWithRange:characterRange];
        [characterArray addObject:subStr];
    }
    
    for (int i = 0 ; i < characterArray.count ; i ++) {
        NSString *masterCharact = characterArray[i];
        for (int j = i+1 ; j < characterArray.count - i; j ++) {
            NSString *subCharact = characterArray[j];
            
        }
    }
    
    ELLogDebug(@"character%@",characterArray);
}

- (void)removeRepeatWord:(NSString *)string {
    
    // 分词
    NSString * word = @"";
    NSMutableArray * allArray = [NSMutableArray new];
    NSMutableArray * repeatWordArray = [NSMutableArray new];
   
    for (NSInteger i = 0; i < string.length; i ++) {
        
        NSString * charStr = [string substringWithRange:NSMakeRange(i, 1)];
        if (![repeatWordArray containsObject:charStr]) {
            
            [repeatWordArray addObject:charStr];
        }
        if ([word hasSuffix:charStr]) {
            
            word = [NSString stringWithFormat:@"%@%@", word, charStr];
        }
        else {
            
            if (word.length > 1) [allArray addObject:word];
            else [allArray addObject:charStr];
            word = charStr;
        }
    }
    
    NSString * resultStr = @"";
    for (NSString * str in allArray) {
        
        if (str.length == 1) {
            
            if (![repeatWordArray containsObject:str]) {
                
                resultStr = [NSString stringWithFormat:@"%@%@", resultStr, str];
            }
        }
        else {
            
            resultStr = [NSString stringWithFormat:@"%@%@", resultStr, str];
        }
    }
    NSLog(@"%@", resultStr);
}

@end
