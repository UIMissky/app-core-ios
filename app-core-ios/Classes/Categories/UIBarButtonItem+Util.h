//
//  UIBarButtonItem+Util.h
//  app-core-ios
//
//  Created by playable-iMac2 on 2019/3/1.
//  Copyright © 2019年 majin.missky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Util)

+(instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
+(instancetype)itemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action;
+(instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage title:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action;

@end

