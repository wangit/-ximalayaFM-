//
//  NSArray+Utils.m
//  BSMedical
//
//  Created by Bsoft on 16/3/22.
//  Copyright © 2016年 Bsoft. All rights reserved.
//

#import "NSDictionary+ToJson.h"

@implementation NSDictionary(ToJson)

+ (NSString *)dictionaryToJson:(NSDictionary *)dic{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}


@end
