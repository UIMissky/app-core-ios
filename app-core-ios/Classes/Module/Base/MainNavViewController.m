//
//  SMPNavViewController.m
//  ShopOnline
//
//  Created by Allcam on 16/7/5.
//  Copyright © 2016年 Allcam. All rights reserved.
//

#import "MainNavViewController.h"

@interface MainNavViewController ()

@end

@implementation MainNavViewController

/**
 *  导航控制器第一次使用时候 设置好全局 nav -bar 的字体 颜色 背景等
 */
+ (void)initialize
{
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.translucent = NO;
    //iOS 7 之后
    [bar setBarTintColor:MainColor];
    [bar setBackgroundImage:[UIImage new] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [bar setShadowImage:[UIImage new]];
    //iOS 7 之前
//    [bar setBarTintColor:MainColor];
    NSDictionary *dict = @{
                           NSForegroundColorAttributeName : [UIColor whiteColor],
                           NSFontAttributeName : [UIFont systemFontOfSize:18]
                           };
    [bar setTitleTextAttributes:dict];
}

/**
 *  拦截推出的控制器 隐藏下部tabBar -
 *
 *  @param viewController nil
 *  @param animated       nil
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.childViewControllers.count) {
        
        viewController.hidesBottomBarWhenPushed = YES;

        /** 左侧返回按钮 **/
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"common_return_icon"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        button.bounds = CGRectMake(0, 0, 30, 23);
        
        
        //由自定义Button创建出UIBarButtonItem 并替换leftBarButtonItem
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    }
    
    [super pushViewController:viewController animated:YES];
}

-(void)back{
//    [self popViewControllerAnimated:YES];
}

@end
