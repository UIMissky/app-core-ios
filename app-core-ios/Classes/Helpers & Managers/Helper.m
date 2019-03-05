//
//  Helper.m
//  EvePhoto
//
//  Created by Hieu Pham on 9/8/17.
//  Copyright © 2017 com.neolab. All rights reserved.
//

#import "Helper.h"

@implementation Helper

+(void)showAlertViewWithTitle:(NSString*)title message:(NSString*)message okHandler:(void (^)())okHandler{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if(okHandler)
            okHandler();
    }];
    [ok setValue:[UIColor blackColor] forKey:@"titleTextColor"];
    [alertController addAction:ok];
    
    if(title && title.length > 0){
        NSMutableAttributedString *_title = [[NSMutableAttributedString alloc] initWithString:title];
        [_title addAttribute:NSFontAttributeName
                       value:[UIFont fontWithName:@".SFUIText-Bold" size:17.0 * (([[UIScreen mainScreen] bounds].size.width)/375.0)]
                       range:NSMakeRange(0, _title.length)];
        [alertController setValue:_title forKey:@"attributedTitle"];
    }

    if(message && message.length > 0){
        NSMutableAttributedString *_message = [[NSMutableAttributedString alloc] initWithString:message];
        [_message addAttribute:NSFontAttributeName
                         value:[UIFont fontWithName:@".SFUIText-Bold" size:17.0 * (([[UIScreen mainScreen] bounds].size.width)/375.0)]
                         range:NSMakeRange(0, _message.length)];
        [alertController setValue:_message forKey:@"attributedMessage"];
    }
    
    UIViewController *topRootViewController = [[UIApplication  sharedApplication] keyWindow].rootViewController;
    
    // 在这里加一个这个样式的循环
    while (topRootViewController.presentedViewController)
    {
        // 这里固定写法
        topRootViewController = topRootViewController.presentedViewController;
    }
    // 然后再进行present操作
    [topRootViewController presentViewController:alertController animated:YES completion:nil];
}

+(void)showCustomAlertViewWithTitle:(NSString*)title message:(NSString*)message okHandler:(void (^)())okHandler{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIView *subView1 = alertController.view.subviews[0];
    UIView *subView2 = subView1.subviews[0];
    UIView *subView3 = subView2.subviews[0];
    UIView *subView4 = subView3.subviews[0];
    UIView *subView5 = subView4.subviews[0];
    //取title和message：
    UILabel *titleLabel = subView5.subviews[0];
    UILabel *messageLabel = subView5.subviews[1];
    [messageLabel setTextAlignment:0];
    
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if(okHandler)
            okHandler();
    }];
    [ok setValue:[UIColor blackColor] forKey:@"titleTextColor"];
    [alertController addAction:ok];
    
    if(title && title.length > 0){
        NSMutableAttributedString *_title = [[NSMutableAttributedString alloc] initWithString:title];
        [_title addAttribute:NSFontAttributeName
                       value:[UIFont fontWithName:@".SFUIText-Bold" size:17.0 * (([[UIScreen mainScreen] bounds].size.width)/375.0)]
                       range:NSMakeRange(0, _title.length)];
        [alertController setValue:_title forKey:@"attributedTitle"];
    }

//    UIView *titleView = alertController.view.subviews[0];
//    UIView *messageView = alertController.view.subviews[1];
//    UILabel *messageLabel = (UILabel *)messageView;
//    messageLabel.textAlignment = NSTextAlignmentLeft;
//    if(message && message.length > 0){
//        NSMutableAttributedString *_message = [[NSMutableAttributedString alloc] initWithString:message];
//        [_message addAttribute:NSFontAttributeName
//                         value:[UIFont fontWithName:@".SFUIText-Bold" size:17.0 * (([[UIScreen mainScreen] bounds].size.width)/375.0)]
//                         range:NSMakeRange(0, _message.length)];
//        [alertController setValue:_message forKey:@"attributedMessage"];
//    }
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor redColor];
    [alertController.view addSubview:view];
    
    UIViewController *topRootViewController = [[UIApplication  sharedApplication] keyWindow].rootViewController;
    
    // 在这里加一个这个样式的循环
    while (topRootViewController.presentedViewController)
    {
        // 这里固定写法
        topRootViewController = topRootViewController.presentedViewController;
    }
    // 然后再进行present操作
    [topRootViewController presentViewController:alertController animated:YES completion:nil];
    
    if (message.length > 200) {
        [alertController.view mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(500);
        }];
    }
}

+(void)showAlertViewWithCancelDeleteAndTitle:(NSString*)title message:(NSString*)message okHandler:(void (^)())okHandler{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if(okHandler)
                okHandler();
        });
        
    }];
    [ok setValue:[UIColor redColor] forKey:@"titleTextColor"];
    [alertController addAction:ok];
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [cancel setValue:[UIColor blackColor] forKey:@"titleTextColor"];
    [alertController addAction:cancel];
    
    if(title && title.length > 0){
        NSMutableAttributedString *_title = [[NSMutableAttributedString alloc] initWithString:title];
        [_title addAttribute:NSFontAttributeName
                       value:[UIFont fontWithName:@".SFUIText-Bold" size:17.0 * (([[UIScreen mainScreen] bounds].size.width)/375.0)]
                       range:NSMakeRange(0, _title.length)];
        [alertController setValue:_title forKey:@"attributedTitle"];
    }
    
    if(message && message.length > 0){
        NSMutableAttributedString *_message = [[NSMutableAttributedString alloc] initWithString:message];
        [_message addAttribute:NSFontAttributeName
                         value:[UIFont fontWithName:@".SFUIText-Bold" size:17.0 * (([[UIScreen mainScreen] bounds].size.width)/375.0)]
                         range:NSMakeRange(0, _message.length)];
        [alertController setValue:_message forKey:@"attributedMessage"];
    }
    
    [[UIApplication sharedApplication].keyWindow.rootViewController  presentViewController:alertController animated:YES completion:nil];
}

+(void)showAlertViewWithTitle:(NSString*)title message:(NSString*)message leftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle okHandler:(void (^)())okHandler{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:rightTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if(okHandler)
                okHandler();
        });
        
    }];
    [ok setValue:[UIColor redColor] forKey:@"titleTextColor"];
    [alertController addAction:ok];
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:leftTitle style:UIAlertActionStyleDefault handler:nil];
    [cancel setValue:[UIColor blackColor] forKey:@"titleTextColor"];
    [alertController addAction:cancel];
    
    if(title && title.length > 0){
        NSMutableAttributedString *_title = [[NSMutableAttributedString alloc] initWithString:title];
        [_title addAttribute:NSFontAttributeName
                       value:[UIFont fontWithName:@".SFUIText-Bold" size:17.0 * (([[UIScreen mainScreen] bounds].size.width)/375.0)]
                       range:NSMakeRange(0, _title.length)];
        [alertController setValue:_title forKey:@"attributedTitle"];
    }
    
    if(message && message.length > 0){
        NSMutableAttributedString *_message = [[NSMutableAttributedString alloc] initWithString:message];
        [_message addAttribute:NSFontAttributeName
                         value:[UIFont fontWithName:@".SFUIText-Bold" size:17.0 * (([[UIScreen mainScreen] bounds].size.width)/375.0)]
                         range:NSMakeRange(0, _message.length)];
        [alertController setValue:_message forKey:@"attributedMessage"];
    }
    
    [[UIApplication sharedApplication].keyWindow.rootViewController  presentViewController:alertController animated:YES completion:nil];
}
@end
