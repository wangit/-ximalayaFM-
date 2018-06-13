//
//  WXRecommendYouLikeModel.h
//  高仿喜马拉雅
//
//  Created by 深海小飞象🐙哥 on 2017/6/10.
//  Copyright © 2017年 jiahedeng. All rights reserved.
//

#import <Foundation/Foundation.h>
///猜你喜欢
@interface WXRecommendYouLikeModel : NSObject

//"albumId": 8225829,
//"commentScore": 4.70000000000000017763568394002504646778106689453125,
//"commentsCount": 518,
//"discountedPrice": 199.00,
//"displayDiscountedPrice": "199.00喜点",
//"displayPrice": "199.00喜点",
//"displayVipPrice": "189.05喜点",
//"infoType": "play_or_score",
//"isFinished": 0,
//"isPaid": true,
//"isVipFree": false,
//"lastUptrackAt": 1497052801000,
//"pic": "http://fdfs.xmcdn.com/group29/M02/FC/9E/wKgJXVkmTPHDpQOxAAGTwjJKJ_E651_mobile_large.jpg",
//"playsCount": 643035,
//"price": 199.00,
//"priceTypeEnum": 2,
//"recSrc": "TCPP",
//"recTrack": "mr.disK.2",
//"refundSupportType": 0,
//"subtitle": "【第三周答疑1】",
//"title": "耶鲁大学陈志武教授的金融课",
//"tracksCount": 17,
//"vipPrice": 189.05

/** albumId  */
@property (nonatomic, strong) NSString *commentScore;
/** albumId  */
@property (nonatomic, strong) NSString *commentsCount;
/** albumId  */
@property (nonatomic, strong) NSString *discountedPrice;
/** albumId  */
@property (nonatomic, strong) NSString *displayDiscountedPrice;
/** albumId  */
@property (nonatomic, strong) NSString *displayPrice;
/** albumId  */
@property (nonatomic, strong) NSString *displayVipPrice;

//----------
/** albumId  */
@property (nonatomic, strong) NSString *albumId;
/** albumId  */
@property (nonatomic, strong) NSString *infoType;
/** albumId  */
@property (nonatomic, strong) NSString *isFinished;
/** albumId  */
@property (nonatomic, strong) NSString *isPaid;
/** albumId  */
@property (nonatomic, strong) NSString *isVipFree;
/** albumId  */
@property (nonatomic, strong) NSString *lastUptrackAt;
/** albumId  */
@property (nonatomic, strong) NSString *pic;
/** albumId  */
@property (nonatomic, strong) NSString *playsCount;
/** albumId  */
@property (nonatomic, strong) NSString *recSrc;
/** albumId  */
@property (nonatomic, strong) NSString *recTrack;
/** albumId  */
@property (nonatomic, strong) NSString *refundSupportType;
/** albumId  */
@property (nonatomic, strong) NSString *subtitle;
/** albumId  */
@property (nonatomic, strong) NSString *title;
/** albumId  */
@property (nonatomic, strong) NSString *tracksCount;
@end
