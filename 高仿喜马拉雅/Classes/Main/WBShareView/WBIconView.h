//
//  WBIconView.h
//  -WBShareViewCopy-
//
//  Created by lifesea on 2018/9/4.
//  Copyright © 2018年 lifesea. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^WBIconViewClickViewBlock)(void);

@interface WBIconView : UIView
@property (nonatomic, copy) WBIconViewClickViewBlock wbIconViewClickViewBlock;
@property (nonatomic,strong) UIImageView *yellowImageView;
@property (nonatomic,strong) UILabel *yellowLable;

@end
