//
//  WXNetworking.h
//  高仿喜马拉雅
//
//  Created by 深海小飞象🐙哥 on 2017/6/9.
//  Copyright © 2017年 jiahedeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXNetworking : NSObject
singleton_interface(WXNetworking);
/**
 本地的get请求
 
 @param url saa
 @param dataBlock sasa
 @param failureBlock saasa
 */
-(void)MHNetGetUrl:(NSString * _Nonnull)url Data:(id _Nonnull)dataDict errcodeBlock:(nullable void(^)(id _Nullable data))errcodeBlock SuccessBlock:(nullable void(^)(id _Nullable data))dataBlock FailureBlock:(nullable void(^)(id _Nullable data))failureBlock;
@end
