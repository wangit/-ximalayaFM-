//
//  WXLiveShowModel.h
//  高仿喜马拉雅
//
//  Created by lifesea on 2018/6/7.
//  Copyright © 2018年 jiahedeng. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface WXSwitchs : NSObject
@property (nonatomic, copy) NSString *push_on;
@end

@interface WXYinxiang : NSObject
@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *name;
@end

@interface WXAnchor : NSObject
@property (nonatomic, copy)   NSString *video_address_suffix;
@property (nonatomic, copy)   NSString *push_video_add;
@property (nonatomic, copy)   NSString *push_video_add2;
@property (nonatomic, copy)   NSString *anchor_rank_id;
@property (nonatomic, copy)   NSString *avatar;
@property (nonatomic, copy)   NSString *balance;
@property (nonatomic, assign) NSInteger beibeiVerify;
@property (nonatomic, assign) NSInteger birthday;
@property (nonatomic, copy)   NSString *age;
@property (nonatomic, copy)   NSString *constellation;
@property (nonatomic, copy)   NSArray *devices;
@property (nonatomic, copy)   NSString *emotion;
@property (nonatomic, assign) NSInteger exp;
@property (nonatomic, assign) NSInteger fansNum;
@property (nonatomic, assign) NSInteger followNum;
@property (nonatomic, assign) NSInteger haoyouNum;
@property (nonatomic, copy)   NSString *gender;
@property (nonatomic, copy)   NSString *haoma;
@property (nonatomic, copy)   NSString *hometownCity;
@property (nonatomic, copy)   NSString *hometownProvince;
@property (nonatomic, copy)   NSString *id;
@property (nonatomic, copy)   NSString *im_sig;
@property (nonatomic, copy)   NSString *im_uid;
@property (nonatomic, copy)   NSString *is_follow;
@property (nonatomic, copy)   NSString *job;
@property (nonatomic, copy)   NSString *live_banner;
@property (nonatomic, copy)   NSString *nickname;
@property (nonatomic, copy)   NSArray *oauths;
@property (nonatomic, assign) NSInteger person_verify;
@property (nonatomic, copy)   NSString *rank_id;
@property (nonatomic, copy)   NSString *reg_time;
@property (nonatomic, copy)   NSString *summary;
@property (nonatomic, strong) WXSwitchs *switchs;
@property (nonatomic, copy)   NSString *ticket;
@property (nonatomic, copy)   NSString *total_send_gift;
@property (nonatomic, copy)   NSString *total_ticket;
@property (nonatomic, copy)   NSString *unique_id;
@property (nonatomic, copy)   NSString *viplevel;
@property (nonatomic, copy)   NSString *vipUtil;
@property (nonatomic, copy)   NSString *update_avatar_time;
@property (nonatomic, copy)   NSString *is_no_play;
@property (nonatomic, copy)   NSString *JF_XNB;
@property (nonatomic, copy)   NSString *isblock;
@property (nonatomic, copy)   NSString *guizhu;
@property (nonatomic, copy)   NSString *guizhu_vailddate;
@property (nonatomic, copy)   NSString *pwd;
@end
@interface WXDatum : NSObject
@property (nonatomic, strong) WXAnchor *anchor;
@property (nonatomic, copy)   NSString *identifier;
@property (nonatomic, copy)   NSString *lat;
@property (nonatomic, copy)   NSString *lng;
@property (nonatomic, copy)   NSString *location;
@property (nonatomic, copy)   NSString *people_num;
@property (nonatomic, copy)   NSString *endtime;
@property (nonatomic, copy)   NSString *download_video_add;
@property (nonatomic, copy)   NSString *chat_add;
@property (nonatomic, copy)   NSString *game_url;
@property (nonatomic, copy)   NSString *bottom_url;
@property (nonatomic, copy)   NSString *bottom_url_height;
@property (nonatomic, copy)   NSString *img1;
@property (nonatomic, copy)   NSString *img2;
@property (nonatomic, copy)   NSString *isphone;
@property (nonatomic, copy)   NSString *isPayMode;
@property (nonatomic, copy)   NSArray<WXYinxiang *> *yinxiang;
@property (nonatomic, copy)   NSString *touch_height;
@end

@interface WXLiveShowModel : NSObject
@property (nonatomic, copy)   NSString *action;
@property (nonatomic, copy)   NSMutableArray<WXDatum *> *data;
@property (nonatomic, assign) NSInteger apiCode;
@end
