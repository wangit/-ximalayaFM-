//
//  NSString+Date.m
//  BSMedical
//
//  Created by Bsoft on 16/3/21.
//  Copyright © 2016年 Bsoft. All rights reserved.
//

#import "NSString+Date.h"

@implementation NSString(Date)

/// 根据某个时间戳计算年龄
+ (NSString *)getAgeStringWithStemp:(double)stemp
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:stemp];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents * components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth
                                                fromDate:date
                                                  toDate:[NSDate date]
                                                 options:NSCalendarWrapComponents];
    
    return [NSString stringWithFormat:@"%ld岁",(long)(components.year+1)];
}

/// 根据某个时间戳(java类型的)计算年龄
+ (NSString *)getAgeStringWithJavaStemp:(double)javaStemp
{
    double stemp = javaStemp / 1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:stemp];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents * components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth
                                                fromDate:date
                                                  toDate:[NSDate date]
                                                 options:NSCalendarWrapComponents];
    
    return [NSString stringWithFormat:@"%ld岁",(long)(components.year+1)];
}

+ (NSString *)getCurrentJavaMillisecondTimeStamp
{
    double timeStamp = [[NSDate date] timeIntervalSince1970];
    return [NSString stringWithFormat:@"%.0f%@", timeStamp, @"000"];
}

/// 将时间戳转换为格式化的时间字符串
+ (NSString *)getDateStringWithStemp:(double)stemp format:(NSString *)format
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:stemp];
    return [self getDateStringWithDate:date format:format];
}

/// 将时间戳(java类型的)转换为格式化的时间字符串
+ (NSString *)getDateStringWithJavaStemp:(double)javaStemp format:(NSString *)format
{
    double stemp = javaStemp / 1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:stemp];
    return [self getDateStringWithDate:date format:format];
}

/// 将NSDate格式的时间转换为格式化的时间字符串
+ (NSString *)getDateStringWithDate:(NSDate *)date format:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:date];
}

/// 由时间戳得到该时间大约距今的时间字符串
+ (NSString *)getAboutTimeIntervalStringWithStemp:(double)stemp
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:stemp];
    return [self getAboutTimeIntervalStringWithDate:date];
}

/// 由时间戳(java类型的)得到该时间大约距今的时间字符串
+ (NSString *)getAboutTimeIntervalStringWithJavaStemp:(double)javaStemp
{
    double stemp = javaStemp / 1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:stemp];
    return [self getAboutTimeIntervalStringWithDate:date];
}

/// 由NSDate格式的时间得到该时间大约距今的时间字符串
+ (NSString *)getAboutTimeIntervalStringWithDate:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|
                                    NSCalendarUnitMonth|
                                    NSCalendarUnitDay|
                                    NSCalendarUnitHour|
                                    NSCalendarUnitMinute|
                                    NSCalendarUnitSecond
                                               fromDate:date
                                                 toDate:[NSDate date]
                                                options:NSCalendarWrapComponents];
    
    if (components.year > 0 || components.year < 0) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        return [formatter stringFromDate:date];
    }
    else if (components.year == 0) {
        if (components.month > 0) {
            return [NSString stringWithFormat:@"%ld个月之前",(long)components.month];
        }
        else if (components.month < 0) {
            return [NSString stringWithFormat:@"%ld个月之后",(long)components.month*(-1)];
        }
        else if (components.month == 0) {
            if (components.day > 0) {
                return [NSString stringWithFormat:@"%ld天之前",(long)components.day];
            }
            else if (components.day < 0) {
                return [NSString stringWithFormat:@"%ld天之后",(long)components.day*(-1)];
            }
            else if (components.day == 0) {
                if (components.hour > 0) {
                    return [NSString stringWithFormat:@"%ld小时之前",(long)components.hour];
                }
                else if (components.hour < 0) {
                    return [NSString stringWithFormat:@"%ld小时之后",(long)components.hour*(-1)];
                }
                else if (components.hour == 0) {
                    if (components.minute > 0) {
                        return [NSString stringWithFormat:@"%ld分钟之前",(long)components.minute];
                    }
                    else if (components.minute < 0) {
                        return [NSString stringWithFormat:@"%ld分钟之后",(long)components.minute*(-1)];
                    }
                    else if (components.minute == 0) {
                        return @"刚刚";
                    }
                }
            }
        }
    }
    return nil;
}

@end
