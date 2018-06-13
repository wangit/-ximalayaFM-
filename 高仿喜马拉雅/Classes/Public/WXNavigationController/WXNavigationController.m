//
//  WXNavigationController.m
//  MyHealth
//
//  Created by 甲和灯 on 16/10/9.
//  Copyright © 2016年 jiahedeng. All rights reserved.
//

#import "WXNavigationController.h"

@interface WXNavigationController ()

@end

@implementation WXNavigationController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureView];
}

#pragma mark - Private Methods
- (void)configureView
{
   // [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigation_bar_background"] forBarMetrics:UIBarMetricsDefault];
   // [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    UIImage* myImage = [UIImage imageNamed:@"whitelogo.png"];
    UIImageView*  imgView = [[UIImageView alloc] initWithImage:myImage];
    [imgView setFrame:CGRectMake(14.0f, 9.5f, 104.0f,25.0f)];
    [self.navigationBar addSubview:imgView];
  [self.navigationBar setBackgroundImage:[UIImage createImageWithColor:kBSColorNavBar] forBarMetrics:(UIBarMetricsDefault)];//设置 navbar 背景图片
    self.navigationBar.titleTextAttributes = @{NSFontAttributeName: kBSFontNavTitle, NSForegroundColorAttributeName: kBSColorNavBarTitle};
    self.navigationBar.tintColor = kBSColorBlack;
    //self.navigationBar.shadowImage = [[UIImage alloc] init];//去掉 导航栏下面的细线
    [[UITabBar appearance] setBackgroundImage:[UIImage createImageWithColor:UIColorFromRGB(0xFFFFFF)]];
    [UITabBar appearance].translucent = YES;
    UIImage *img = [[UIImage imageNamed:@"btn_back_n"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 18, 0, 0)];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-1000, 0) forBarMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:img forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

#pragma mark - Memory Warning
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
