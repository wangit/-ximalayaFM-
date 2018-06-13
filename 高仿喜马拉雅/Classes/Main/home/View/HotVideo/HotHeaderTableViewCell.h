//
//  HotHeaderTableViewCell.h
//  高仿喜马拉雅
//
//  Created by 甲和灯 on 2016/11/28.
//  Copyright © 2016年 jiahedeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXRecommendIMGModel.h"
#import "WXRecommendICONModel.h"
@interface HotHeaderTableViewCell : UITableViewCell<SDCycleScrollViewDelegate>
@property(nonatomic,strong) SDCycleScrollView* cycleScrollerView;
/** 图片数组  */
@property (nonatomic, strong) NSMutableArray *imageArray;
/** 推荐数组标题  */
@property (nonatomic, strong) NSMutableArray *IconTitleArray;
/** 推荐数组图片  */
@property (nonatomic, strong) NSMutableArray *IconImageArray;

@property (nonatomic, copy) void(^IconDetailClickActionBlock)(NSInteger NumberTag);
/** 滚动视图  */
@property (nonatomic, strong) WXRecommendIMGModel *imageScr;
/**   */
@property (nonatomic, strong) UIScrollView* scrollView;
@end
