//
//  CollectionViewController.m
//  ELTool
//
//  Created by speedsnail on 2018/4/18.
//  Copyright © 2018年 speedsnail. All rights reserved.
//  https://www.jianshu.com/p/16c9d466f88c

#import "ELCollectionViewController.h"
#import "ELCollectionViewCell.h"

@interface ELCollectionViewController ()<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, strong) UICollectionView *mainCollectionView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) UITableView *tempTableView;
@end

@implementation ELCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"CollectionView";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //初始化数据
    [self initUserData];
    //创建用户界面
    [self createUserInterface];
    //延迟十秒执行方法
    [self performSelector:@selector(refreshCollectionView) withObject:nil afterDelay:10];
}

- (void)initUserData
{
//    NSArray *nameArray = @[@"http://img11.soufunimg.com/sfwork/2018_03/14/M13/1B/2D/ChCE4Vqo_HGIMdGGAABPZh7R_iIABAEjgOl81gAAE9-168.jpg",@"http://img11.soufunimg.com/sfwork/2018_03/15/M0A/1B/31/ChCE4FqqIrOIWbbZAAIbQwUlaCsABAGKgO4xBoAAhtb154.jpg",@"http://img11.soufunimg.com/sfwork/2018_04/02/M0F/1B/8F/ChCE4FrB2AWIJXHwAAB3_b30eQsABAqrQPY9kUAAHgV402.jpg",@"http://img11.soufunimg.com/sfwork/2018_03/07/M14/1A/FC/ChCE4FqfRQaIU3-wAABbLEUsw-8AA_xmQITzbIAAFtE493.jpg"];
     NSArray *nameArray = @[@"http://img11.soufunimg.com/sfwork/2018_04/02/M0F/1B/8F/ChCE4FrB2AWIJXHwAAB3_b30eQsABAqrQPY9kUAAHgV402.jpg",@"http://img11.soufunimg.com/sfwork/2018_03/07/M14/1A/FC/ChCE4FqfRQaIU3-wAABbLEUsw-8AA_xmQITzbIAAFtE493.jpg"];
    self.dataArray = [NSMutableArray arrayWithArray:nameArray];
}

- (void)createUserInterface
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置滚动方向
//    layout.scrollDirection = nil
    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 10);
    //该方法也可以设置itemSize
    layout.itemSize =CGSizeMake(110/2, 150);
    //初始化collectionView
    self.mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300) collectionViewLayout:layout];
    self.mainCollectionView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.mainCollectionView];
    //注册cell 注意，此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致 均为 cellId
    [self.mainCollectionView registerClass:[ELCollectionViewCell class] forCellWithReuseIdentifier:@"ELCollectionCellId"];
    //注册headerView
    [self.mainCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
    //设置代理
    self.mainCollectionView.delegate = self;
    self.mainCollectionView.dataSource = self;
    
    //tableView
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self ;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:tableView];
//    [tableView.tableHeaderView addSubview:self.mainCollectionView];
    tableView.tableHeaderView  = self.mainCollectionView;
    self.tempTableView = tableView;
}


/**
 刷新collectionView
 */
- (void)refreshCollectionView
{
//    [self.mainCollectionView reloadData];
    
    [self.tempTableView reloadData];
    
}

#pragma mark - UICollectionViewDelegate
#pragma mark - UICollectionViewData

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ELCollectionViewCell *cell = (ELCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"ELCollectionCellId" forIndexPath:indexPath];
    cell.botlabel.text = [NSString stringWithFormat:@"{%ld,%ld}",(long)indexPath.section,(long)indexPath.row];
    cell.backgroundColor = [UIColor yellowColor];
    
    //设置图片
    NSString *imageLink = self.dataArray[indexPath.row];
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageLink]];
    UIImage *picImage = [UIImage imageWithData:imageData];
    cell.topImage.image = picImage;
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(90, 130);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}
//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}

#pragma mark - UITalbleViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
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
