//
//  WXAlbumTableViewCell.m
//  高仿喜马拉雅
//
//  Created by 深海小飞象🐙哥 on 2017/6/14.
//  Copyright © 2017年 jiahedeng. All rights reserved.
//

#import "WXAlbumTableViewCell.h"

@implementation WXAlbumTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    ViewBorderRadius(_headImage, 20, 2, [UIColor whiteColor]);
}
-(void)setModel:(WXAlbumTracks *)model{
    _model = model;
    _title.text = _model.title;
    _time.text = [Tool updateTimeForRow:[NSString stringWithFormat:@"%ld",_model.createdAt]];
    [_headImage sd_setImageWithURL:URL(_model.coverMiddle) placeholderImage:IMG(@"1")];
    _play.text =[NSString stringWithFormat:@"%ld",_model.playtimes];
    _comment.text =[NSString stringWithFormat:@"%ld",_model.comments];
    if (_model.duration > 3600) {
          _playTime.text =[Tool getHHMMSSFromSS:[NSString stringWithFormat:@"%ld",_model.duration]];
    }
    else{
          _playTime.text =[Tool getMMSSFromSS:[NSString stringWithFormat:@"%ld",_model.duration]];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
