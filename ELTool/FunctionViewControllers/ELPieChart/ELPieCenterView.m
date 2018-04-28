//
//  ELPieCenterView.m
//  ELTool
//
//  Created by speedsnail on 2018/4/23.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ELPieCenterView.h"
@interface ELPieCenterView()

@property(nonatomic, strong) UIView *centerView;

@end

@implementation ELPieCenterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.4];
        UIView *centerView = [[UIView alloc] init];
        centerView.backgroundColor = [UIColor whiteColor];
        [self addSubview:centerView];
        self.centerView = centerView;
       
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        nameLabel.font = [UIFont systemFontOfSize:18];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        self.nameLabel = nameLabel;
        [centerView addSubview:nameLabel];

    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.layer.cornerRadius = self.frame.size.width * 0.5;
    self.layer.masksToBounds = true;
    
    self.centerView.frame = CGRectMake(6, 6, self.frame.size.width - 6 * 2, self.frame.size.height - 6 * 2);
    self.centerView.layer.cornerRadius = self.centerView.frame.size.width * 0.5;
    self.centerView.layer.masksToBounds = true;
    
    self.nameLabel.frame = self.centerView.bounds;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
