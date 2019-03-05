//
//  UIButton+CountDown.h
//  倒计时
//
//  Created by lanou3g on 16/1/5.
//  Copyright © 2016年 syx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CountDown)

/*
 *    倒计时按钮
 *    @param timeLine  倒计时总时间
 *    @param title     还没倒计时的title
 *    @param subTitle  倒计时后缀 如:32秒后重试
 *    @param mColor    还没倒计时的颜色
 *    @param color     倒计时的颜色
 */
- (void)startWithTime:(NSInteger)timeLine title:(NSString *)title subTitle:(NSString *)subTitle mainColor:(UIColor *)mColor countColor:(UIColor *)color;

+ (UIButton *)buttonWithTarget:(id)target action:(SEL)sel radious:(CGFloat )concer;

@end
