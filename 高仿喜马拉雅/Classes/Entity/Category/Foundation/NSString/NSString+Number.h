//
//  NSString+Number.h
//  BSMedical
//
//  Created by Bsoft on 16/3/18.
//  Copyright © 2016年 Bsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Number)

/**
*  验证密码6-20位数字和字母组成
*
*  @param password 密码
*
*  @return YES/NO
*/
+ (BOOL)checkPassWord:(NSString *)password;

/**
 *  验证是不是有效的整数
 *
 *  @param string 数字字符串
 *
 *  @return YES/NO
 */
+ (BOOL)isPureInt:(NSString *)string;

/**
 *  验证是不是有效的浮点数
 *
 *  @param string 字符串
 *
 *  @return YES/NO
 */
+ (BOOL)isPureFloat:(NSString *)string;

/**
 *  验证字符串 是整数或者小数(精确两位)
 *
 *  @param textString 字符串
 *
 *  @return YES/NO
 */
+ (BOOL)isFloatOrInteger:(NSString *)textString;

@end
