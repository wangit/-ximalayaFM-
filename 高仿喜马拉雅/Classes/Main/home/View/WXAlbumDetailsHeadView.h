//
//  WXAlbumDetailsHeadView.h
//  高仿喜马拉雅
//
//  Created by 深海小飞象🐙哥 on 2017/6/13.
//  Copyright © 2017年 jiahedeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXAlbumDetailsModel.h"
@interface WXAlbumDetailsHeadView : UIView
/** <#注释#>  */
@property (nonatomic, strong) WXAlbumDetailsModel *model;

@property (weak, nonatomic) IBOutlet UIImageView *imageHead;
@property (weak, nonatomic) IBOutlet UILabel *lableTitle;
@property (weak, nonatomic) IBOutlet UIButton *buttonUser;
@property (weak, nonatomic) IBOutlet UILabel *lableNumber;
@property (weak, nonatomic) IBOutlet UIButton *butonTag;
@property (weak, nonatomic) IBOutlet UIButton *buttonLeft;
@property (weak, nonatomic) IBOutlet UIButton *buttonRight;

@end
