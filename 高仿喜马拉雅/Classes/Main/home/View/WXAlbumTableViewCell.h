//
//  WXAlbumTableViewCell.h
//  高仿喜马拉雅
//
//  Created by 深海小飞象🐙哥 on 2017/6/14.
//  Copyright © 2017年 jiahedeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXAlbumTracks.h"
@interface WXAlbumTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *play;
@property (weak, nonatomic) IBOutlet UILabel *comment;
@property (weak, nonatomic) IBOutlet UILabel *playTime;
/** 模型  */
@property (nonatomic, strong) WXAlbumTracks *model;
@end
