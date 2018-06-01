//
//  ELAVPlayerViewController.m
//  ELTool
//
//  Created by speedsnail on 2018/5/30.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ELAVPlayerViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface ELAVPlayerViewController ()
@property (nonatomic, strong) AVPlayerViewController *avPlayerController;
@end

@implementation ELAVPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"AVPlayer";
    
    [self createUserInterface];
}

- (void)createUserInterface
{
//    @"http://video.699pic.com/videos/38/45/00/CaCwReHX45yW1522384500.mp4"
    
//    http://imgws01.soufunimg.com/SouFunOA/video/201805/30/3CCF9AE194174D93ED23CBE865F69F1F.mp4
    NSURL *fileUrl = [NSURL URLWithString:@"http://imgws01.soufunimg.com/SouFunOA/video/201805/30/3CCF9AE194174D93ED23CBE865F69F1F.mp4"];
    // 2、创建AVPlayerItem
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:fileUrl];
    // 设置资源路径
    AVPlayer *avPlayer= [AVPlayer playerWithPlayerItem:playerItem];
    // player的控制器对象
    AVPlayerViewController *playerViewController = [[AVPlayerViewController alloc] init];
    
    playerViewController.exitsFullScreenWhenPlaybackEnds = YES;
    // 控制器的player播放器
    playerViewController.player = avPlayer;
    // 试图的填充模式
    playerViewController.videoGravity = AVLayerVideoGravityResizeAspect;
    // 是否显示播放控制条
    playerViewController.showsPlaybackControls = YES;
    // 设置显示的Frame
    CGRect viewInsetRect = CGRectInset ([self.view bounds],50,55 );
    playerViewController.view.frame = viewInsetRect;
    // 将播放器控制器添加到当前页面控制器中
    //        [self addChildViewController:_playerViewController];
    // view一定要添加，否则将不显示
    [self.view addSubview:playerViewController.view];
    // 播放
//    [playerViewController.player play];
    
    self.avPlayerController = playerViewController;
    
    //添加功能控制通知
    [self createAVPlayerNotifcation];
    //barbutton
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(playVideo)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

- (void)playVideo
{
    // 播放
    [self.avPlayerController.player play];
}

#pragma mark AVPlayer
- (void)createAVPlayerNotifcation
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieByAVPlayerPlayDidEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    
    
}

- (void)movieByAVPlayerPlayDidEnd:(NSNotification *)notification
{
//    NSDictionary *userInfoDict = [notification userInfo];
    NSLog(@"endPlayHHHH");
    
    
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
