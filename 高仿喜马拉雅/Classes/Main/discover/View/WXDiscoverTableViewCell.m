//
//  WXDiscoverTableViewCell.m
//  高仿喜马拉雅
//
//  Created by 深海小飞象🐙哥 on 2017/6/12.
//  Copyright © 2017年 jiahedeng. All rights reserved.
//

#import "WXDiscoverTableViewCell.h"
@implementation WXDiscoverTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModel:(WXDiscoverModel *)model{
    _model = model;
    _titleLable.text = model.title;
    _subTitleLable.text = model.subtitle;
    [_iconImage sd_setImageWithURL:URL(model.coverPath) placeholderImage:nil];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
