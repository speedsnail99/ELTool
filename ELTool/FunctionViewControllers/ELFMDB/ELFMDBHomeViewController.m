//
//  ELFMDBHomeViewController.m
//  ELTool
//
//  Created by snailspeed on 2018/5/24.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ELFMDBHomeViewController.h"
#import "JQFMDB.h"
#import "Person.h"

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
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString *sqlitePath = [documentPath stringByAppendingPathComponent:@"OAFMDBDirectory"];
    JQFMDB *db = [[JQFMDB shareDatabase] initWithDBName:@"OAFMDB.sqlite" path:sqlitePath];
    
    //创建表
    if (![db jq_isExistTable:@"user"]) {
        [db jq_createTable:@"user" dicOrModel:[Person class]];  
    }
    
    self.listDataArray = [NSMutableArray arrayWithArray:[db jq_lookupTable:@"user" dicOrModel:[Person class] whereFormat:nil]];
    
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
    self.listTable = listTableView;
    
    //创建barbutton
    UIBarButtonItem *addDataButton  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addData)];


    self.navigationItem.rightBarButtonItems = @[addDataButton];
}

- (void)addData
{
    Person *person = [[Person alloc] init];
    person.name = [self randomName];
    person.phoneNum = @(18866668888);
    person.photoData = UIImagePNGRepresentation([UIImage imageNamed:@"bg.jpg"]);
    person.luckyNum = 7;
    person.sex = 0;
    person.age = 26;
    person.height = 172.12;
    person.weight = 120.4555;
    
    [[JQFMDB shareDatabase] jq_insertTable:@"user" dicOrModel:person];
    
    //查找表中所有数据
    NSArray *personArr = [[JQFMDB shareDatabase] jq_lookupTable:@"user" dicOrModel:[Person class] whereFormat:nil];
    self.listDataArray = [NSMutableArray arrayWithArray:personArr];
    [self.listTable reloadData];
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
        cell.backgroundColor = [UIColor cyanColor];
    }
    if (self.listDataArray.count > indexPath.row) {
        Person *personModel = self.listDataArray[indexPath.row];
        cell.textLabel.text = personModel.name;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Person *person = self.listDataArray[indexPath.row];
        
//        [[DataBase sharedDataBase] deletePerson:person];
//        [JQFMDB shareDatabase]
        
//        @"WHERE rowid = (SELECT max(rowid) FROM user)"
        
        NSString *queryStr = [NSString stringWithFormat:@"where name = '%@'",person.name];
        BOOL deleResult = [[JQFMDB shareDatabase] jq_deleteTable:@"user" whereFormat:queryStr];
        
//        self.dataArray = [[DataBase sharedDataBase] getAllPerson];
        
        NSArray *lookupArray = [[JQFMDB shareDatabase] jq_lookupTable:@"user" dicOrModel:[Person class] whereFormat:nil];
        
        self.listDataArray = [NSMutableArray arrayWithArray:lookupArray];
        [self.listTable reloadData];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Get/Set 方法
- (NSMutableArray *)listDataArray{
    if (!_listDataArray) {
        _listDataArray = [[NSMutableArray alloc] init];
    }
    return _listDataArray;
}


// 获得随机字符名称
- (NSString *)randomName{
    
    NSString *string = [[NSString alloc]init];
    for (int i = 0; i < 7; i++) {
        int figure = (arc4random() % 26) + 97;
        char character = figure;
        NSString *tempString = [NSString stringWithFormat:@"%c", character];
        string = [string stringByAppendingString:tempString];
    }
    
    return string;
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
