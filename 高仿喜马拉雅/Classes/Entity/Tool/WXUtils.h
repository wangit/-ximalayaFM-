//
//  Utils.h
//  PMedical
//
//  Created by 深海小飞象🐙哥 on 15-1-13.
//  Copyright (c) 2015年 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define isIOS8  ([[[UIDevice currentDevice]systemVersion]floatValue]>=8)

@interface WXUtils : NSObject

// 此方法随机产生32位字符串， 修改代码红色数字可以改变 随机产生的位数。
+(NSString *)ret32bitString;
/**
 *  服务端空字段 返回@"null" / @"(null)"的异常处理
 *
 *  @param source <#source description#>
 *
 *  @return null的正常值
 */
+ (NSString *)nullTransform:(NSString *)source replace:(NSString *)replace;

//通过身份证获取生日
+ (NSString *)getBirthdayBy18PaperId:(NSString *) sPaperId;
/**
 * 功能:验证身份证是否合法
 * 参数:输入的身份证号
 */
+ (BOOL)chk18PaperId:(NSString *) sPaperId;
//通过身份证获取性别
+ (NSNumber *)getSexFromIdcard:(NSString *) sPaperId;
//验证手机号码合法性
+ (BOOL)checkPhoneNum:(NSString *)phoneNum;
//隐藏手机中间4位
+ (NSString *)numberSuitScanf:(NSString*)number;

//验证金钱是否合法
+ (BOOL)checkMoney:(NSString *)money;

//验证密码 6-20位数字和字母组成
+ (BOOL)checkPassWord:(NSString *)pwd;
//根据某个日期计算年龄
+ (NSString *)yearOldFormDate:(double)serverStemp;
/**
 *  通过身份证号获取年龄
 *
 *  @param idcard 身份证号
 *
 *  @return 周岁
 */
+ (NSInteger)getYearWithIdcard:(NSString *)idcard;

//颜色转换图片
+ (UIImage *)createImageWithColor:(UIColor *)color;
+ (NSInteger)getYearWithDobFormatter:(NSString *)dobStr;
//width范围内 文本的长度

+ (CGFloat)detailTextHeight:(NSString *)text width:(CGFloat)width font:(CGFloat)font;

+ (NSString *)stringWithObject:(id)theData;

/**
 *  获取设备类型
 *
 *  
 */
+ (NSString *)systemModel;
//获取设备版本号
+ (NSString *)getDeviceVersion;


/**
转换首字符
 */
+ (NSString *)formatPinying:(NSString *)str;
+ (NSString *)birthdayFormatterWithServer:(NSString *)birthdayStr;
+ (NSInteger)getYearWithDob:(NSString *)dobStr;

/**
 本地时间
 */
+(NSString *)LocationTime;


/**
 本地时间年月日时分秒
 */
+(NSString *)LocationTimeYYMMDD;
/**
 本地时间年月日
 */
+(NSString *)LocationTimeYYMM;
+(NSString *)LocationTimeMMDD;
/**
 本地时间时分秒
 */
+(NSString *)LocationTimeHHMMSS;
/**
 本地时间时分
 */
+(NSString *)LocationTimeHHMM;
/**
时间戳转时间
 */
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString;
+(NSString *)timeWithTimeIntervalYYMMDDHHMMSS:(NSString *)timeString;
+(NSString *)timeWithTimeIntervalYYMMDDHHMM:(NSString *)timeString;
+(NSString *)timeWithTimeIntervalYYMMDD:(NSString *)timeString;
+(NSString *)timeWithTimeIntervalMMDD:(NSString *)timeString;
+ (NSDate *)hd_timeStamp:(NSTimeInterval)timeStamp;
+ (NSString*)getTime:(NSString*)timeStr;
/**
 时间转年龄
 */
+(NSString *)dateToOld:(NSDate *)bornDate;
/**
 特殊符号
 */
+(NSString *)LongSymbol:(NSString *)symbol;

/**
 取 00 ~ 59 的随机字符（模拟秒）
 */
+(NSString *)SimulateRandomSecond;

/**
 是不是表情

 @param string 需要检测的字符串
 @return 返回的
 */
+ (BOOL)stringContainsEmoji:(NSString *)string;




/**
 字典转json字符串

 @param dic 字典
 @return 字符串
 */
+ (NSString *)dictionaryToJson:(NSDictionary *)dic;

/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString ;
// 将JSON串转化为字典或者数组
+ (id)toArrayOrNSDictionary:(NSData *)jsonData;
/*!
 * @brief  数组转json字符串
 *  JSON格式的字符串
 * @return 返回字典
 */
+ (NSString *)arrayToJSONString:(NSArray *)array;
+ (NSString *)convertToJsonData:(NSDictionary *)dict;
/**
 图片添加水印

 text 水印文字
 img 底层图片
 返回的带水印的图片
 */
+(UIImage *)AddText:(NSString *)text addUIImage:(UIImage *)img;


/**
 urldecode解码

 @param input 输入
 @return 输出
 */
+ (NSString *)decodeFromPercentEscapeString: (NSString *) input;

//16进制颜色(html颜色值)字符串转为UIColor
+ (UIColor *)hexStringToColor:(NSString *)stringToConvert;

+ (BOOL) isFirstLoad;


/**
 输入是数字

 @param number 字符串
 @return 是不是
 */
+ (BOOL)validateNumber:(NSString*)number;
// 读取本地JSON文件
+ (NSDictionary *)readLocalFileWithName:(NSString *)name;

/** 验证有效的字母数字组合 */
+ (BOOL)validateAlphabetAndNumberWithStr:(NSString *)string;


@end

