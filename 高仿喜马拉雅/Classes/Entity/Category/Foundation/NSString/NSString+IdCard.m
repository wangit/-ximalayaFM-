//
//  NSString+IdCard.m
//  BSMedical
//
//  Created by Bsoft on 16/3/18.
//  Copyright © 2016年 Bsoft. All rights reserved.
//

#import "NSString+IdCard.h"
#import "NSString+RegexCategory.h"

@implementation NSString (IdCard)

///将手机号码字符串转变成加密状态的显示(默认状态,中间5为显示成*)
- (NSString *)getEncryptionMobilePhoneNumber
{
    if ([self isMobilePhoneNumber] == NO) {
        return nil;
    }
    else {
        NSString *headStr   = [self substringToIndex:3];
        NSString *tailStr   = [self substringFromIndex:8];
        NSString *middleStr = @"*****";
        return [NSString stringWithFormat:@"%@%@%@",headStr,middleStr,tailStr];
    }
}

/// 将手机号码字符串某一段转以某种加密的字符串形式显示
- (NSString *)getEncryptionMobilePhoneNumberWithEncryptRange:(NSRange)range
                                    encryptString:(NSString *)encryptString
{
    if ([self isMobilePhoneNumber] == NO) {
        return nil;
    }
    else {
        NSUInteger start  = range.location;
        NSUInteger length = range.length;
        NSUInteger end    = (self.length < (start + length)) ? self.length : (start + length);;
        
        NSString *headStr   = [self substringToIndex:start];
        NSString *tailStr   = [self substringFromIndex:end];
        NSString *middleStr = @"";
        
        NSUInteger count = (length > (self.length - start)) ? (self.length - start) : length;
        
        for (int i = 0; i < count; i++) {
            middleStr = [middleStr stringByAppendingString:encryptString];
        }
        
        return [NSString stringWithFormat:@"%@%@%@",headStr,middleStr,tailStr];
    }
}


///将身份证字符串转变成加密状态的显示(默认状态,中间8为显示成*)
- (NSString *)getEncryptionIdCard
{
    NSString *newIdCard = [self get18IdcardWithIdcard];
    
    if (!newIdCard) {
        return nil;
    }
    else {
        NSString *headStr   = [self substringToIndex:6];
        NSString *tailStr   = [self substringFromIndex:14];
        NSString *middleStr = @"******";
        return [NSString stringWithFormat:@"%@%@%@",headStr,middleStr,tailStr];
    }
}


/// 将身份证字符串某一段转以某种加密的字符串形式显示
- (NSString *)getEncryptionIdCardWithEncryptRange:(NSRange)range
                              encryptString:(NSString *)encryptString
{
    NSString *newIdCard = [self get18IdcardWithIdcard];
    
    if (!newIdCard) {
        return nil;
    }
    else {
        NSUInteger start  = range.location;
        NSUInteger length = range.length;
        NSUInteger end    = (self.length < (start + length)) ? self.length : (start + length);;
        
        NSString *headStr   = [self substringToIndex:start];
        NSString *tailStr   = [self substringFromIndex:end];
        NSString *middleStr = @"";
        
        NSUInteger count = (length > (self.length - start)) ? (self.length - start) : length;
        
        for (int i = 0; i < count; i++) {
            middleStr = [middleStr stringByAppendingString:encryptString];
        }
        
        return [NSString stringWithFormat:@"%@%@%@",headStr,middleStr,tailStr];
    }
}


/// 通过身份证号获取该人的性别
- (NSString *)getSexWithIdcard
{
    NSString *newIdCard = [self get18IdcardWithIdcard];
    
    if (!newIdCard) {
        return nil;
    }
    else {
        NSString *sex = [newIdCard substringWithRange:NSMakeRange(16,1)];
        return ([sex intValue] % 2 == 1) ? @"男" : @"女";
    }
}


/// 通过身份证号获取某人的出生日期
- (NSString *)getBirthdayWithIdcard
{
    NSString *newIdCard = [self get18IdcardWithIdcard];
    if (!newIdCard) {
        return nil;
    }
    else {
        //年份
        int strYear  = [[newIdCard substringWithRange:NSMakeRange(6, 4)] intValue];
        //月份
        int strMonth = [[newIdCard substringWithRange:NSMakeRange(10, 2)] intValue];
        //日
        int strDay   = [[newIdCard substringWithRange:NSMakeRange(12, 2)] intValue];
        
        return [NSString stringWithFormat:@"%04d-%02d-%02d",strYear,strMonth,strDay];
    }
}


///通过身份证号获取某人的年龄
- (NSInteger)getAgeWithIdcard
{
    NSString *newIdCard = [self get18IdcardWithIdcard];
    
    if (!newIdCard) {
        return 0;
    }
    else {
        NSDate *date = [NSDate date];
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSInteger currentYear = [calendar component:NSCalendarUnitYear fromDate:date];
        return currentYear - [[newIdCard substringWithRange:NSMakeRange(6, 4)] integerValue];
    }
}


/// 获取18位的身份证号(同时验证身份证合法性)
- (NSString *)get18IdcardWithIdcard
{
    BOOL restult = [NSString accurateVerifyIDCardNumber:self];
    
    if (restult == NO) {
        return nil;
    }
    else {
        
        NSMutableString *mString = [NSMutableString stringWithString:self];
        
        if (mString.length == 15) {
            [mString insertString:@"19" atIndex:6];
            //加权因子
            int R[] ={7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 };
            //校验码
            unsigned char sChecker[11]={'1','0','X', '9', '8', '7', '6', '5', '4', '3', '2'};
            
            long p = 0;
            
            const char *pid = [mString UTF8String];
            
            for (int i = 0; i <= 16; i++)
            {
                p += (pid[i]-48) * R[i];
            }
            int index = p%11;
            [mString appendFormat:@"%c",sChecker[index]];
        }
        return [NSString stringWithString:mString];
    }
}

@end
