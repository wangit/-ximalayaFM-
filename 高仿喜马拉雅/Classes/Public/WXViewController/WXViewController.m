//
//  WXViewController.m
//  MyHealth
//
//  Created by 甲和灯 on 2016/10/17.
//  Copyright © 2016年 jiahedeng. All rights reserved.
//

#import "WXViewController.h"

@interface WXViewController ()

@end

@implementation WXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = UIColorFromRGB(0xf3f3f3);
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showActivity:(NSString *)hint{
    UIView *view = [[UIApplication sharedApplication].delegate window];
    UIImage  *image = [UIImage sd_animatedGIFNamed:@"hcn_loading"];
    UIImageView *gifview = [[UIImageView alloc]initWithFrame:CGRectMake(0,0,WidthScale(80), HeightScale(60))];
    gifview.image = image;
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    //hud.color = [UIColor lightGrayColor];//默认颜色太深了
    hud.mode = MBProgressHUDModeCustomView;
    hud.label.text = hint;
    hud.label.font = [UIFont systemFontOfSize:14];
    hud.customView = gifview;
    _HUD = hud;
    
}
- (void)hideHUDView
{
    [_HUD hideAnimated:YES];
}

#pragma mark - Getters And Setters
- (NSMutableArray *)mArrDataList
{
    if (!_mArrDataList) {
        _mArrDataList = [NSMutableArray array];
    }
    return _mArrDataList;
}
@end
