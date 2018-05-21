//
//  DPScreenshotsPopView.m
//  DPScreenshots
//
//  Created by dp on 17/5/24.
//  Copyright © 2017年 dp. All rights reserved.
//
static const float RealSrceenHight =  667.0;
static const float RealSrceenWidth =  375.0;
#define DPRGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define DPSCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height
#define DPSCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width
#define DPSCREEN_BOUNDS         [UIScreen mainScreen].bounds
#define DPAdaptationH(x) x/RealSrceenHight*[[UIScreen mainScreen]bounds].size.height
#define DPAdaptationW(x) x/RealSrceenWidth*[[UIScreen mainScreen]bounds].size.width
//适配iOS10字体变大的缘故
#define IOS_VERSION_10_OR_LATER (([[[UIDevice currentDevice]systemVersion]floatValue]>=10.0)? (YES):(NO))

#define DPAdapationLabelFont(n) (IOS_VERSION_10_OR_LATER?((n-1)*([[UIScreen mainScreen]bounds].size.width/375.0f)):(n*([[UIScreen mainScreen]bounds].size.width/375.0f)))
#import "DPScreenshotsPopView.h"
#import "YLButton.h"
@interface DPScreenshotsPopView ()
@property (nonatomic, copy) ActionSheetDidSelectSheetBlock selectSheetBlock;
@property (nonatomic,strong) UIImage *shotsImage;
@property (nonatomic,strong) UIButton *maskView;
@property (nonatomic,strong) UIImageView *shotsImageView;
@property (nonatomic,strong) UIView *bottomView;
@end

@implementation DPScreenshotsPopView
-(UIView *)maskView{
    if (_maskView==nil) {
        _maskView = [UIButton buttonWithType:UIButtonTypeCustom];
        _maskView.frame = [UIScreen mainScreen].bounds;
        _maskView.backgroundColor = [UIColor blackColor];
        [_maskView addTarget:self action:@selector(hiddenView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _maskView;
}
-(UIImageView *)shotsImageView{
    if (_shotsImageView==nil) {
        
        CGFloat width = 188 * 1.1; //188
        CGFloat height = 334 * 1.1;   //334*(240/188);
//        _shotsImageView=[[UIImageView alloc]initWithFrame:CGRectMake((DPSCREEN_WIDTH-DPAdaptationW(274))/2, DPAdaptationH(22), DPAdaptationW(274), DPAdaptationH(474))];
        _shotsImageView=[[UIImageView alloc]initWithFrame:CGRectMake((DPSCREEN_WIDTH-DPAdaptationW(width))/2, DPAdaptationH(70), DPAdaptationW(width), DPAdaptationH(height))];
        
    }
    return _shotsImageView;
}
-(UIView *)bottomView{
    if (_bottomView==nil) {
        _bottomView=[[UIView alloc]initWithFrame:CGRectMake(0, DPSCREEN_HEIGHT, DPSCREEN_WIDTH, DPAdaptationH(160 + 50))];
//        _bottomView.backgroundColor=DPRGBCOLOR(235, 235, 235);
    }
    return _bottomView;
}
+(instancetype)initWithScreenShots:(UIImage *)shotsImage selectSheetBlock:(ActionSheetDidSelectSheetBlock)selectSheetBlock{
    
    return [[self alloc]initWithScreenShots:shotsImage selectSheetBlock:selectSheetBlock];
}
-(instancetype)initWithScreenShots:(UIImage *)shotsImage selectSheetBlock:(ActionSheetDidSelectSheetBlock)selectSheetBlock{
    if (self = [super initWithFrame:DPSCREEN_BOUNDS]) {
        _selectSheetBlock=selectSheetBlock;
        _shotsImage=shotsImage;
    }
    return self;
}
-(void)show{
    [self addSubview:self.maskView];
    self.shotsImageView.image=_shotsImage;
    [self addSubview:self.shotsImageView];
    [self addSubview:self.bottomView];
    [self layoutBottomSubViews];
    [self animationWithView:self duration:0.3];
    
    self.maskView.alpha= 0;
    [UIView animateWithDuration:0.25 animations:^{
        self.maskView.alpha = 0.5;
    }];
    
    [UIView animateWithDuration:0.6 animations:^{
        self.bottomView.frame = CGRectMake(0, DPSCREEN_HEIGHT-DPAdaptationH(160 - 50), DPSCREEN_WIDTH, DPAdaptationH(160 + 50));
    }];
}
-(void)hiddenView{
    [UIView animateWithDuration:0.5 animations:^{
        self.shotsImageView.frame = CGRectMake((DPSCREEN_WIDTH-DPAdaptationW(274))/2, DPAdaptationH(120), DPAdaptationW(274), DPAdaptationH(474));
        self.maskView.alpha = 0.0;
        self.bottomView.alpha=0.0;
        self.shotsImageView.alpha=0.0;
        
        
    }];
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5/*延迟执行时间*/ * NSEC_PER_SEC));
    
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        [self.maskView removeFromSuperview];
        [self removeFromSuperview];
        if (_hiddenBlock) {
            _hiddenBlock();
        }
        
    });
    
    
}
#pragma mark-添加底部视图的子视图
-(void)layoutBottomSubViews{
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, DPSCREEN_WIDTH, DPAdaptationH(40))];
    titleLabel.text=@"截图分享到";
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.font=[UIFont systemFontOfSize:DPAdapationLabelFont(18)];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    [self.bottomView addSubview:titleLabel];
    
    
    CGFloat btnW=DPAdaptationW(58);
    CGFloat btnH=DPAdaptationH(70);
    CGFloat margin=(DPSCREEN_WIDTH-btnW*3)/4;
    
    YLButton *oaFriendButton=[YLButton buttonWithType:UIButtonTypeCustom];
    [oaFriendButton setImage:[UIImage imageNamed:@"SFScrennSharedOAFriend.png"] forState:UIControlStateNormal];
    oaFriendButton.titleLabel.font = [UIFont systemFontOfSize:DPAdapationLabelFont(16)];
    [oaFriendButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];;
    oaFriendButton.frame = CGRectMake(margin, DPAdaptationH(40), btnW, btnH);
    oaFriendButton.imageRect = CGRectMake(DPAdaptationW(4), DPAdaptationW(4), btnW-DPAdaptationW(8), btnW-DPAdaptationW(8));
    oaFriendButton.titleRect = CGRectMake(0, btnW, btnW,btnH-btnW);
    oaFriendButton.titleLabel.font=[UIFont systemFontOfSize:DPAdapationLabelFont(14)];
    oaFriendButton.titleLabel.textAlignment=NSTextAlignmentCenter;
    [oaFriendButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    oaFriendButton.tag=OASelectSheetType;
    [oaFriendButton addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:oaFriendButton];
    //设置显示OA label
    [self createShareShowLabelWithButton:oaFriendButton WithText:@"好友"];
  
    
    
    YLButton *WeiXinCircleButton=[YLButton buttonWithType:UIButtonTypeCustom];
    [WeiXinCircleButton setImage:[UIImage imageNamed:@"SFScrennSharedWXFriend.png"] forState:UIControlStateNormal];
    WeiXinCircleButton.titleLabel.font = [UIFont systemFontOfSize:DPAdapationLabelFont(16)];
    [WeiXinCircleButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];;
    WeiXinCircleButton.frame = CGRectMake(margin*2+btnW, DPAdaptationH(40), btnW, btnH);
    WeiXinCircleButton.imageRect = CGRectMake(DPAdaptationW(4), DPAdaptationW(4), btnW-DPAdaptationW(8), btnW-DPAdaptationW(8));
    WeiXinCircleButton.titleRect = CGRectMake(0, btnW, btnW,btnH-btnW);
    WeiXinCircleButton.titleLabel.font=[UIFont systemFontOfSize:DPAdapationLabelFont(14)];
    WeiXinCircleButton.titleLabel.textAlignment=NSTextAlignmentCenter;
    [WeiXinCircleButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    WeiXinCircleButton.tag=WeiXinSelectSheetType;
    [WeiXinCircleButton addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:WeiXinCircleButton];
    //设置显示微信 label
    [self createShareShowLabelWithButton:WeiXinCircleButton WithText:@"微信"];
    
    
    YLButton *QQButton=[YLButton buttonWithType:UIButtonTypeCustom];
    [QQButton setImage:[UIImage imageNamed:@"SFScrennSharedQQFriend.png"] forState:UIControlStateNormal];
    QQButton.titleLabel.font = [UIFont systemFontOfSize:DPAdapationLabelFont(16)];
    [QQButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];;
    QQButton.frame = CGRectMake(margin*3+btnW*2, DPAdaptationH(40), btnW, btnH);
    QQButton.imageRect = CGRectMake(DPAdaptationW(4), DPAdaptationW(4), btnW-DPAdaptationW(8), btnW-DPAdaptationW(8));
    QQButton.titleRect = CGRectMake(0, btnW, btnW,btnH-btnW);
    QQButton.titleLabel.font=[UIFont systemFontOfSize:DPAdapationLabelFont(14)];
    QQButton.titleLabel.textAlignment=NSTextAlignmentCenter;
    [QQButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    QQButton.tag=QQSelectSheetType;
    [QQButton addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:QQButton];
    //设置显示QQ label
    [self createShareShowLabelWithButton:QQButton WithText:@"QQ"];
    
    
    CGFloat cancelWidth = DPAdaptationH(35);
    UIButton *cancelButton=[[UIButton alloc]initWithFrame:CGRectMake((DPSCREEN_WIDTH - cancelWidth)/2, CGRectGetMaxY(WeiXinCircleButton.frame)+ 20 + 10, cancelWidth, cancelWidth)];
    [cancelButton setBackgroundImage:[UIImage imageNamed:@"SFScreenShotClose.png"] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(hiddenView) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:cancelButton];
    
}


- (void)createShareShowLabelWithButton:(UIButton *)showButton WithText:(NSString *)text
{
    CGFloat labelH = DPAdaptationH(20);
    CGFloat labelW = DPAdaptationW(58);
    UILabel *showLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(showButton.frame),CGRectGetMaxY(showButton.frame), labelW,labelH)];
    showLabel.text = text;
    showLabel.textAlignment = NSTextAlignmentCenter;
    showLabel.textColor = [UIColor whiteColor];
    [self.bottomView addSubview:showLabel];
}

-(void)btnDidClick:(YLButton *)sender{
    if (_selectSheetBlock) {
        _selectSheetBlock(sender.tag);
    }
    [self hiddenView];
}
- (void)animationWithView:(UIView *)view duration:(CFTimeInterval)duration{
    
    CAKeyframeAnimation * animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = duration;
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    //    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 0.9)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    
    animation.values = values;
    animation.timingFunction = [CAMediaTimingFunction functionWithName: @"easeInEaseOut"];
    
    [view.layer addAnimation:animation forKey:nil];
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
