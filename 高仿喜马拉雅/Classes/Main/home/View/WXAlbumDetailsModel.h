//
//  WXAlbumDetailsModel.h
//  高仿喜马拉雅
//
//  Created by 深海小飞象🐙哥 on 2017/6/13.
//  Copyright © 2017年 jiahedeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXAlbumDetailsModel : NSObject


@property (nonatomic , assign) NSInteger              playTimes;
@property (nonatomic , assign) NSInteger              updatedAt;
@property (nonatomic , assign) NSInteger              uid;
@property (nonatomic , assign) NSInteger              categoryId;
@property (nonatomic , copy) NSString              * shortIntro;
@property (nonatomic , copy) NSString              * coverMiddle;
@property (nonatomic , assign) BOOL              isPublic;
@property (nonatomic , assign) BOOL              hasNew;
@property (nonatomic , assign) NSInteger              serializeStatus;
@property (nonatomic , copy) NSString              * nickname;
@property (nonatomic , copy) NSString              * introRich;
@property (nonatomic , assign) BOOL              isFavorite;
@property (nonatomic , assign) BOOL              isVerified;
@property (nonatomic , assign) NSInteger              playTrackId;
@property (nonatomic , assign) NSInteger              shares;
@property (nonatomic , copy) NSString              * coverLarge;
@property (nonatomic , copy) NSString              * intro;
@property (nonatomic , copy) NSString              * coverLargePop;
@property (nonatomic , assign) NSInteger              unReadAlbumCommentCount;
@property (nonatomic , assign) BOOL              canShareAndStealListen;
@property (nonatomic , assign) BOOL              isRecordDesc;
@property (nonatomic , assign) NSInteger              createdAt;
@property (nonatomic , copy) NSString              * categoryName;
@property (nonatomic , assign) NSInteger              offlineReason;
@property (nonatomic , assign) NSInteger              status;
@property (nonatomic , assign) NSInteger              serialState;
@property (nonatomic , assign) BOOL              isPaid;
@property (nonatomic , assign) NSInteger              lastUptrackAt;
@property (nonatomic , assign) NSInteger              offlineType;
@property (nonatomic , copy) NSString              * coverOrigin;
@property (nonatomic , copy) NSString              * tags;
@property (nonatomic , assign) BOOL              isVip;
@property (nonatomic , assign) BOOL              canInviteListen;
@property (nonatomic , assign) NSInteger              subscribeCount;
@property (nonatomic , assign) NSInteger              albumId;
@property (nonatomic , copy) NSString              * coverWebLarge;
@property (nonatomic , assign) NSInteger              tracks;
@property (nonatomic , copy) NSString              * other_title;
@property (nonatomic , copy) NSString              * title;
@property (nonatomic , copy) NSString              * shortIntroRich;
@property (nonatomic , copy) NSString              * detailCoverPath;
@property (nonatomic , copy) NSString              * avatarPath;
@property (nonatomic , assign) NSInteger              refundSupportType;
@property (nonatomic , copy) NSString              * customSubTitle;
@property (nonatomic , copy) NSString              * coverSmall;


@end
