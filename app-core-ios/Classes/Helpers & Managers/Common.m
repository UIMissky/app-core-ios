//
//  Common.m
//  AIKang
//
//  Created by playable-iMac2 on 2018/4/25.
//  Copyright © 2018年 majin.missky. All rights reserved.
//

#import "Common.h"


@implementation Common

+(void)showHud:(NSString *)hud{
    [self hideHud];
    if (![hud isKindOfClass:[NSString class]]) {
        return;
    }
    [SVProgressHUD showSuccessWithStatus:hud];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hideHud];
    });
}

+(void)showError:(NSString *)error{
    [self hideHud];
    if (![error isKindOfClass:[NSString class]]) {
        return;
    }
    [SVProgressHUD showErrorWithStatus:error];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hideHud];
    });
}

+(void)showWaitHud:(NSString *)hud{
    [self hideHud];
    if (![hud isKindOfClass:[NSString class]]) {
        return;
    }
    [SVProgressHUD showWithStatus:hud];
}

+(void)hideHud{
    [SVProgressHUD dismiss];
}

@end
