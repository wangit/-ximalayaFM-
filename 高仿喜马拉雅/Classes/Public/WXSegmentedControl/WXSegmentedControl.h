//
//  WXSegmentedControl.h
//  高仿喜马拉雅
//
//  Created by 深海小飞象🐙哥 on 2017/6/14.
//  Copyright © 2017年 jiahedeng. All rights reserved.
//

#import <HMSegmentedControl/HMSegmentedControl.h>

@interface WXSegmentedControl : HMSegmentedControl
/**
 *  创建分段菜单
 *
 *  @param frame     frame
 *  @param arrTitles 菜单数组
 *
 *  @return 初始化
 */
- (id)initWithFrame:(CGRect)frame arrTitles:(NSArray *)arrTitles;
@end
