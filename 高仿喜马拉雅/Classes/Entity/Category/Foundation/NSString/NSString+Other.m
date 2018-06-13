//
//  NSString+Other.m
//  BSMedical
//
//  Created by Bsoft on 16/3/18.
//  Copyright © 2016年 Bsoft. All rights reserved.
//

#import "NSString+Other.h"

@implementation NSString (Other)

/** 去掉字符串首尾回车和空格 */
+ (NSString *)removeHeadAndTailSpacingWithString:(NSString *)string
{
    NSString *handledStr = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (handledStr.length == 0) {
        return @"无";
    } else {
        return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }
}


/** 判断是不是网址 */
+ (BOOL)isWebSiteWithUrlStr:(NSString *)urlStr
{
    if ([urlStr hasPrefix:@"http://"] || [urlStr hasPrefix:@"https://"]) {
        return YES;
    } else {
        return NO;
    }
}


/** 去掉html中的标签 */
+ (NSString *)filterHTML:(NSString *)html;
{
    NSScanner *theScanner = [NSScanner scannerWithString:html];
    NSString *text = nil;
    while ([theScanner isAtEnd] == NO) {
        [theScanner scanUpToString:@"<" intoString:NULL];
        [theScanner scanUpToString:@">" intoString:&text];
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>", text] withString:@""];
    }
    return [html stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];//去除文本前后的空格和回车
}


/** 是否包含空格 */
+ (BOOL)isContainBlank:(NSString *)string
{
    NSRange range = [string rangeOfString:@" "];
    if (range.location != NSNotFound) {
        return YES;
    }
    return NO;
}

@end
