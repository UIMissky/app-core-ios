//
//  BaseWebViewController.m
//  AIKang
//
//  Created by playable-iMac2 on 2018/4/25.
//  Copyright © 2018年 majin.missky. All rights reserved.
//

#import "BaseWebViewController.h"
#import <WebKit/WebKit.h>

@interface BaseWebViewController ()<WKUIDelegate,WKNavigationDelegate>

@property (nonatomic , strong) UIWebView *webView;
@property (nonatomic , copy) NSURL *link;
@property (nonatomic , strong) NSString *titleStr;

@end

@implementation BaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Common showWaitHud:@""];
    WKWebView *web = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, kSCREEN_HEIGHT-Height_TopBar)];
    [web loadRequest:[NSURLRequest requestWithURL:self.link]];
    web.scrollView.showsVerticalScrollIndicator = NO;
    web.UIDelegate = self;
    web.navigationDelegate = self;
    [self.view addSubview:web];
    [self addLeftButton];
    self.navigationItem.title = self.titleStr;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationItem.rightBarButtonItem = nil;
}

#pragma mark ----- WKWebViewUIDelegate
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:
(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    //发布者信息+评论Uid
    NSString *requestStr = [[navigationAction.request.URL absoluteString] stringByRemovingPercentEncoding];
    //如果是跳转一个新页面
    if (navigationAction.targetFrame == nil) {
        [webView loadRequest:navigationAction.request];
    }
    if ([requestStr hasPrefix:@"tel"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:requestStr]];
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}
#pragma mark - API

-(instancetype)initWithLink:(NSString *)link title:(NSString *)title{
    self = [super init];
    if (self) {
        _link = [NSURL URLWithString:link];
        _titleStr = title;
    }
    return self;
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    [Common hideHud];
}

@end
