//
//  EPBaseRequest.m
//  EvePhoto
//
//  Created by fengyn on 23/11/2017.
//  Copyright © 2017 com.neolab. All rights reserved.
//

#import "BaseService.h"

@interface BaseService()
@property (nonatomic, strong) MsgBody *msgBody;
@end;


@implementation BaseService

-(NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary{
        NSDictionary *header=nil;
//        if([LoginManager hasLogined]){
//            header = @{
//                       @"api_token"     : [LoginManager getAccessToken],
//                       @"platform"  : [DataManager platform],
//                       @"version"   : [DataManager version]
//                       };
//        }else {
//            header = [super requestHeaderFieldValueDictionary];
//        }
        return header;
}

-(void)startWithCompletionBlockWithSuccess:(YTKRequestCompletionBlock)success failure:(YTKRequestCompletionBlock)failure{
    
    [super startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request){
        if ([request.responseObject isKindOfClass:[NSDictionary class]]) {
            self.msgBody=[MsgBody mj_objectWithKeyValues:request.responseObject];
        }

        NSLog(@"【【【%@】】】\nRequest ==%@ \nResponse == %@",NSStringFromClass([self class]),request,request.responseObject);
        if ([self.msgBody.code isEqualToString:@"200"]) {
           success(request);
        }else{
            [Common showError:request.responseJSONObject[@"errors"] ? : @"未知错误"];
            failure(request);
        }
        
    } failure:^(YTKBaseRequest *request){
        NSDictionary *jsonObject = [self dictionaryWithJsonString:request.responseString];
        if (!jsonObject) {
           NSLog(@"【【【%@】】】\nRequest ==%@ \nResponse == %@",NSStringFromClass([self class]),request,request.responseString);
        }else{
            NSLog(@"【【【%@】】】\nRequest ==%@ \nResponse == %@",NSStringFromClass([self class]),request,jsonObject);
        }
            [Common showError:request.responseJSONObject[@"errors"] ? : @"未知错误"];
        failure(request);
    }];
}

- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

- (BOOL)isContent
{
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *subviews = [[[app valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    NSString *network = @"";
    for (id subview in subviews) {
        if ([subview isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            int networkType = [[subview valueForKeyPath:@"dataNetworkType"] intValue];
            switch (networkType) {
                case 0:
                    network = @"NONE";
                    break;
                case 1:
                    network = @"2G";
                    break;
                case 2:
                    network = @"3G";
                    break;
                case 3:
                    network = @"4G";
                    break;
                case 5:
                    network = @"WIFI";
                    break;
                default:
                    break;
            }
        }
    }
    BOOL isContent = YES;
    if ([network isEqualToString:@""]) {
        network = @"NO DISPLAY";
        isContent= NO;
    }
    return isContent;
}
@end
