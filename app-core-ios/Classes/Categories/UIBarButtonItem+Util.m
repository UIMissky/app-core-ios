//
//  UIBarButtonItem+Util.m
//  app-core-ios
//
//  Created by playable-iMac2 on 2019/3/1.
//  Copyright © 2019年 majin.missky. All rights reserved.
//

#import "UIBarButtonItem+Util.h"

@implementation UIBarButtonItem (Util)

+(instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    btn.bounds = (CGRect){CGPointZero,CGSizeMake(35, 30)};
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+(instancetype)itemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    if (title.length == 2){
        btn.bounds = (CGRect){CGPointZero,CGSizeMake(50, 30)};
    }else if (title.length == 4){
        btn.bounds = (CGRect){CGPointZero,CGSizeMake(80, 30)};
    }
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+(instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage title:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    btn.bounds = (CGRect){CGPointZero,CGSizeMake(35, 30)};
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
@end
