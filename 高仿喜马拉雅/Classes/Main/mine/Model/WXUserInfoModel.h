//
//  WXUserInfoModel.h
//  高仿喜马拉雅
//
//  Created by 深海小飞象🐙哥 on 2017/6/12.
//  Copyright © 2017年 jiahedeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXUserInfoModel : NSObject
@property (nonatomic , assign) NSInteger              favorites;
@property (nonatomic , copy) NSString              * msg;
@property (nonatomic , assign) NSInteger              tingGroupPraiseCount;
@property (nonatomic , assign) NSInteger              tingGroupCommentCount;
@property (nonatomic , assign) NSInteger              albumRecommentIndentitier;
@property (nonatomic , assign) NSInteger              contents;
@property (nonatomic , assign) NSInteger              tracks;
@property (nonatomic , assign) NSInteger              lastDayPlayedNum;
@property (nonatomic , assign) NSInteger              newEventCount;
@property (nonatomic , assign) NSInteger              albums;
@property (nonatomic , assign) NSInteger              events;
@property (nonatomic , assign) NSInteger              usedSpace;
@property (nonatomic , assign) NSInteger              newAts;
@property (nonatomic , assign) NSInteger              ret;
@property (nonatomic , assign) NSInteger              lastDaySubcribed;
@property (nonatomic , assign) BOOL              ifShowAskAndAnswerBubble;
@property (nonatomic , assign) BOOL              ifShowBubble;
@property (nonatomic , assign) BOOL              isVip;
@property (nonatomic , assign) NSInteger              newComments;
@property (nonatomic , assign) NSInteger              waittingCount;
@property (nonatomic , assign) NSInteger              newZoneCommentCount;
@property (nonatomic , assign) NSInteger              noReadFollowers;
@property (nonatomic , copy) NSString              * mobileLargeLogo;
@property (nonatomic , assign) NSInteger              answeredCount;
@property (nonatomic , assign) BOOL              isOpenAskAndAnswer;
@property (nonatomic , assign) NSInteger              askAndAnswerAccumulatedIncome;
@property (nonatomic , assign) NSInteger              incomeIdentifier;
@property (nonatomic , copy) NSString              * location;
@property (nonatomic , assign) NSInteger              stateInfoIdentifier;
@property (nonatomic , assign) NSInteger              totalSubcribed;
@property (nonatomic , assign) NSInteger              listeneds;
@property (nonatomic , assign) BOOL              favoriteAlbumIsUpdate;
@property (nonatomic , assign) NSInteger              noReadAskAndAnswerMsgs;
@property (nonatomic , assign) NSInteger              favoriteAlbums;
@property (nonatomic , assign) NSInteger              followers;
@property (nonatomic , assign) NSInteger              newFeedCount;
@property (nonatomic , assign) NSInteger              followingTags;
@property (nonatomic , assign) NSInteger              followings;
@property (nonatomic , assign) NSInteger              albumNewCommentCount;
@property (nonatomic , assign) NSInteger              newNotices;
@property (nonatomic , copy) NSString              * vipUrl;
@property (nonatomic , assign) NSInteger              registerTime;
@property (nonatomic , copy) NSString              * backgroundLogo;
@property (nonatomic , assign) BOOL              hasLive;
@property (nonatomic , assign) NSInteger              leters;
@property (nonatomic , assign) NSInteger              livingCount;
@property (nonatomic , assign) NSInteger              groupCount;
@property (nonatomic , assign) NSInteger              totalPlayedNum;
@property (nonatomic , assign) NSInteger              uid;
@property (nonatomic , copy) NSString              * mobileSmallLogo;
@property (nonatomic , copy) NSString              * nickname;
@property (nonatomic , assign) BOOL              hasPwd;
@property (nonatomic , assign) NSInteger              gender;
@property (nonatomic , assign) NSInteger              messages;
@property (nonatomic , assign) NSInteger              overCount;
@property (nonatomic , copy) NSString              * mobileMiddleLogo;
@property (nonatomic , assign) BOOL              musician;
@property (nonatomic , assign) BOOL              isVerified;
@property (nonatomic , assign) NSInteger              newThirdRegisters;
@property (nonatomic , assign) NSInteger              vipExpireTime;
@property (nonatomic , assign) NSInteger              totalSpace;
@end
