//
//  BSSystemConfigure.h
//  BSMedical
//
//  系统配置
//  Created by 王通 on 16/4/7.
//  Copyright © 2016年 BSoft. All rights reserved.
//

#ifndef BSSystemConfigure_h
#define BSSystemConfigure_h

/* ********************一些配置********************* */
//来自服务端定义
#define KCodeStatus           @"code"
#define KMessage              @"msg"
#define KDataBody             @"data"

#define kBSPageNo @"start" //页码
#define kBSPageSize @"length" //每页数据条数

#define BS_SYS_CITYID               @"131230"
#define BS_SYS_CITY                 @"中山市"

/* ********************一些颜色字体配置********************* */

#define kBSApiHost_Zhongshan @"http://183.58.24.160:802"

//APP 主题颜色
#define kBSColorAppTheme UIColorFromRGB(0xF66549)

//导航栏颜色
#define kBSColorNavBar UIColorFromRGB(0xF6F6F6)
#define kBSColorNavBarTitle UIColorFromRGB(0x000000)

//View 默认背景色
#define kBSColorViewDefaultBackground UIColorFromRGB(0xeeeeee)

//白色
#define kBSColorWhite [UIColor whiteColor]

//边框灰色
#define kBSColorBorderGray UIColorFromRGB(0xCCCCCC)

//背景黄色
#define kBSColorBackgroundYellow UIColorFromRGB(0xFFFAD0)

//分割线颜色
#define kBSColorSeparatorLine UIColorFromRGB(0xECECEC)

//不可用时显示的颜色
#define kBSColorDisable UIColorFromRGB(0xdcdcdc)

//字体颜色
#define kBSColorTitle    UIColorFromRGB(0x323232)
#define kBSColorSubTitle UIColorFromRGB(0x999999)

//其他颜色
#define kBSColorBlack UIColorFromRGB(0x000000)
#define kBSColorGreen UIColorFromRGB(0x57b441)
#define kBSColorGreenLight UIColorFromRGB(0xc9ddaa)

#define kBSColorOrange UIColorFromRGB(0xfda73f)
#define kBSColorOrangeLight UIColorFromRGB(0xfbc764)
#define kBSColorYellow UIColorFromRGB(0xfbe764)

#define KBSColorRed UIColorFromRGB(0xe74c3c)

//字体大小
#define kBSFontNavTitle [UIFont systemFontOfSize:16]
#define kBSFontTitle    [UIFont systemFontOfSize:14]
#define kBSFontSubTitle [UIFont systemFontOfSize:12]
//天气页字体大小
#define kBSFontWeatherSub [UIFont systemFontOfSize:12]
/*
static inline BOOL IsEmpty(id thing) {
    return thing == nil || [thing isEqual:[NSNull null]]
    || ([thing respondsToSelector:@selector(length)]
        && [(NSData *)thing length] == 0)
    || ([thing respondsToSelector:@selector(count)]
        && [(NSArray *)thing count] == 0);
}
static inline NSString *StringFromObject(id object) {
    if (object == nil ||
        [object isEqual:[NSNull null]] ||
        [object isEqual:@"(null)"] ||
        [object isEqual:@"null"]) {
        return @"";
    } else if ([object isKindOfClass:[NSString class]]) {
        return object;
    } else if ([object respondsToSelector:@selector(stringValue)]){
        return [object stringValue];
    } else {
        return [object description];
    }
}

static inline NSDictionary *DictionaryWithIDArray(id *array, NSUInteger count) {
    id keys[count];
    id objs[count];
    
    for(NSUInteger i = 0; i < count; i++) {
        keys[i] = array[i * 2];
        objs[i] = array[i * 2 + 1];
    }
    
    return [NSDictionary dictionaryWithObjects: objs forKeys: keys count: count];
}

static inline BOOL IsZeroFloat(float f) {
    
    const float EPSINON = 0.0001;
    if ((f >= -EPSINON) && f <= EPSINON) {
        return YES;
    }
    return NO;
}

*/

#endif /* BSSystemConfigure_h */
