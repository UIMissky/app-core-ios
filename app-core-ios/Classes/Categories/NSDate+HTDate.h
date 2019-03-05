//
//  NSDate+HTDate.h
//  HappyTravel-iOS-Client
//
//  Created by WF on 2016/12/5.
//  Copyright © 2016年 西安中成天剑网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HTDate)

/**
 *  字符串转NSDate
 *
 *  @param format  转化格式 如yyyy-MM-dd HH:mm:ss,即2015-07-15 15:00:00
 *
 *  @return <#return value description#>
 */
+ (NSDate *)dateFromString:(NSString *)timeStr
                    format:(NSString *)format;

/**
 *  NSDate转时间戳
 *
 *  @param date 字符串时间
 *
 *  @return 返回时间戳
 */
+ (NSInteger)cTimestampFromDate:(NSDate *)date;

/**
 *  字符串转时间戳
 *
 *  @param format  转化格式 如yyyy-MM-dd HH:mm:ss,即2015-07-15 15:00:00
 *
 *  @return 返回时间戳的字符串
 */
+(NSInteger)cTimestampFromString:(NSString *)timeStr
                          format:(NSString *)format;
//第二种(yyyy-MM-dd)
+(NSString *)cTimestampFromStr:(NSString *)timeStr;
//第三种(yyyy-MM-dd HH:ss)
+(NSString *)cTimestampFromStr_time:(NSString *)timeStr;

//时间戳转时间
+(NSString *)setTimeInteval:(NSString *)timeIndex;


/**
 *  时间戳转字符串WF
 *
 *  @param timeStamp 时间戳
 *  @param format    转化格式 如yyyy-MM-dd HH:mm:ss,即2015-07-15 15:00:00
 *
 *  @return 返回字符串格式时间
 */
+ (NSString *)dateStrFromCstampTime:(NSInteger)timeStamp
                     withDateFormat:(NSString *)format;

/**
 *  NSDate转字符串
 *
 *  @param date   NSDate时间
 *  @param format 转化格式 如yyyy-MM-dd HH:mm:ss,即2015-07-15 15:00:00
 *
 *  @return 返回字符串格式时间
 */
+ (NSString *)datestrFromDate:(NSDate *)date
               withDateFormat:(NSString *)format;
@end
