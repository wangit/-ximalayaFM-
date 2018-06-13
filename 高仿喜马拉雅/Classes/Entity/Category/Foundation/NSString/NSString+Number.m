//
//  NSString+Number.m
//  BSMedical
//
//  Created by Bsoft on 16/3/18.
//  Copyright © 2016年 Bsoft. All rights reserved.
//

#import "NSString+Number.h"

@implementation NSString (Number)

/** 验证密码 6-20位数字和字母组成 */
+ (BOOL)checkPassWord:(NSString *)password
{
    NSInteger count = 0;
    NSInteger theii = 0;
    for (NSInteger i = 0; i<password.length; i++) {//123456
        NSString *theStr = [password substringWithRange:NSMakeRange(i, 1)];
        NSInteger ii = [theStr integerValue];
        if (ii == theii) {
            count++;
        }
        theii = ii;
        theii++;
    }
    
    if (count == password.length-1) {
        return NO;
    }
    
    count = 0;
    theii = 0;
    for (NSInteger i = password.length ;i>0; i--) {//654321
        NSString *theStr = [password substringWithRange:NSMakeRange(password.length - i, 1)];
        NSInteger ii = [theStr integerValue];
        if (ii == theii) {
            count++;
        }
        theii = ii;
        theii--;
    }
    if (count == password.length-1) {
        return NO;
    }
    return YES;
}


/// 验证是不是有效的整数
+ (BOOL)isPureInt:(NSString *)string
{
    NSScanner *scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}


/// 验证是不是有效的浮点数
+ (BOOL)isPureFloat:(NSString *)string
{
    NSScanner *scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}


/// 验证字符串 是整数和小数
+ (BOOL)isFloatOrInteger:(NSString *)textString
{
    NSString *matchesStr = @"^[0-9]+([.]{0,1}[0-9]{2}){0,1}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", matchesStr];
    BOOL isRight = [predicate evaluateWithObject:textString];
    if (isRight) {
        return YES;
    } else {
        return NO;
    }
}


@end
