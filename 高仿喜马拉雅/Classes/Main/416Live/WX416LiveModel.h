//
//  WX416LiveModel.h
//  高仿喜马拉雅
//
//  Created by 小帅哥 on 2019/5/31.
//  Copyright © 2019 jiahedeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface WX416List : NSObject
@property (nonatomic, copy)   NSString *title;
@property (nonatomic, copy)   NSString *name;
@property (nonatomic, copy)   NSString *img;
@property (nonatomic, copy)   NSString *number;
@property (nonatomic, copy)   NSString *is_badge;
@property (nonatomic, copy)   NSString *level;
@property (nonatomic, copy)   NSString *play_url;

//http://www.221751.com/mobile/live/anchors
@end
@interface WX416Datum : NSObject
@property (nonatomic, copy)   NSMutableArray<WX416List *> *lists;
@property (nonatomic, copy) NSString *coun;
@end

@interface WX416LiveModel : NSObject
@property (nonatomic, copy)   NSString *msg;
@property (nonatomic, strong)  WX416Datum *data;
@property (nonatomic, assign) NSInteger code;


@end

NS_ASSUME_NONNULL_END
