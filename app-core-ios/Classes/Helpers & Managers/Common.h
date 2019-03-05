//
//  Common.h
//  AIKang
//
//  Created by playable-iMac2 on 2018/4/25.
//  Copyright © 2018年 majin.missky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Common : NSObject

+(void)showWaitHud:(NSString *)hud;
+(void)showHud:(NSString *)hud;
+(void)showError:(NSString *)error;
+(void)hideHud;

@end
