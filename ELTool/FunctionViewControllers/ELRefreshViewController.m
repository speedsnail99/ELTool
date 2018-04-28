//
//  SFRefreshViewController.m
//  ELTool
//
//  Created by speedsnail on 2018/4/21.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ELRefreshViewController.h"
#import "MJRefresh.h"
#define  kScreenWidth   [UIScreen mainScreen].bounds.size.width
#define kScreenHeight  [UIScreen mainScreen].bounds.size.height

@interface ELRefreshViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *refreshTableView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation ELRefreshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"MJRefresh";
    [self createData];
    [self createUserInterface];

}

- (void)createUserInterface
{
    //创建tableView
    UITableView *refreshTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth , kScreenHeight)];
    refreshTableView.backgroundColor = [UIColor yellowColor];
    refreshTableView.delegate = self;
    refreshTableView.dataSource = self;
    [self.view addSubview:refreshTableView];
    self.refreshTableView = refreshTableView;
    //默认【下拉刷新】
    refreshTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
    //默认【上拉加载】
//    refreshTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
}



- (void)createData
{
    self.dataArray = @[@"1",@"2",@"3",@"4",@"5"];
}

- (void)refresh
{
    NSLog(@"refreshn");
    [self performSelector:@selector(hideRefresh) withObject:nil afterDelay:3];
}

- (void)hideRefresh
{
    [self.refreshTableView.mj_header endRefreshing];
}



- (void)loadMore
{
    NSLog(@"loadMore");
    [self performSelector:@selector(hideLoad) withObject:nil afterDelay:2];
}

- (void)hideLoad
{
    [self.refreshTableView.mj_footer endRefreshing];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
     cell  = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"cellText(%ld,%ld)",indexPath.section,indexPath.row];
    return cell;
}
#pragma mark - UITableViewDelegate
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
