//
//  HDNetworking.m
//  GGHypertensionDoctor
//
//  Created by 深海小飞象🐙哥 on 2017/12/12.
//  Copyright © 2017年 gorgonor. All rights reserved.
//

#import "GXNetworking.h"
#import "DeviceInfos.h"

static GXNetworking *instance = nil;
@interface GXNetworking ()
@end

@implementation GXNetworking
static NSMutableArray *_allSessionTask;

+ (instancetype)sharedTool {

    if (!instance) {
        instance = [[self alloc] init];
    }
    return instance;
}


#pragma mark - 加载基本信息
- (void)loadMsgBaseUserInfoUseManager:(AFHTTPSessionManager *)manager{
    __weak typeof(self) weakSelf = self;
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer]; //调出请求头
    manager.requestSerializer.timeoutInterval = 10;  //设置请求超时时间
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    
    NSString *networkStatus = [[NSUserDefaults standardUserDefaults] objectForKey:@"networkStatus"];
    if (networkStatus == nil) {
        networkStatus = @"unKnown";
    }
    //将token封装入请求头
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"{'token':'%@'}",@""] forHTTPHeaderField:@"authorization"];
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"{'imei':'%@','model':'%@','sysVer':'%@','network':'%@','location':'unknown'}", [weakSelf.class getDeviceIdentifier], [weakSelf.class getDeviceInfo], [weakSelf.class getAppVersion], networkStatus] forHTTPHeaderField:@"device"];
    
    NSLog(@"Header Info ~~~ token:%@, device:%@", [NSString stringWithFormat:@"{'token':'%@'}", @"这个是token"], [NSString stringWithFormat:@"{'imei':'%@','model':'%@','sysVer':'%@','network':'%@','location':'unknown'}", [weakSelf.class getDeviceIdentifier], [weakSelf.class getDeviceInfo], [weakSelf.class getAppVersion], networkStatus]);
    
    [self KVONetworkChange];
}

- (void)loadBaseUserInfoUseManager:(AFHTTPSessionManager *)manager withToken:(NSString *)token
{
    __weak typeof(self) weakSelf = self;
    manager.requestSerializer = [AFJSONRequestSerializer serializer]; //调出请求头
    manager.requestSerializer.timeoutInterval = 10;  //设置请求超时时间
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    
    NSString *networkStatus = [[NSUserDefaults standardUserDefaults] objectForKey:@"networkStatus"];
    if (networkStatus == nil) {
        networkStatus = @"unKnown";
    }
    //将token封装入请求头
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"{'token':'%@'}",token] forHTTPHeaderField:@"authorization"];
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"{'imei':'%@','model':'%@','sysVer':'%@','network':'%@','location':'unknown'}", [weakSelf.class getDeviceIdentifier], [weakSelf.class getDeviceInfo], [weakSelf.class getAppVersion], networkStatus] forHTTPHeaderField:@"device"];
    
    
    [self KVONetworkChange];
}

- (void)loadBaseUserInfoUseManager:(AFHTTPSessionManager *)manager
{
    __weak typeof(self) weakSelf = self;
    manager.requestSerializer = [AFJSONRequestSerializer serializer]; //调出请求头
    manager.requestSerializer.timeoutInterval = 10;  //设置请求超时时间
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    
    NSString *networkStatus = [[NSUserDefaults standardUserDefaults] objectForKey:@"networkStatus"];
    if (networkStatus == nil) {
        networkStatus = @"unKnown";
    }
    //将token封装入请求头
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"{'token':'%@'}",@""] forHTTPHeaderField:@"authorization"];
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"{'imei':'%@','model':'%@','sysVer':'%@','network':'%@','location':'unknown'}", [weakSelf.class getDeviceIdentifier], [weakSelf.class getDeviceInfo], [weakSelf.class getAppVersion], networkStatus] forHTTPHeaderField:@"device"];
    
    NSLog(@"Header Info ~~~ token:%@, ",manager.requestSerializer.HTTPRequestHeaders);
    
    [self KVONetworkChange];
}


- (void)requestWithURLString:(NSString *)URLString parameters:(id)parameters method:(JHEnumNetMethod)method callBack:(void (^)(id))callBack
{
    
    
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
    securityPolicy.validatesDomainName = NO;
    securityPolicy.allowInvalidCertificates = YES;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = securityPolicy;

    [self loadBaseUserInfoUseManager:manager];

    NSString *currentUrlStr = [NSString stringWithFormat:@"http://140.207.215.247/%@", URLString];
    currentUrlStr = [currentUrlStr  stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    if (parameters == nil) {
        parameters = [[NSMutableDictionary alloc] init];
    }

    [self requestWithDifferentLinksURLString:currentUrlStr AFHTTPSessionManager:manager parameters:parameters method:method callBack:^(id responseObject) {
        callBack(responseObject);
    } errorBack:^(id errorObject) {
        
    } noNetBack:^(id noNetObject) {
        
    }];
    
}





- (void)requestWithURLString: (NSString *)URLString
                  parameters: (id)parameters
                      method: (JHEnumNetMethod )method
                    callBack: (void (^)(id responseObject))callBack
                   errorBack: (void (^)(id errorObject))errorBack
                   noNetBack: (void (^)(id noNetObject))noNetBack

{
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
    securityPolicy.validatesDomainName = NO;
    securityPolicy.allowInvalidCertificates = YES;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = securityPolicy;
    
    [self loadBaseUserInfoUseManager:manager];
    
    NSString *currentUrlStr = [NSString stringWithFormat:@"http://140.207.215.247/%@", URLString];
    
    if (parameters == nil) {
        parameters = [[NSMutableDictionary alloc] init];
    }
    [self requestWithDifferentLinksURLString:currentUrlStr AFHTTPSessionManager:manager parameters:parameters method:method callBack:^(id responseObject) {
        callBack(responseObject);
    } errorBack:^(id errorObject) {
        errorBack(errorObject);

    } noNetBack:^(id noNetObject) {
        noNetBack(noNetObject);

    }];
    
   
}




- (void)postUpLoadDataByString:(NSString *)urlString BODYDic:(NSMutableDictionary *)bodyDic Image:(UIImage *)image imageAdress:(NSString *)imageAdress WithDataBlock:( void(^)(id data))dataBlock{
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:urlString]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"multipart/form-data" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",nil];
    manager.requestSerializer.timeoutInterval = 10.f;
    [manager POST:urlString parameters:bodyDic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData *data = [self compressOriginalImage:[self scaleToWidth:0.5 image:image] toMaxDataSizeKBytes:1024];
        

        [formData appendPartWithFileData:data  name:@"upFile" fileName:[NSString stringWithFormat:@"%@.jpg",imageAdress] mimeType:@"image/jpeg"];
        
    } progress:^(NSProgress *  uploadProgress) {

    } success:^(NSURLSessionDataTask *  task, id   responseObject) {
        dataBlock(responseObject);
    } failure:^(NSURLSessionDataTask *  task, NSError *  error) {
        NSLog(@"\n*************\n\n加载失败\n\n*************%@",error);
    }];
    
}


- (UIImage *)scaleToWidth:(CGFloat)width image:(UIImage *)image{
    if (width > image.size.width) {
        return image;
    }
    CGFloat height = (image.size.width *width / image.size.width) * image.size.height;
    CGRect rect = CGRectMake(0, 0,  image.size.width *width, height);
    UIGraphicsBeginImageContext(rect.size);
    [image drawInRect:rect];
    UIImage * image1 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image1;
    
}

- (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size{
    NSData * data = UIImageJPEGRepresentation(image, 1.0);
    CGFloat dataKBytes = data.length/1000.0;
    CGFloat maxQuality = 0.9f;
    CGFloat lastData = dataKBytes;
    while (dataKBytes > size && maxQuality > 0.01f) {
        maxQuality = maxQuality - 0.01f;
        data = UIImageJPEGRepresentation(image, maxQuality);
        dataKBytes = data.length / 1000.0;
        if (lastData == dataKBytes) {
            break;
        }else{
            lastData = dataKBytes;
        }
    }
    return data;
}

+ (NSString *)getDeviceIdentifier{
    NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    /*
     模拟器专用，模拟器的设备号每次运行都不唯一，每次都需要登录，故使用宏来设置固定值。－ZJJ
     */
#ifdef SIMULATORTEST
    return @"imei";
#endif
    return idfv;
}

+ (NSString *)getDeviceInfo
{
    //! 获取设备信息
    NSString *iOSDeviceInfo = [NSString stringWithFormat:@"%@-%@",[DeviceInfos getDeviceName],[DeviceInfos getDeviceSystemVersion]];
    iOSDeviceInfo = [iOSDeviceInfo stringByReplacingOccurrencesOfString:@" " withString:@""];
    return iOSDeviceInfo;
}

#pragma mark － 获取App版本号
+ (NSString *)getAppVersion {
    // 设置app build的版本号
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return app_Version;
}

#pragma mark - 处理错误事件
- (void)handleErrorInfoUseCode:(NSString *)messageCode Message:(NSString *)messageStr
{
    //0702010415:您的登录状态已过期，请重新登陆   0702010416:您的账号在其他设备登陆，请重新登陆
    if ([messageCode isEqualToString:@"0702010415"] || [messageCode isEqualToString:@"0702010416"]) {
 

    } else {
  
    }
    
}

#pragma mark - 监控网络状态
- (void)KVONetworkChange {
//    [self networkStatusWithBlock:^(GXNetworkStatusType status) {
//        if(status == PPNetworkStatusNotReachable){
//            [GXActivity showBriefAlert:@"网络错误，请检查网络"];
//        }
//
//    }];
    
    __block NSString *networkStatus = @"unkonw";
    
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:{
                networkStatus = @"unKnown";
            }
                break;
            case AFNetworkReachabilityStatusNotReachable:{
                networkStatus = @"unKnown";

            }
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:{
                networkStatus = @"WWAN";
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi: {
                networkStatus = @"WiFi";
            }
                break;
            default:
                networkStatus = @"unKnown";
                break;
        }
        
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault setObject:networkStatus forKey:@"networkStatus"];
        [userDefault synchronize];
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

#pragma mark - 获取用户基本信息
- (void)addUserBaseInfoToMutableDictionary:(NSMutableDictionary *)dict_M
{

    
        [dict_M setObject:@"3c399036b8d048478e74121ffc7c4194789" forKey:@"token"];
        [dict_M setObject:@"hbpdoctor_imei" forKey:@"imei"];
        [dict_M setObject:[self.class getAppVersion] forKey:@"version"];
        [dict_M setObject:@"Redmi Note 4-Android:6.0-23" forKey:@"sysinfo"];
}

- (void)requestWithDifferentLinksURLString: (NSString *)URLString
                      AFHTTPSessionManager:(AFHTTPSessionManager *)manager
                                parameters: (id)parameters
                                    method: (JHEnumNetMethod )method
                                  callBack: (void (^)(id responseObject))callBack
                                 errorBack: (void (^)(id errorObject))errorBack
                                 noNetBack: (void (^)(id noNetObject))noNetBack{
    
    
    NSLog(@"\n**************************\n*\n*\t\t加载数据\n\n*rentUploadUrlStr: %@ \n*\n*参数------------%@\n*\n*\n***************************",URLString,parameters);
    
    if (method == JHEnumNetMethod_GET) {
        //调用AFN框架的方法
        [manager GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            //如果请求成功，则回调responseObject
            NSDictionary *json = responseObject;
            
            NSLog(@"\n*************\n\nnetwork all data 返回的数据\n\n*************%@",responseObject);
            
            if ([json[@"header"][@"errcode"] intValue] == 0) {
                callBack(json[@"data"]);
            }else{
               
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            //如果请求失败，控制台打印错误信息
            errorBack(error);
           
            NSLog(@"\n*************\n\nnetwork all error\n\n*************%@",error);
            
        }];
    } else if (method == JHEnumNetMethod_POST) {
        [manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSDictionary *json = responseObject;
            
            NSLog(@"\n*************\n\nnetwork all data\n\n*************%@",responseObject);
            
            if ([json[@"header"][@"errcode"] intValue] == 0) {
                callBack(json[@"data"]);
            }else{
      
               
                
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            errorBack(error);
            

            NSLog(@"\n*************\n\nnetwork all error\n\n*************%@",error);
            
        }];
    } else {
    }
}


#pragma mark - 获取网络缓存
/**
 存储着所有的请求task数组
 */
- (NSMutableArray *)allSessionTask {
    if (!_allSessionTask) {
        _allSessionTask = [[NSMutableArray alloc] init];
    }
    return _allSessionTask;
}


@end
