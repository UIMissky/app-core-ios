//
//  SMPMainViewController.m
//  ShopOnline
//
//  Created by Allcam on 16/7/5.
//  Copyright © 2016年 Allcam. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "MainNavViewController.h"

@interface MainTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation MainTabBarViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //  替换tabBar
//    [self setValue:[AITabBar new] forKeyPath:@"tabBar"];
    
    //  初始化所有子控制器
    [self setupChildViewControllers];
    
    self.delegate = self;
    //  去掉上部风格线
//    [[UITabBar appearance] setShadowImage:[UIImage new]];
//    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
//    [[UITabBar appearance] setBackgroundColor:COLOR_RGB(0x2a2a2a)];
    [[UITabBar appearance] setBarTintColor:MainTabBarColor];
    [UITabBar appearance].translucent = NO;
    
    [self setSelectedIndex:0];
}



/**
 * 设置字体属性
 */
+ (void)initialize{
    [[UITabBarItem appearance] setTitleTextAttributes:@{
                                                        NSFontAttributeName:[UIFont systemFontOfSize:10],
                                                        NSForegroundColorAttributeName:RGB(90, 90, 90)
                                                        }
                                             forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{
                                                        NSForegroundColorAttributeName:COLOR_RGB(0xfa534d)
                                                        }
                                             forState:UIControlStateSelected];
}



/**
 * 初始化所有的子控制器
 */
- (void)setupChildViewControllers{
    
    UIViewController *essence4 = [[UIViewController alloc] init];
    [self setupOneChildViewController:essence4 title:@"首页" image:@"footer_home_icon" selectedImage:@"footer_home_icon1" ];
    
    UIViewController *essence = [[UIViewController alloc] init];
    [self setupOneChildViewController:essence title:@"设备" image:@"footer_message_icon" selectedImage:@"footer_message_icon1" ];
    
    UIViewController *essence1 = [[UIViewController alloc] init];
    [self setupOneChildViewController:essence1 title:@"报警信息"  image:@"footer_follow_icon" selectedImage:@"footer_follow_icon1" ];
    
    UIViewController *essence5 = [[UIViewController alloc] init];
     [self setupOneChildViewController:essence5 title:@"个人中心" image:@"footer_setting_icon" selectedImage:@"footer_setting_icon1" ];
}

- (void)setupOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    
    MainNavViewController *navVC = [[MainNavViewController alloc] initWithRootViewController:vc];
    [self addChildViewController:navVC];
    
    if (title) {
        navVC.tabBarItem.title = title;
    }
    if (!title.length) {
        navVC.tabBarItem.imageInsets = UIEdgeInsetsMake(0, 0, kIs_iPhoneX ? -20 : -10, 0);
    }
    navVC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
    if ([tabBar.items indexOfObject:item] == 0 && self.selectedIndex == 0) {
        [[NSNotificationCenter defaultCenter] postNotificationName:KDIDTAPONHOME object:nil];
    }
}
@end
