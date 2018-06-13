//
//  UIViewController+Time.m
//  高仿喜马拉雅
//
//  Created by 深海小飞象🐙哥 on 2017/6/13.
//  Copyright © 2017年 jiahedeng. All rights reserved.
//

#import "UIViewController+Time.h"

@implementation UIViewController (Time)
- (NSString *)intervalTime{
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970] *1000;
    long long dTime = [[NSNumber numberWithDouble:interval] longLongValue]; // 将double转为long long型
    NSString *curTime = [NSString stringWithFormat:@"%llu",dTime]; // 输出long long型
    return curTime;
}
@end
