//
//  WXRecommendModel.h
//  高仿喜马拉雅
//
//  Created by 甲和灯 on 2016/11/30.
//  Copyright © 2016年 jiahedeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXRecommendModel : NSObject
/** id  */
@property (nonatomic, strong) NSString *idList;
/** albumId  */
@property (nonatomic, strong) NSString *albumId;
/** uid  */
@property (nonatomic, strong) NSString *uid;
/** 介绍  */
@property (nonatomic, strong) NSString *intro;
/** 名字  */
@property (nonatomic, strong) NSString *nickname;
/** 专辑封面  */
@property (nonatomic, strong) NSString *albumCoverUrl290;
/** 小封面  */
@property (nonatomic, strong) NSString *coverSmall;
/** 中封面  */
@property (nonatomic, strong) NSString *coverMiddle;
/** 大封面  */
@property (nonatomic, strong) NSString *coverLarge;
/** 标题  */
@property (nonatomic, strong) NSString *title;
/** 标签  */
@property (nonatomic, strong) NSString *tag;
/** 跟踪  */
@property (nonatomic, strong) NSString *tracks;
/** 中数  */
@property (nonatomic, strong) NSString *playsCounts;
/** subscribesCounts  */
@property (nonatomic, strong) NSString *subscribesCounts;
/** lastUptrackId  */
@property (nonatomic, strong) NSString *lastUptrackId;
/** lastUptrackTitle  */
@property (nonatomic, strong) NSString *lastUptrackTitle;
/** lastUptrackAt  */
@property (nonatomic, strong) NSString *lastUptrackAt;
/** isFinished  */
@property (nonatomic, strong) NSString *isFinished;
/** serialState  */
@property (nonatomic, strong) NSString *serialState;
/** trackId  */
@property (nonatomic, strong) NSString *trackId;
/** 提供者  */
@property (nonatomic, strong) NSString *provider;
/** 支付  */
@property (nonatomic, strong) NSString *isPaid;
/** priceTypeId  */
@property (nonatomic, strong) NSString *priceTypeId;
/** categoryId  */
@property (nonatomic, strong) NSString *categoryId;
/** refundSupportType  */
@property (nonatomic, strong) NSString *refundSupportType;
/** isVipFree  */
@property (nonatomic, strong) NSString *isVipFree;
@end
