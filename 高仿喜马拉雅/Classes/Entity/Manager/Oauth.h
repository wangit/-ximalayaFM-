//
//  Oauth.h
//  高仿喜马拉雅
//
//  Created by 深海小飞象🐙哥 on 2017/6/12.
//  Copyright © 2017年 jiahedeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXUserInfoModel.h"
@interface Oauth : NSObject
+ (void)save:(WXUserInfoModel*) bean;

+ (WXUserInfoModel*)read;
@end
