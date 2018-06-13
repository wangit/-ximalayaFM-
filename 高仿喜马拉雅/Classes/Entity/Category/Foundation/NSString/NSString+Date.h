//
//  NSString+Date.h
//  BSMedical
//
//  Created by Bsoft on 16/3/21.
//  Copyright © 2016年 Bsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(Date)

/**
 *  根据某个时间戳计算年龄
 *
 *  @param stemp 时间戳
 *
 *  @return 某人的年龄
 */
+ (NSString *)getAgeStringWithStemp:(double)stemp;

/**
 *  根据某个时间戳计算年龄
 *
 *  @param javaStemp 时间戳(java类型的)
 *
 *  @return 某人的年龄
 */
+ (NSString *)getAgeStringWithJavaStemp:(double)javaStemp;

/**
 *  将时间戳转换为格式化的时间字符串
 *
 *  @param stemp  时间戳
 *  @param format 时间格式
 *
 *  @return 格式化的时间字符串
 */
+ (NSString *)getDateStringWithStemp:(double)stemp format:(NSString *)format;

/**
 *  获取 java 当前时间戳(毫秒)
 *
 *  @return  java 当前的时间戳(毫秒)
 */
+ (NSString *)getCurrentJavaMillisecondTimeStamp;

/**
 *  将时间戳(java类型的)转换为格式化的时间字符串
 *
 *  @param javaStemp  时间戳(java类型的)
 *  @param format 时间格式
 *
 *  @return 格式化的时间字符串
 */
+ (NSString *)getDateStringWithJavaStemp:(double)javaStemp format:(NSString *)format;

/**
 *  将NSDate格式的时间转换为格式化的时间字符串
 *
 *  @param date   时间(NSDate类型)
 *  @param format 时间格式
 *
 *  @return 格式化的时间字符串
 */
+ (NSString *)getDateStringWithDate:(NSDate *)date format:(NSString *)format;

/**
 *  由时间戳得到该时间大约距今的时间字符串
 *
 *  @param stemp 某个时间戳
 *
 *  @return 大约距今的时间字符串
 */
+ (NSString *)getAboutTimeIntervalStringWithStemp:(double)stemp;

/**
 *  由时间戳(java类型的)得到该时间大约距今的时间字符串
 *
 *  @param javaStemp 某个时间戳(java类型的)
 *
 *  @return 大约距今的时间字符串
 */
+ (NSString *)getAboutTimeIntervalStringWithJavaStemp:(double)javaStemp;

/**
 *  由NSDate格式的时间得到该时间大约距今的时间字符串
 *
 *  @param date 时间(NSDate类型)
 *
 *  @return 大约距今的时间字符串
 */
+ (NSString *)getAboutTimeIntervalStringWithDate:(NSDate *)date;

@end
