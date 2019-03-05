//
//  EPBaseRequest.h
//  EvePhoto
//
//  Created by fengyn on 23/11/2017.
//  Copyright © 2017 com.neolab. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>
#import "MsgBody.h"

@interface BaseService : YTKRequest
@property (nonatomic, strong) NSDictionary *param;
@property (nonatomic , strong , readonly) MsgBody *msgBody;
@end
