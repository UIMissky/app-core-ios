//
//  BaseViewController.m
//  AIKang
//
//  Created by playable-iMac2 on 2018/4/18.
//  Copyright © 2018年 majin.missky. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
    [UIApplication sharedApplication].statusBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    NSLog(@"-----%@ viewDidLoad-----",NSStringFromClass([self class]));
    
    //left return
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;// 手势有效设置为YES  无效为NO
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
}

-(void)addLeftButton{
    UIBarButtonItem *leftBar = [UIBarButtonItem itemWithImage:@"" highImage:@"" target:self action:@selector(tapOnLeft)];
    self.navigationItem.leftBarButtonItem = leftBar;
}

-(void)tapOnLeft{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)tapOnRight{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.view endEditing:YES];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
