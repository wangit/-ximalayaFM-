//
//  WXHomeViewController.h
//  高仿喜马拉雅
//
//  Created by 甲和灯 on 2016/11/25.
//  Copyright © 2016年 jiahedeng. All rights reserved.
//

#import "WXViewController.h"
#import "DLCustomSlideView.h"

@interface WXHomeViewController : WXViewController<DLCustomSlideViewDelegate,UISearchBarDelegate>
@property (strong, nonatomic)  DLCustomSlideView *slideView;
@end
