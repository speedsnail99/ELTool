//
//  ELScreenShotsViewController.m
//  ELTool
//
//  Created by speedsnail on 2018/5/4.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ELScreenShotsViewController.h"
#import "DPScreenshotsPopView.h"

@interface ELScreenShotsViewController ()
@property (nonatomic,assign) BOOL isHidden;
@end

@implementation ELScreenShotsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"仿微博截图分享";
    _isHidden = YES;
    
    //初始化状态
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(userDidTakeScreenshot:) name:UIApplicationUserDidTakeScreenshotNotification
                                               object:nil];
   
}


- (void)userDidTakeScreenshot:(NSNotification *)noti
{
    NSLog(@"检测到截屏");
    //人为截屏, 模拟用户截屏行为, 获取所截图片
    UIImage *image_ = [self imageWithScreenshot];
    UIWindow *keyWindow=[[UIApplication sharedApplication]keyWindow];
    if (_isHidden) {
        DPScreenshotsPopView *popView=[DPScreenshotsPopView initWithScreenShots:image_ selectSheetBlock:^(SelectSheetType type) {
            if (type==OASelectSheetType) {
                NSLog(@"点击的是OA分享");
            }else if (type==WeiXinSelectSheetType){
                NSLog(@"点击的是微信好友分享");
            }else if (type==QQSelectSheetType){
                NSLog(@"点击的是QQ分享");
            }
        }];
        [popView show];
        
        [keyWindow addSubview:popView];
        _isHidden=NO;
        popView.hiddenBlock = ^{
            _isHidden=YES;
        };
    }else{
        
    }
}


/**
 *  截取当前屏幕
 *
 *  @return NSData *
 */
- (NSData *)dataWithScreenshotInPNGFormat
{
    CGSize imageSize = CGSizeZero;
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (UIInterfaceOrientationIsPortrait(orientation))
        imageSize = [UIScreen mainScreen].bounds.size;
    else
        imageSize = CGSizeMake([UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (UIWindow *window in [[UIApplication sharedApplication] windows])
    {
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, window.center.x, window.center.y);
        CGContextConcatCTM(context, window.transform);
        CGContextTranslateCTM(context, -window.bounds.size.width * window.layer.anchorPoint.x, -window.bounds.size.height * window.layer.anchorPoint.y);
        if (orientation == UIInterfaceOrientationLandscapeLeft)
        {
            CGContextRotateCTM(context, M_PI_2);
            CGContextTranslateCTM(context, 0, -imageSize.width);
        }
        else if (orientation == UIInterfaceOrientationLandscapeRight)
        {
            CGContextRotateCTM(context, -M_PI_2);
            CGContextTranslateCTM(context, -imageSize.height, 0);
        } else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
            CGContextRotateCTM(context, M_PI);
            CGContextTranslateCTM(context, -imageSize.width, -imageSize.height);
        }
        if ([window respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)])
        {
            [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:YES];
        }
        else
        {
            [window.layer renderInContext:context];
        }
        CGContextRestoreGState(context);
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return UIImagePNGRepresentation(image);
}

/**
 *  返回截取到的图片
 *
 *  @return UIImage *
 */
- (UIImage *)imageWithScreenshot
{
    NSData *imageData = [self dataWithScreenshotInPNGFormat];
    return [UIImage imageWithData:imageData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
