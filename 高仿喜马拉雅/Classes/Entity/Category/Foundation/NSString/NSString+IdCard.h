//
//  NSString+IdCard.h
//  BSMedical
//
//  Created by Bsoft on 16/3/18.
//  Copyright © 2016年 Bsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (IdCard)


/**
*  将手机号码字符串转变成加密状态的显示(默认状态,中间5为显示成*)
*
*  @return 加密状态显示的手机号码字符串
*/
- (NSString *)getEncryptionMobilePhoneNumber;

/**
 *  将手机号码字符串某一段转以某种加密的字符串形式显示
 *
 *  @param range         加密的显示区间
 *  @param encryptString 加密的显示的字符串
 *
 *  @return 加密状态显示的手机号码字符串
 */
- (NSString *)getEncryptionMobilePhoneNumberWithEncryptRange:(NSRange)range
                                         encryptString:(NSString *)encryptString;

/**
 *  将身份证字符串转变成加密状态的显示(默认状态,中间8为显示成*)
 *
 *  @return 加密状态显示的身份证号字符串
 */
- (NSString *)getEncryptionIdCard;

/**
 *  将身份证字符串某一段转以某种加密的字符串形式显示
 *
 *  @param range         加密的显示区间
 *  @param encryptString 加密的显示的字符串
 *
 *  @return 加密状态显示的身份证号字符串
 */
- (NSString *)getEncryptionIdCardWithEncryptRange:(NSRange)range
                                    encryptString:(NSString *)encryptString;

/**
*  通过身份证号获取某人的性别
*
*  @return 某人的性别(男/女)字符串
*/
- (NSString *)getSexWithIdcard;

/**
 *   通过身份证号获取某人的出生日期
 *
 *  @return 某人的出生日期(2016-2-22)字符串
 */
- (NSString *)getBirthdayWithIdcard;

/**
 *  通过身份证号获取某人的年龄
 *
 *  @return 某人的年龄
 */
- (NSInteger)getAgeWithIdcard;

/**
 *  获取18位的身份证号(同时验证身份证合法性)
 *
 *  @return 18位的身份证号
 */
- (NSString *)get18IdcardWithIdcard;

@end
