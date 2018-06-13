//
//  WXDiscoverTableViewCell.h
//  高仿喜马拉雅
//
//  Created by 深海小飞象🐙哥 on 2017/6/12.
//  Copyright © 2017年 jiahedeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXDiscoverModel.h"

@interface WXDiscoverTableViewCell : UITableViewCell
/** model  */
@property (nonatomic, strong) WXDiscoverModel *model;

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLable;
@property (weak, nonatomic) IBOutlet UIView *lineView;


@end
