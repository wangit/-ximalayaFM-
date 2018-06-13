//
//  HWTabBar.h
//  黑马微博2期
//
//  Created by apple on 14-10-8.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HWTabBar;

@protocol HWTabBarDelegate <UITabBarDelegate>
@optional
- (void)tabBarDidClickPlusButton:(HWTabBar *)tabBar;
@end

@interface HWTabBar : UITabBar
@property (nonatomic, weak) id<HWTabBarDelegate> delegate;
@end
