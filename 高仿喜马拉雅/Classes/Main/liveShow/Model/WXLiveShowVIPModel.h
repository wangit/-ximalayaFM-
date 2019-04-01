//
//  WXLiveShowVIPModel.h
//  高仿喜马拉雅
//
//  Created by 小帅哥 on 2019/3/29.
//  Copyright © 2019 jiahedeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WXLiveShowVIPlist : NSObject
@property (nonatomic, strong) NSString *adtype;// = 3;
@property (nonatomic, strong) NSString *avatar ;//  "/style/avatar/8e1/500265_big.jpg?t=1553856921";
@property (nonatomic, strong) NSString *avatartime ;//  1553856921;
@property (nonatomic, strong) NSString *bigpic ;//  "<null>";
@property (nonatomic, strong) NSString *broadcasting ;//  y;
@property (nonatomic, strong) NSString *channel_id ;//  0;
@property (nonatomic, strong) NSString *city ;//  "\U5e7f\U5dde";
@property (nonatomic, strong) NSString *copyright ;//  "\U6bd4\U5fc3\U4e0b\U8f7d:xt-jj.cn \U623f\U53f7:500265";
@property (nonatomic, strong) NSString *curroomnum ;//  1792662882;
@property (nonatomic, strong) NSString *emceelevel ;//  10;
@property (nonatomic, strong) NSString *gameType ;//  0;
@property (nonatomic, strong) NSString *id ;//  500265;
@property (nonatomic, strong) NSString *intro ;//  "\U52a0v\U798f\U5229\U591a\U591a\U54df";
@property (nonatomic, strong) NSString *is_attention;//  0;
@property (nonatomic, strong) NSString *level ;//  10;
//limit ;//                  {
//    bsid ;//  251873;
//    come ;//  0;
//    id ;//  94084;
//    money ;//  18;
//    online ;//  1;
//    plid ;//  94084;
//    prerequisite ;//  18;
//    "preview_time" ;//  10;
//    ptid ;//  4;
//    ptname ;//  "\U8ba1\U65f6\U6536\U8d39";
//};
@property (nonatomic, strong) NSString *nickname ;//  "\U5927\U59b9\U5b50";
@property (nonatomic, strong) NSString *offlinevideo ;//  "<null>";
@property (nonatomic, strong) NSString *online ;//  658;
@property (nonatomic, strong) NSString *onlinenum ;//  0;
@property (nonatomic, strong) NSString *private ;//  1;
@property (nonatomic, strong) NSString *sex ;//  1;
@property (nonatomic, strong) NSString *snap ;//  "/style/avatar/8e1/500265.jpg?t;// 1553856921";
@property (nonatomic, strong) NSString *sort_no ;//  2;
@property (nonatomic, strong) NSString *toy_status ;//  0;
@property (nonatomic, strong) NSString *up_score;//  1158;
@property (nonatomic, strong) NSString *video_status;//  0;

@end

@interface WXLiveShowVIPData : NSObject

@property (nonatomic, strong) NSArray <WXLiveShowVIPlist *> *list;

@end

@interface WXLiveShowVIPModel : NSObject
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) WXLiveShowVIPData *data;
@end

NS_ASSUME_NONNULL_END
