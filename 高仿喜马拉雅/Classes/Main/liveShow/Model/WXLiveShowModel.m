//
//  WXLiveShowModel.m
//  高仿喜马拉雅
//
//  Created by lifesea on 2018/6/7.
//  Copyright © 2018年 jiahedeng. All rights reserved.
//

#import "WXLiveShowModel.h"

@implementation WXList

@end
@implementation WXSwitchs

@end

@implementation WXYinxiang

@end

@implementation WXAnchor
+ (NSDictionary *)objectClassInArray{
    return @{
             @"switchs" : @"WXSwitchs",
             
             };
}
@end

@implementation WXDatum
+ (NSDictionary *)objectClassInArray{
    return @{
             @"yinxiang" : @"WXYinxiang",
             @"anchor" : @"WXAnchor"

             };
}
@end

@implementation WXLiveShowModel
+ (NSDictionary *)objectClassInArray{
    return @{
             @"data" : @"WXDatum",
             @"list" : @"WXList"

             };
}
@end
