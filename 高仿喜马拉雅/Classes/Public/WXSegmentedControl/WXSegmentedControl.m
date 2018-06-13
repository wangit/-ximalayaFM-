//
//  WXSegmentedControl.m
//  高仿喜马拉雅
//
//  Created by 深海小飞象🐙哥 on 2017/6/14.
//  Copyright © 2017年 jiahedeng. All rights reserved.
//

#import "WXSegmentedControl.h"

@implementation WXSegmentedControl

- (id)initWithFrame:(CGRect)frame arrTitles:(NSArray *)arrTitles;
{
    self = [super initWithFrame:frame];
    if (self) {
        //添加线条
        UIView *viewLine = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height - 1, frame.size.width, 1)];
        viewLine.backgroundColor = kBSColorViewDefaultBackground;
        [self addSubview:viewLine];
        //
        self.sectionTitles = arrTitles;
        self.selectedSegmentIndex = 0;
        self.selectionIndicatorHeight = 3.0f;
        self.backgroundColor = [UIColor whiteColor];
        self.titleTextAttributes = @{NSForegroundColorAttributeName:RGBCOLOR(130, 130, 130), NSFontAttributeName : [UIFont systemFontOfSize:15.0f],   };
        self.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : kBSColorAppTheme , NSFontAttributeName : [UIFont systemFontOfSize:15.0f],
};
        self.selectionIndicatorColor = kBSColorAppTheme;
        self.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
        self.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationNone;
     
    }
    return self;
}


@end
