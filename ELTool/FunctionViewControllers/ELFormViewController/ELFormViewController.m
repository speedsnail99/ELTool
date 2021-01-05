//
//  ELFormViewController.m
//  ELTool
//
//  Created by Fang on 2020/12/28.
//  Copyright © 2020 speedsnail. All rights reserved.
//

#import "ELFormViewController.h"
#import "FXFormModelTool.h"
#import "FXFormHeaderModel.h"
#import "FXFormHeaderView.h"
#import "FXBaseViewCell.h"
#define kcellHeight 60

@interface ELFormViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,assign)BOOL haveHeader;
@end

@implementation ELFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建视图
    [self createUserInterface];
    [self.tableView registerClass:[FXBaseViewCell class] forHeaderFooterViewReuseIdentifier:FXFormHeaderViewID];
    //
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.frame;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES]; //结束编辑
}

- (void)loadDataWithFileName:(NSString *)fileName {
    self.datas = [NSMutableArray arrayWithArray:[FXFormModelTool getFieldModelsWithFileName:fileName]];
    self.haveHeader = [self.datas.firstObject isKindOfClass:[FXFormHeaderModel class]];
}


//创建视图
- (void)createUserInterface {
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FXBaseViewCell  *cell = [tableView cellForRowAtIndexPath:indexPath];
    FXFormModel *model = [self getCurrentFormModel:indexPath];
    if (model.showInfo) {
        return;
    }
    [self.view endEditing:YES];
    [cell doSomething];
}
#pragma mark - UITableViewDataSource
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    FXFormHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:FXFormHeaderViewID];
    if (self.haveHeader) {
        FXFormHeaderModel *headerModel = self.datas[section];
        headerView.model = headerModel.header;
    }
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return self.haveHeader ? 45 : 0.001;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.haveHeader ? self.datas.count : 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.haveHeader) { //困惑 没有看懂此段代码的写法
        FXFormHeaderModel *headerModel = self.datas[section];
        return headerModel.content.count;
    }
    
    return self.datas.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    FXFormModel *model = [self getCurrentFormModel:indexPath];
    return model.height ? model.height : kcellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FXFormModel *model = [self getCurrentFormModel:indexPath];
    FXBaseViewCell *cell = [tableView dequeueReusableCellWithIdentifier:model.cellID forIndexPath:indexPath];
    [cell initWithModel:model parentVC:self];
    return cell;
}


-(FXFormModel *)getCurrentFormModel:(NSIndexPath *)indexPath{
    FXFormModel *model = [[FXFormModel alloc]init];
    if (self.haveHeader) {
        FXFormHeaderModel *headerModel = self.datas[indexPath.section];
        model = headerModel.content[indexPath.row];
    }else{
        model = self.datas[indexPath.row];
    }
     return model;
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
