//
//  HDNetworking.h
//  GGHypertensionDoctor
//
//  Created by 深海小飞象🐙哥 on 2017/12/12.
//  Copyright © 2017年 gorgonor. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    JHEnumNetMethod_GET,
    JHEnumNetMethod_POST,
    JHEnumNetMethod_PUT,
    
} JHEnumNetMethod;

typedef void (^GHReturnSucceedBlock)(NSDictionary * succeed);
//上拉加载更多出错
typedef void (^GHReturnFailedBlock)(void);

@interface GXNetworking : NSObject

+ (instancetype)sharedTool;
/// 网络状态的Block
/**
 上传照片
 
 @param urlString 地址
 @param bodyDic 体
 @param image 图片
 @param imageAdress 图片地址
 @param dataBlock 回调
 */
- (void)postUpLoadDataByString:(NSString *)urlString BODYDic:(NSMutableDictionary *)bodyDic Image:(UIImage *)image imageAdress:(NSString *)imageAdress WithDataBlock:( void(^)(id  data))dataBlock;



///一般情况用
- (void)requestWithURLString:(NSString *)URLString
                  parameters:(id)parameters
                      method:(JHEnumNetMethod)method
                    callBack:(void (^)(id))callBack;

- (void)requestWithURLString: (NSString *)URLString
                  parameters: (id)parameters
                      method: (JHEnumNetMethod )method
                    callBack: (void (^)(id responseObject))callBack
                   errorBack: (void (^)(id errorObject))errorBack
                   noNetBack: (void (^)(id noNetObject))noNetBack;



@end
