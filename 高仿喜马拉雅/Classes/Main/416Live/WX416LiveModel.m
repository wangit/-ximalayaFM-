//
//  WX416LiveModel.m
//  高仿喜马拉雅
//
//  Created by 小帅哥 on 2019/5/31.
//  Copyright © 2019 jiahedeng. All rights reserved.
//

#import "WX416LiveModel.h"

@implementation WX416List

@end
@implementation WX416Datum
+ (NSDictionary *)objectClassInArray{
    return @{
             @"lists" : @"WX416List"
             
             };
}
@end
@implementation WX416LiveModel
+ (NSDictionary *)objectClassInArray{
    return @{
             @"data" : @"WX416Datum",
             
             };
}
@end
