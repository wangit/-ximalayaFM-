//
//  WXDiscoverModel.h
//  高仿喜马拉雅
//
//  Created by 深海小飞象🐙哥 on 2017/6/12.
//  Copyright © 2017年 jiahedeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXDiscoverModel : NSObject


/** contentType  */
@property (nonatomic, strong) NSString *contentType;
/** contentUpdatedAt  */
@property (nonatomic, strong) NSString *contentUpdatedAt;
/** coverPath  */
@property (nonatomic, strong) NSString *coverPath;
/** enableShare  */
@property (nonatomic, strong) NSString *enableShare;
/** id  */
@property (nonatomic, strong) NSString *idList;
/** isExternalUrl  */
@property (nonatomic, strong) NSString *isExternalUrl;
/** properties  */
@property (nonatomic, strong) NSDictionary *properties;
/** sharePic  */
@property (nonatomic, strong) NSString *sharePic;
/** subCoverPath  */
@property (nonatomic, strong) NSString *subCoverPath;
/** subtitle  */
@property (nonatomic, strong) NSString *subtitle;
/** title  */
@property (nonatomic, strong) NSString *title;
/** subCoverPath  */
@property (nonatomic, strong) NSString *url;
@end
