//
//  ElCollectionViewCell.m
//  ELTool
//
//  Created by speedsnail on 2018/4/18.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ELCollectionViewCell.h"

@implementation ELCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //添加imageView
        _topImage =[[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 70, 70)];
        _topImage.backgroundColor = [UIColor cyanColor];
        [self.contentView addSubview:_topImage];
        //添加label
        _botlabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 70, 30)];
        _botlabel.textAlignment = NSTextAlignmentCenter;
        _botlabel.textColor = [UIColor blueColor];
        _botlabel.font = [UIFont systemFontOfSize:15];
        _botlabel.backgroundColor = [UIColor purpleColor];
        [self.contentView addSubview:_botlabel];
    
    }
    return self;
}
@end
