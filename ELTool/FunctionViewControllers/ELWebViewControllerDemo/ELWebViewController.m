//
//  UIWebViewController.m
//  ELTool
//
//  Created by speedsnail on 2018/5/11.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ELWebViewController.h"

@interface ELWebViewController ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *elWebView;
@end

@implementation ELWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUserInterface];
    
}

- (void)createUserInterface
{
    //设置rightBarButton
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithTitle:@"加载" style:UIBarButtonItemStylePlain target:self action:@selector(reloadWebView)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    //创建UIWebView
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:webView];
    webView.delegate = self;
    self.elWebView = webView;
}

- (void)reloadWebView
{
    NSString *loadLink = @"http://u.soufun.cn/d_oa/zzlbz7/";
    NSURL *loadUrl = [NSURL URLWithString:loadLink];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:loadUrl];
    [self.elWebView loadRequest:urlRequest];

}

#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"");
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"error:%@",error);
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
