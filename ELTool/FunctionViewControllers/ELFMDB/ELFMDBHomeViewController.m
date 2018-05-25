//
//  ELFMDBHomeViewController.m
//  ELTool
//
//  Created by snailspeed on 2018/5/24.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ELFMDBHomeViewController.h"

@interface ELFMDBHomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *listTable;
@property (nonatomic, strong) NSMutableArray *listDataArray;
@end

@implementation ELFMDBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"FMDBHome";
    
    [self createListData];
    [self createUserInterface];
   
}


/**
 初始化数据
 */
- (void)createListData
{
    self.listDataArray = [[NSMutableArray alloc] init];
    [self.listDataArray addObject:@"0"];
    [self.listDataArray addObject:@"1"];
    [self.listTable reloadData];
}



/**
 创建视图
 */
- (void)createUserInterface
{
    UITableView *listTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    listTableView.backgroundColor = [UIColor whiteColor];
    
    listTableView.delegate = self;
    listTableView.dataSource = self;
    [self.view addSubview:listTableView];
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.listDataArray.count;
}


#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"firstCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.backgroundColor = [UIColor cyanColor];
    }
    NSString *cellText = self.listDataArray[indexPath.row];
    cell.textLabel.text = cellText;
    return cell;
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
