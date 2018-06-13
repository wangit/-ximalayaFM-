//
//  NSString+Other.h
//  BSMedical
//
//  Created by Bsoft on 16/3/18.
//  Copyright © 2016年 Bsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Other)


/**
*  去掉字符串首尾的空格
*
*  @param string 字符串
*
*  @return  字符串
*/
+ (NSString *)removeHeadAndTailSpacingWithString:(NSString *)string;

/**
 *  判断是不是网址
 *
 *  @param urlStr 网址字符串
 *
 *  @return    YES/NO
 */
+ (BOOL)isWebSiteWithUrlStr:(NSString *)urlStr;

/**
 *  去掉html中的标签
 *
 *  @param html  html数据
 *
 *  @return  去掉html中的标签的字符串
 */
+ (NSString *)filterHTML:(NSString *)html;

/**
 *  是否包含空格
 *
 *  @param string 字符串
 *
 *  @return YES/NO
 */
+ (BOOL)isContainBlank:(NSString *)string;

@end
