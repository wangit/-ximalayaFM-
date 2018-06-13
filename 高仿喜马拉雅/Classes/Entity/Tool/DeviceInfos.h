//
//  DeviceInfos.h
//  GGHypertensionDoctor
//
//  Created by 深海小飞象🐙哥 on 2017/2/22.
//  Copyright © 2017年 gorgonor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceInfos : NSObject

//! 得到设备的名字（例如：iPhone6s）
+ (NSString *)getDeviceName;

//! 获取设备系统的版本号(例如：10.2)
+ (NSString *)getDeviceSystemVersion;

//imei
+ (NSString *)getDeviceIdentifier;

//version
+ (NSString *)getAppVersion;

@end

