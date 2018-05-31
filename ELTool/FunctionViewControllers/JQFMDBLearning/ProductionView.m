//
//  ProductionView.m
//  ELTool
//
//  Created by snailspeed on 2018/5/31.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ProductionView.h"
#import "JQFMDB.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

@interface ProductionView ()

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UISegmentedControl *segment;
@property (nonatomic, strong)UIScrollView *sView;
@property (nonatomic, strong)UILabel *alertLabel;
@property (nonatomic, strong)NSArray *dataArr;
@property (nonatomic, strong)NSMutableArray *columnNameArr;
@property (nonatomic, strong)NSMutableArray *blockArr;

@end

@implementation ProductionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.blockArr = [[NSMutableArray alloc] initWithCapacity:0];
        [self configureViews];
    }
    return self;
}

- (void)configureViews
{
    NSArray *libraryPathArray = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryPath = [libraryPathArray objectAtIndex:0];
    
    // 这里执行创建数据库,以后的shareDatabase系列都属于获取当前的数据库引用
    JQFMDB *db = [JQFMDB shareDatabase:@"qq.sqlite" path:libraryPath];
    
    //
    [self createSegmentAndSubViews];
    
    
}

- (void)createSegmentAndSubViews
{
    static CGFloat segmentHeight = 30;
    NSArray *segmentItemArray = @[@"插入", @"删除", @"更改", @"查找", @"事务操作"];
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:segmentItemArray];
    segmentControl.frame = CGRectMake(0, 0, kWidth, segmentHeight);
    segmentControl.tintColor = [UIColor blueColor];
    segmentControl.backgroundColor = [UIColor whiteColor];
    [segmentControl setSelectedSegmentIndex:0];
    self.segment = segmentControl;
    [self addSubview:segmentControl];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(segmentControl.frame), kWidth, kHeight/2)];
    scrollView.contentSize = CGSizeMake(kWidth * segmentItemArray.count, kHeight/2);
    self.sView = scrollView;
    [self addSubview:self.sView];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
