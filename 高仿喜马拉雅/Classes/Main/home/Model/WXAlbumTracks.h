//
//  WXAlbumTracks.h
//  高仿喜马拉雅
//
//  Created by 深海小飞象🐙哥 on 2017/6/13.
//  Copyright © 2017年 jiahedeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXAlbumTracks : NSObject

@property (nonatomic , assign) NSInteger              status;
@property (nonatomic , copy) NSString              * title;
@property (nonatomic , assign) BOOL              isVideo;
@property (nonatomic , assign) NSInteger              processState;
@property (nonatomic , assign) NSInteger              duration;
@property (nonatomic , copy) NSString              * nickname;
@property (nonatomic , assign) NSInteger              userSource;
@property (nonatomic , copy) NSString              * playPathHq;
@property (nonatomic , copy) NSString              * coverMiddle;
@property (nonatomic , assign) BOOL              isPaid;
@property (nonatomic , assign) NSInteger              likes;
@property (nonatomic , assign) NSInteger              shares;
@property (nonatomic , copy) NSString              * playPathAacv224;
@property (nonatomic , assign) NSInteger              createdAt;
@property (nonatomic , copy) NSString              * smallLogo;
@property (nonatomic , assign) NSInteger              albumId;
@property (nonatomic , assign) NSInteger              playtimes;
@property (nonatomic , copy) NSString              * playUrl64;
@property (nonatomic , copy) NSString              * playPathAacv164;
@property (nonatomic , copy) NSString              * playUrl32;
@property (nonatomic , assign) NSInteger              uid;
@property (nonatomic , copy) NSString              * coverSmall;
@property (nonatomic , copy) NSString              * coverLarge;
@property (nonatomic , assign) NSInteger              comments;
@property (nonatomic , assign) NSInteger              trackId;
@property (nonatomic , assign) BOOL              isDraft;
@property (nonatomic , assign) NSInteger              opType;
@property (nonatomic , assign) BOOL              isPublic;



@end
