//
//  RecommendTableViewCell.h
//  高仿喜马拉雅
//
//  Created by 甲和灯 on 2016/11/29.
//  Copyright © 2016年 jiahedeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXRecommendModel.h"
@interface RecommendTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *subList;
@property (weak, nonatomic) IBOutlet UILabel *TitleList;
@property (weak, nonatomic) IBOutlet UIImageView *headList;
@property (weak, nonatomic) IBOutlet UILabel *TotleList;

@property (weak, nonatomic) IBOutlet UILabel *lableOne;
@property (nonatomic, copy) void(^closeDetailClickActionBlock)();
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
/** 模型  */
@property (nonatomic, strong) WXRecommendModel *modelList;
@end
