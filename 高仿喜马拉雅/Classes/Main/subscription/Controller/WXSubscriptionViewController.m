//
//  WXSubscriptionViewController.m
//  高仿喜马拉雅
//
//  Created by 甲和灯 on 2016/11/25.
//  Copyright © 2016年 jiahedeng. All rights reserved.
//

#import "WXSubscriptionViewController.h"

@interface WXSubscriptionViewController ()

@end

@implementation WXSubscriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureNetWorkSubscription];
}

-(void)configureNetWorkSubscription{
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970] ;
    long long dTime = [[NSNumber numberWithDouble:interval] longLongValue]; // 将double转为long long型
    NSString *curTime = [NSString stringWithFormat:@"%llu",dTime]; // 输出long long型
    NSDictionary *diction = @{
                              @"device":@"iPhone",
                              @"sign":@"2",
                              @"size":@"30",
                              @"ts":curTime,
                              @"tsuid":@"3185651",
                              };
    
    AFHTTPSessionManager *NetWork = [AFHTTPSessionManager manager];
    NetWork.responseSerializer = [AFHTTPResponseSerializer serializer];

    NetWork.requestSerializer.timeoutInterval = 10.f;
    NetWork.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"text/plain",nil];
    [NetWork.requestSerializer setValue:[NSString stringWithFormat:@"domain=.ximalaya.com; path=/; channel=ios-b1; 1&_device=iPhone&DD487C68-B834-48DB-B832-89E419067A76&6.3.6; impl=com.gemd.iting; NSUP=42E8D0E6,421FCD05,1497340489465; XUM=DD487C68-B834-48DB-B832-89E419067A76; c-oper=未知; net-mode=WIFI; res=640,1136; 1&_token=3185651&e4e8f3340e60e04db00b1ca06ddb313aa85f; idfa=DD487C68-B834-48DB-B832-89E419067A76; x_xmly_ts=%@; x_xmly_resource=xm_source:subscribe; x_xmly_tid=2582174869",curTime] forHTTPHeaderField:@"Cookie"];

    [NetWork GET:@"http://140.207.215.242/feed/v4/feed/dynamic" parameters:diction progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = responseObject;
        NSLog(@"%@",dic);

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败-------%@",error);
        
    }];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
