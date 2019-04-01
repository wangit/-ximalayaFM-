//
//  WXLiveShowVIPModel.m
//  高仿喜马拉雅
//
//  Created by 小帅哥 on 2019/3/29.
//  Copyright © 2019 jiahedeng. All rights reserved.
//

#import "WXLiveShowVIPModel.h"
@implementation WXLiveShowVIPlist

@end
@implementation WXLiveShowVIPData
+ (NSDictionary *)objectClassInArray{
    return @{
             @"list" : @"WXLiveShowVIPlist"
             
             };
}
@end

@implementation WXLiveShowVIPModel
+ (NSDictionary *)objectClassInArray{
    return @{
             @"data" : @"WXLiveShowVIPData",
             @"list" : @"WXList"
             
             };
}
@end
