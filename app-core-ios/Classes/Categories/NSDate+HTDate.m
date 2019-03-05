//
//  NSDate+HTDate.m
//  HappyTravel-iOS-Client
//
//  Created by WF on 2016/12/5.
//  Copyright © 2016年 西安中成天剑网络科技有限公司. All rights reserved.
//

#import "NSDate+HTDate.h"

static NSDateFormatter *dateFormatter;

@implementation NSDate (HTDate)


+(NSDateFormatter *)defaultFormatter
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc]init];
    });
    return dateFormatter;
}

+ (NSDate *)dateFromString:(NSString *)timeStr
                    format:(NSString *)format
{
    NSDateFormatter *dateFormatter = [NSDate defaultFormatter];
    [dateFormatter setDateFormat:format];
    NSDate *date = [dateFormatter dateFromString:timeStr];
    return date;
}

+ (NSInteger)cTimestampFromDate:(NSDate *)date
{
    return (long)[date timeIntervalSince1970];
}


+(NSInteger)cTimestampFromString:(NSString *)timeStr
                          format:(NSString *)format
{
    NSDate *date = [NSDate dateFromString:timeStr format:format];
    return [NSDate cTimestampFromDate:date];
}
+(NSString *)cTimestampFromStr:(NSString *)timeStr;
{
    NSDate *date = [NSDate dateFromString:timeStr format:@"yyyy-MM-dd"];
//    NSDate *date = [NSDate dateFromString:timeStr format:@"yyyy-MM-dd HH:mm"];
//    NSTimeInterval a=[date timeIntervalSince1970]*1000; // *1000 是精确到毫秒，不乘就是精确到秒
    NSTimeInterval a=[date timeIntervalSince1970];
    NSString *status = [NSString stringWithFormat:@"%.0f", a]; //转为字符型
    return status;
}

//时间戳转时间
+(NSString *)setTimeInteval:(NSString *)timeIndex
{
    //转化时间
    //    NSInteger intTime = [timeIndex integerValue];
    //    NSDate *nd = [NSDate dateWithTimeIntervalSince1970:intTime];
    //
    //    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    //    [dateFormat setDateFormat:@"YYYY年MM月dd hh:mm"];
    //    NSString *dateString = [dateFormat stringFromDate:nd];
    //    return dateString;
    
    NSString * timeStampString = timeIndex;
    NSTimeInterval _interval=[timeStampString doubleValue] / 1000.0;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    NSDateFormatter *objDateformat = [[NSDateFormatter alloc] init];
    [objDateformat setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *dateString = [objDateformat stringFromDate:date];
    return dateString;
}

+(NSString *)cTimestampFromStr_time:(NSString *)timeStr
{
    NSDate *date = [NSDate dateFromString:timeStr format:@"yyyy-MM-dd HH:mm"];
    NSTimeInterval a=[date timeIntervalSince1970]; // *1000 是精确到毫秒，不乘就是精确到秒
    NSString *status = [NSString stringWithFormat:@"%.0f", a]; //转为字符型
    return status;
}


+ (NSString *)dateStrFromCstampTime:(NSInteger)timeStamp
                     withDateFormat:(NSString *)format
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    return [NSDate datestrFromDate:date withDateFormat:format];
}

+ (NSString *)datestrFromDate:(NSDate *)date
               withDateFormat:(NSString *)format
{
    NSDateFormatter* dateFormat = [NSDate defaultFormatter];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    return [dateFormat stringFromDate:date];
}


//2调用

//- (IBAction)strToDate:(id)sender {
//    NSString *timeStr = @2015-07-15 15:00:00;
//    NSDate *date = [NSDate dateFromString:timeStr format:@yyyy-MM-dd HH:mm:ss];
//    NSLog(@字符串转NSDate：%@ -> %@,timeStr,date);
//}
//
//
//- (IBAction)dateToStamp:(id)sender {
//    
//    NSDate *date = [NSDate date];
//    NSInteger stamp = [NSDate cTimestampFromDate:date];
//    NSLog(@NSDate转时间戳：%@ ->%ld,date,stamp);
//}
//- (IBAction)strToStamp:(id)sender {
//    NSString *timeStr = @2015-07-15 15:00:00;
//    NSInteger stamp = [NSDate cTimestampFromString:timeStr format:@yyyy-MM-dd HH:mm:ss];
//    NSLog(@字符串转时间戳：%@ -> %ld,timeStr,stamp);
//}
//
//- (IBAction)stampToStr:(id)sender {
//    NSInteger stamp = 1436943600;
//    NSString *timeStr = [NSDate dateStrFromCstampTime:stamp withDateFormat:@yyyy-MM-dd HH:mm:ss];
//    NSLog(@时间戳转字符串：%ld ->%@,stamp,timeStr);
//}
//
//
//- (IBAction)dateToStr:(id)sender {
//    NSDate *date = [NSDate date];
//    NSString *timeStr = [NSDate datestrFromDate:date withDateFormat:@yyyy-MM-dd HH:mm:ss];
//    NSLog(@NSDate转字符串：%@ ->%@,date,timeStr);
//}
//
//分别得到以下结果
//
//2015-07-13 15:02:07.662 TimeDemo[2780:89582] 字符串转NSDate：2015-07-15 15:00:00 -> 2015-07-15 07:00:00 +0000
//
//2015-07-13 15:02:14.653 TimeDemo[2780:89582] NSDate转时间戳：2015-07-13 07:02:14 +0000 ->1436770934
//
//2015-07-13 15:02:20.077 TimeDemo[2780:89582] 字符串转时间戳：2015-07-15 15:00:00 -> 1436943600
//
//2015-07-13 15:02:22.957 TimeDemo[2780:89582] 时间戳转字符串：1436943600 ->2015-07-15 15:00:00
//
//2015-07-13 15:02:25.901 TimeDemo[2780:89582] NSDate转字符串：2015-07-13 07:02:25 +0000 ->2015-07-13 15:02:25

@end
