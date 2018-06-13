//
//  WXRecommendViewController.h
//  高仿喜马拉雅
//
//  Created by 甲和灯 on 2016/11/29.
//  Copyright © 2016年 jiahedeng. All rights reserved.
//

#import "WXViewController.h"

@interface WXRecommendViewController : WXViewController<UITableViewDelegate,UITableViewDataSource>

/** 表视图  */
@property (nonatomic, strong) UITableView *tableView;
@end
