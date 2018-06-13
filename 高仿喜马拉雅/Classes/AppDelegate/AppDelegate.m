//
//  AppDelegate.m
//  ElectronicDemo
//
//  Created by 甲和灯 on 2016/11/3.
//  Copyright © 2016年 jiahedeng. All rights reserved.
//

#import "AppDelegate.h"
#import "WXTabBarController.h"
#import "XHLaunchAd.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    [self StartTheController];

    return YES;
}
- (void)StartTheController{
    XHLaunchImageAdConfiguration *imageAdconfiguration = [XHLaunchImageAdConfiguration new];
    imageAdconfiguration.duration = 3;
    imageAdconfiguration.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-150);
    NSString *imgUrl = @"http://h.hiphotos.baidu.com/zhidao/pic/item/d058ccbf6c81800a2eb5d16bb63533fa828b4706.jpg";

    imageAdconfiguration.imageNameOrURLString = imgUrl;
    imageAdconfiguration.imageOption = XHLaunchAdImageRefreshCached;
    imageAdconfiguration.contentMode = UIViewContentModeScaleToFill;
    imageAdconfiguration.openURLString = @"http://www.baidu.com";

    imageAdconfiguration.showFinishAnimate =ShowFinishAnimateFadein;
    imageAdconfiguration.skipButtonType = SkipTypeTimeText;
    imageAdconfiguration.showEnterForeground = NO;
    [XHLaunchAd imageAdWithImageAdConfiguration:imageAdconfiguration delegate:self];
  
    WXTabBarController *root = [[WXTabBarController alloc]init];
    self.window.rootViewController =  root;


}
/**
 *  广告显示完成
 */
-(void)xhLaunchShowFinish:(XHLaunchAd *)launchAd
{
    NSLog(@"广告显示完成");
//    WXTabBarController *root = [[WXTabBarController alloc]init];
//    self.window.rootViewController =  root;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"sasasasasa");
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
