//
//  RecommendTableViewCell.m
//  高仿喜马拉雅
//
//  Created by 甲和灯 on 2016/11/29.
//  Copyright © 2016年 jiahedeng. All rights reserved.
//

#import "RecommendTableViewCell.h"

@implementation RecommendTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    ViewBorderRadius(_lableOne, 3, 1, kBSColorSubTitle);
}

- (IBAction)closeTap:(id)sender {
    if (self.closeDetailClickActionBlock) {
        self.closeDetailClickActionBlock();
    }
}
-(void)setModelList:(WXRecommendModel *)modelList{
    _modelList = modelList;
    _TitleList.text = _modelList.title;
    _TotleList.text = [NSString stringWithFormat:@"%@集",_modelList.tracks];;
    _subList.text = [NSString stringWithFormat:@"专辑：%@",_modelList.intro];
    [_headList sd_setImageWithURL:[NSURL URLWithString:_modelList.coverMiddle] placeholderImage:IMG(@"shopping2")];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
