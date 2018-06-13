//
//  UserLoveTableViewCell.h
//  高仿喜马拉雅
//
//  Created by 甲和灯 on 2016/11/28.
//  Copyright © 2016年 jiahedeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXRecommendYouLikeModel.h"
//猜你喜欢
@interface UserLoveTableViewCell : UITableViewCell
/** model  */
@property (nonatomic, strong) NSArray *list;
/** model  */
@property (nonatomic, strong) UIView *viewHeader;
@property (nonatomic, strong) UIImageView *imageOne;
@property (nonatomic, strong) UILabel *lableOne;
@property (nonatomic, copy) void(^coverDetailClickActionBlock)(WXRecommendYouLikeModel*model);
@property (nonatomic, copy) void(^moreDetailClickActionBlock)();

@end
