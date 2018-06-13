//
//  WXViewController.h
//  MyHealth
//
//  Created by 甲和灯 on 2016/10/17.
//  Copyright © 2016年 jiahedeng. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  从后一个界面到前一个界面传值
 *
 *  @param vc   当前的controller
 *  @param data 携带的数据
 */
typedef void(^BlockGetTransformData)(UIViewController *vc, id data);
@interface WXViewController : UIViewController{
    MBProgressHUD *_HUD;
}
#pragma mark - 数据传值
@property (nonatomic, strong) id baseData;
@property (nonatomic, strong) id baseData_Family;//家庭成员专用
@property (nonatomic, copy) BlockGetTransformData blockGetTransformData;//通过 block 的方式, 向上一个界面传值

/**
 *  加载视图
 *
 *  @param hint 文字
 */
- (void)showActivity:(NSString *)hint;
/**
 *  加载视图消失
 */
- (void)hideHUDView;
@property (nonatomic, strong) NSMutableArray *mArrDataList;

@end
