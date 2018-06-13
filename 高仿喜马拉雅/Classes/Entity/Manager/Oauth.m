//
//  Oauth.m
//  高仿喜马拉雅
//
//  Created by 深海小飞象🐙哥 on 2017/6/12.
//  Copyright © 2017年 jiahedeng. All rights reserved.
//

#import "Oauth.h"
#define KEY_USER_DATA (@"userdata")

@implementation Oauth
+ (void)save:(WXUserInfoModel*) bean{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    if(bean){
        [defaults setObject:bean.mj_keyValues forKey:KEY_USER_DATA];
    }else{
        //做nil处理是当用户还是不登陆的话,下一次授权可以不联网直接不通过
        [defaults setObject:@"" forKey:KEY_USER_DATA];
    }
    
    [defaults synchronize];
}

+ (WXUserInfoModel*)read{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    NSDictionary* dict = [defaults objectForKey:KEY_USER_DATA];
    WXUserInfoModel *bean = [WXUserInfoModel mj_objectWithKeyValues:dict];
    
    if(IsEmpty(bean)){
        return nil;
    }
    return bean;
}
@end
