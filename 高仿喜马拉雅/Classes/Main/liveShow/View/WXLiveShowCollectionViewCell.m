//
//  WXLiveShowCollectionViewCell.m
//  高仿喜马拉雅
//
//  Created by lifesea on 2018/6/7.
//  Copyright © 2018年 jiahedeng. All rights reserved.
//

#import "WXLiveShowCollectionViewCell.h"
@interface WXLiveShowCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *stateIMG;
@property (weak, nonatomic) IBOutlet UIImageView *headIMG;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *addressLable;

@property (weak, nonatomic) IBOutlet UIImageView *sexLable;
@property (weak, nonatomic) IBOutlet UIImageView *suoIMG;
@end;

@implementation WXLiveShowCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setModel:(WXDatum *)model{
    [self.headIMG sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:IMG(@"find_radio_default")];
    self.nameLable.text = model.title;
    self.addressLable.text = model.city;
    self.sexLable.image = IMG(@"性别女");
   // if (model.live_fee) {
        self.suoIMG.hidden = NO;
//
//    }else{
//        self.suoIMG.hidden = YES;
//
//    }
}
@end
