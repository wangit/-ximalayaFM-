//
//  RecommendView.m
//  高仿喜马拉雅
//
//  Created by 甲和灯 on 2016/11/30.
//  Copyright © 2016年 jiahedeng. All rights reserved.
//

#import "RecommendView.h"

@implementation RecommendView
@synthesize buttonOne;
@synthesize buttonTwo;
@synthesize buttonFive;
@synthesize buttonFour;
@synthesize buttonThree;
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.backgroundColor = [UIColor whiteColor];
        UILabel *lableTitle = [UILabel new];
        lableTitle.text = @"关闭的原因";
        lableTitle.font = [UIFont systemFontOfSize:14];
        lableTitle.textAlignment = NSTextAlignmentCenter;
        [self addSubview:lableTitle];
        lableTitle.sd_layout.leftEqualToView(self).rightEqualToView(self).topEqualToView(self).heightIs(20);
        
        buttonOne = [UIButton new];
        [buttonOne setTitle:@"不感兴趣" forState:(UIControlStateNormal)];
        buttonOne.titleLabel.font = [UIFont systemFontOfSize: 12.0];
        buttonOne.backgroundColor = kBSColorAppTheme;
        [self addSubview:buttonOne];
        buttonOne.sd_layout.leftSpaceToView(self,10).rightSpaceToView(self,10).topSpaceToView(lableTitle,10).heightIs(HeightScale(30));
        ViewRadius(buttonOne, HeightScale(15));
        
        buttonTwo = [UIButton new];
        [buttonTwo setTitle:@"不喜欢本期节目" forState:(UIControlStateNormal)];
        [buttonTwo setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
        [self addSubview:buttonTwo];
        buttonTwo.titleLabel.font = [UIFont systemFontOfSize: 12.0];
        buttonTwo.sd_layout.leftSpaceToView(self,10).widthIs(WidthScale(85)).topSpaceToView(buttonOne,10).heightIs(HeightScale(25));
        ViewBorderRadius(buttonTwo, HeightScale(12.5), 1, kBSColorSeparatorLine);
        
        buttonThree = [UIButton new];
        [buttonThree setTitle:@"内容质量差" forState:(UIControlStateNormal)];
        [buttonThree setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
        [self addSubview:buttonThree];
        buttonThree.titleLabel.font = [UIFont systemFontOfSize: 12.0];
        buttonThree.sd_layout.rightSpaceToView(self,10).widthIs(WidthScale(85)).topSpaceToView(buttonOne,10).heightIs(HeightScale(25));
        ViewBorderRadius(buttonThree, HeightScale(12.5), 1, kBSColorSeparatorLine);
        
        buttonFour = [UIButton new];
        [buttonFour setTitle:@"听过了" forState:(UIControlStateNormal)];
        [buttonFour setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
        [self addSubview:buttonFour];
        buttonFour.titleLabel.font = [UIFont systemFontOfSize: 12.0];
        buttonFour.sd_layout.rightSpaceToView(self,10).widthIs(WidthScale(85)).topSpaceToView(buttonThree,10).heightIs(HeightScale(25));
        ViewBorderRadius(buttonFour, HeightScale(12.5), 1, kBSColorSeparatorLine);
        
        
        buttonFive = [UIButton new];
        [buttonFive setTitle:@"不喜欢主播" forState:(UIControlStateNormal)];
        [buttonFive setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
        [self addSubview:buttonFive];
        buttonFive.titleLabel.font = [UIFont systemFontOfSize: 12.0];
        buttonFive.sd_layout.leftSpaceToView(self,10).widthIs(WidthScale(85)).topSpaceToView(buttonThree,10).heightIs(HeightScale(25));
        ViewBorderRadius(buttonFive, HeightScale(12.5), 1, kBSColorSeparatorLine);

        [buttonOne addTarget:self action:@selector(closeTap:) forControlEvents:(UIControlEventTouchUpInside)];
        [buttonTwo addTarget:self action:@selector(closeTap:) forControlEvents:(UIControlEventTouchUpInside)];
        [buttonThree addTarget:self action:@selector(closeTap:) forControlEvents:(UIControlEventTouchUpInside)];
        [buttonFour addTarget:self action:@selector(closeTap:) forControlEvents:(UIControlEventTouchUpInside)];
        [buttonFive addTarget:self action:@selector(closeTap:) forControlEvents:(UIControlEventTouchUpInside)];


    }
    return self;
}
- (void)closeTap:(UIButton *)sender{
    if ([sender isEqual:buttonOne]) {
        NSLog(@"1");
    }
    if ([sender isEqual:buttonTwo]) {
        NSLog(@"2");
    }
    if ([sender isEqual:buttonThree]) {
        NSLog(@"3");
    }
    if ([sender isEqual:buttonFour]) {
        NSLog(@"4");
    }
    if ([sender isEqual:buttonFive]) {
        NSLog(@"5");
    }
}
- (void)drawRect:(CGRect)rect {
    
    
}


@end
