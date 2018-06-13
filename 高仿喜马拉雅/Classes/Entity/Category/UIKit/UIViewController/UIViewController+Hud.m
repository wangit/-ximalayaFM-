//
//  UIViewController+JHD.m
//  甲和灯
//
//  Created by 顾晨凯 on 15/9/11.
//  Copyright (c) 2015年 甲和灯. All rights reserved.
//

#import "UIViewController+Hud.h"

@interface UIViewController (){
    MBProgressHUD *hudActivity;
}
@end

@implementation UIViewController (Hud)


-(void)showToast:(NSString* )hint
{
//    [self.view makeToast:hint];
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.label.text = hint;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:2];
}





@end
