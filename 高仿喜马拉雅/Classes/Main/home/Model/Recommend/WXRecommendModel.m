//
//  WXRecommendModel.m
//  高仿喜马拉雅
//
//  Created by 甲和灯 on 2016/11/30.
//  Copyright © 2016年 jiahedeng. All rights reserved.
//

#import "WXRecommendModel.h"

@implementation WXRecommendModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"idList": @"id"};
}
@end
