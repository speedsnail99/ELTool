//
//  NSTableViewTestViewController.m
//  ELTool
//
//  Created by speedsnail on 2018/5/9.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "NSTableViewTestViewController.h"

@interface NSTableViewTestViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *testTableView;

@end

@implementation NSTableViewTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUserDataSource];
    [self createUserInterface];
    self.title = @"ELTableView";
    [self performSelector:@selector(refreshTableView) withObject:nil afterDelay:10];
}

- (void)createUserInterface
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.backgroundColor = [UIColor cyanColor];
//    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.testTableView = tableView;
}

- (void)initUserDataSource
{
//    NSArray *tempDataArray = @[@"刘德华",@"孙红雷",@"周杰伦",@"李连杰",@"TFBoys",@"杨大侠"];
    NSArray *tempDataArray = @[@"刘德华",@"孙红雷"];
    self.dataArray = [[NSMutableArray alloc] initWithArray:tempDataArray];
}

- (void)refreshTableView
{
    [self.testTableView reloadData];
}

#pragma mark - UITableViewDelegate

#pragma mark - UITableViewDataSourece
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"defaultCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"defaultCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    //设置文本
    NSString *cellName = self.dataArray[indexPath.row];
    cell.textLabel.text = cellName;
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
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
