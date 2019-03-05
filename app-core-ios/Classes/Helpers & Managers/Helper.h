//
//  Helper.h
//  EvePhoto
//
//  Created by Hieu Pham on 9/8/17.
//  Copyright © 2017 com.neolab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Helper : NSObject

+(void)showCustomAlertViewWithTitle:(NSString*)title message:(NSString*)message okHandler:(void (^)())okHandler;
+(void)showAlertViewWithTitle:(NSString*)title message:(NSString*)message okHandler:(void (^)())okHandler;
+(void)showAlertViewWithCancelDeleteAndTitle:(NSString*)title message:(NSString*)message okHandler:(void (^)())okHandler;
+(void)showAlertViewWithTitle:(NSString*)title message:(NSString*)message leftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle  okHandler:(void (^)())okHandler;
/*[Helper showAlertViewWithTitle:@"确认取消订单吗?" message:nil leftTitle:@"取消" rightTitle:@"确认" okHandler:^{
 
 }];*/
@end
