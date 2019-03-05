//
//  MsgBody.h
//  AIKang
//
//  Created by playable-iMac2 on 2018/4/18.
//  Copyright © 2018年 majin.missky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MsgBody : NSObject

@property (nonatomic , copy) NSString *status;
@property (nonatomic , copy) NSString *code;
@property (nonatomic , copy) NSString *message;
@property (nonatomic,strong) NSString *errors;


@property (nonatomic , strong) id data;

@end
