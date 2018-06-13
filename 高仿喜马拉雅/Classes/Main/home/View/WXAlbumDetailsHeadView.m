//
//  WXAlbumDetailsHeadView.m
//  高仿喜马拉雅
//
//  Created by 深海小飞象🐙哥 on 2017/6/13.
//  Copyright © 2017年 jiahedeng. All rights reserved.
//

#import "WXAlbumDetailsHeadView.h"

@implementation WXAlbumDetailsHeadView

-(void)setModel:(WXAlbumDetailsModel *)model{
    _model = model;
    [_imageHead sd_setImageWithURL:URL(model.coverMiddle) placeholderImage:nil];
    ViewBorderRadius(_imageHead, 0, 2, [UIColor whiteColor]);
    self.imageHead.layer.shadowOpacity = 1.0;// 阴影透明度
    self.imageHead.layer.shadowColor = [UIColor greenColor].CGColor;// 阴影的颜色
    self.imageHead.layer.shadowRadius = 3;// 阴影扩散的范围控制
    self.imageHead.layer.shadowOffset  = CGSizeMake(1, 1);// 阴影的范围
    
    _lableTitle.text = model.title;
    _lableNumber.text = [NSString stringWithFormat:@"%ld次",(long)model.subscribeCount];
    [_buttonUser setTitle:_model.nickname forState:(UIControlStateNormal)];
    [_butonTag setTitle:_model.categoryName forState:(UIControlStateNormal)];
}
- (void)drawRect:(CGRect)rect {
    _buttonLeft.frame = CGRectMake(20, _imageHead.bottom +20, 0, 30);
    _buttonLeft.width = SCREEN_WIDTH/2 - 30;
    [_buttonLeft setImage:[UIImage imageNamed:@"ic_jmgl"] forState:UIControlStateNormal];
    _buttonLeft.backgroundColor = [UIColor clearColor];
    [_buttonLeft setTitle:@"订阅(27.7万)" forState:UIControlStateNormal];
    ViewBorderRadius(_buttonLeft, 3, 1, UIColorFromRGB(0xF6664A));
    
    _buttonRight.frame = CGRectMake(SCREEN_WIDTH - _buttonLeft.width - 20, _imageHead.bottom +20, 0, 30);
    _buttonRight.width = SCREEN_WIDTH/2 - 30;
    [_buttonRight setImage:[UIImage imageNamed:@"ic_jmgl"] forState:UIControlStateNormal];
    _buttonRight.backgroundColor = [UIColor clearColor];

    [_buttonRight setTitle:@"批量下载" forState:UIControlStateNormal];
    ViewBorderRadius(_buttonRight, 3, 1, UIColorFromRGB(0xF6664A));

}


@end
