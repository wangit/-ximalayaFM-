//
//  Tool.h
//  高仿喜马拉雅
//
//  Created by 深海小飞象🐙哥 on 2017/6/14.
//  Copyright © 2017年 jiahedeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tool : NSObject
///时间戳转xx前
+ (NSString *)updateTimeForRow:(NSString *)createTimeString;
///传入 秒  得到 xx:xx:xx
+(NSString *)getHHMMSSFromSS:(NSString *)totalTime;
///传入 秒  得到 xx:xx
+(NSString *)getMMSSFromSS:(NSString *)totalTime;
@end
