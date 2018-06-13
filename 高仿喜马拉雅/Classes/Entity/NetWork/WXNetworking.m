//
//  WXNetworking.m
//  高仿喜马拉雅
//
//  Created by 深海小飞象🐙哥 on 2017/6/9.
//  Copyright © 2017年 jiahedeng. All rights reserved.
//

#import "WXNetworking.h"

@implementation WXNetworking
singleton_implementation(WXNetworking);
-(void)MHNetGetUrl:(NSString * _Nonnull)url Data:(id _Nonnull)dataDict errcodeBlock:(nullable void(^)(id _Nullable data))errcodeBlock SuccessBlock:(nullable void(^)(id _Nullable data))dataBlock FailureBlock:(nullable void(^)(id _Nullable data))failureBlock{
    
    AFHTTPSessionManager *NetWork = [AFHTTPSessionManager manager];
    NetWork.requestSerializer.timeoutInterval = 10.f;
    NetWork.requestSerializer = [AFJSONRequestSerializer serializer];
    NetWork.responseSerializer = [AFJSONResponseSerializer serializer];
    NetWork.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"text/plain",nil];
    [NetWork GET:url parameters:dataDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = responseObject;

        if ([dic[@"msg"] isEqualToString:@"成功"] || [dic[@"msg"] isEqualToString:@"0"]) {//数据错误
            dataBlock(responseObject);

        }
        else{
            NSLog(@"失败-------%@",dic[@"msg"]);
            errcodeBlock(@"1");

        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败-------%@",error);
        
        failureBlock(error);
    }];
}

@end
