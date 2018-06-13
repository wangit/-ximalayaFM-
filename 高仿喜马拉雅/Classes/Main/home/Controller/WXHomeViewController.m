//
//  WXHomeViewController.m
//  高仿喜马拉雅
//
//  Created by 甲和灯 on 2016/11/25.
//  Copyright © 2016年 jiahedeng. All rights reserved.
//

#import "WXHomeViewController.h"
#import "DLScrollTabbarView.h"
#import "DLLRUCache.h"
//controller
#import "WXHotVideoViewController.h"
#import "WXRecommendViewController.h"
@interface WXHomeViewController (){
    NSMutableArray *itemArray_;
}
@end

@implementation WXHomeViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        itemArray_ = [NSMutableArray array];

    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self registTitleScroll];
    [self configNavgation];
    [self configTitleScroll];
   

}
- (void)configNavgation{
    //加上 搜索栏
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH- WidthScale(150), 35)];
    [titleView setBackgroundColor:[UIColor clearColor]];
    UITapGestureRecognizer *singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleRecognizerTap)];
    //点击的次数
    singleRecognizer.numberOfTapsRequired = 1; // 单击
    //给self.view添加一个手势监测；
    [titleView addGestureRecognizer:singleRecognizer];
    UITextField *searchBar = [[UITextField alloc] init];
    searchBar.frame = CGRectMake(10, 1, SCREEN_WIDTH- WidthScale(150), 33);
    searchBar.layer.cornerRadius = 16.5;
    searchBar.font = [UIFont systemFontOfSize:14];
    searchBar.layer.masksToBounds = YES;
    searchBar.backgroundColor = [UIColor whiteColor];
    searchBar.placeholder = @"    🔍搜索你想要的东西";
    [titleView addSubview:searchBar];
    searchBar.userInteractionEnabled = NO;
    [self.navigationItem.titleView sizeToFit];
    UIBarButtonItem * left=[[UIBarButtonItem alloc]initWithCustomView:titleView];
    self.navigationItem.leftBarButtonItem = left;
    
    
    //导航栏一侧有多个按钮的时候
    //写成一个view上
    UIView * viewBackInNavi=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WidthScale(80), 30)];
    viewBackInNavi.backgroundColor=[UIColor clearColor];
    viewBackInNavi.userInteractionEnabled=YES;
    //重做按钮
    UIButton *myRightRePaintBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0,  WidthScale(35), 30)];
    [myRightRePaintBtn addTarget:self action:@selector(historyTap) forControlEvents:UIControlEventTouchUpInside];
    [myRightRePaintBtn setBackgroundColor:[UIColor clearColor]];
    [myRightRePaintBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [myRightRePaintBtn setImage:[UIImage imageNamed:@"历史"] forState:UIControlStateNormal];
    [myRightRePaintBtn setTitle:[NSString stringWithFormat:@" %@",NSLocalizedString(@"local_paintAgain", nil)] forState:UIControlStateNormal];
    myRightRePaintBtn.titleLabel.adjustsFontSizeToFitWidth=YES;
    [viewBackInNavi addSubview:myRightRePaintBtn];
    
    //提交按钮
    UIButton *myRightSubmitBtn=[[UIButton alloc]initWithFrame:CGRectMake(35, 0,  WidthScale(35), 30)];
    [myRightSubmitBtn addTarget:self action:@selector(downTap) forControlEvents:UIControlEventTouchUpInside];
    [myRightSubmitBtn setBackgroundColor:[UIColor clearColor]];
    [myRightSubmitBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [myRightSubmitBtn setImage:[UIImage imageNamed:@"下载"] forState:UIControlStateNormal];
    [myRightSubmitBtn setTitle:[NSString stringWithFormat:@" %@",NSLocalizedString(@"local_card", nil)] forState:UIControlStateNormal];
    myRightSubmitBtn.titleLabel.adjustsFontSizeToFitWidth=YES;
    [viewBackInNavi addSubview:myRightSubmitBtn];
    
    UIBarButtonItem * right=[[UIBarButtonItem alloc]initWithCustomView:viewBackInNavi];
    //将整个viewBackInNavi右移10
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]   initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace   target:nil action:nil];
    negativeSpacer.width =-10;//负数为右移，正数为左移
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,right, nil];
    self.navigationController.navigationBar.tintColor = kBSColorSubTitle;
    
}
- (void)configTitleScroll{
    self.automaticallyAdjustsScrollViewInsets = NO; // 如果你使用了UITabBarController, 系统会自动调整scrollView的inset。加上这个如果出错的话。
    self.slideView = [[DLCustomSlideView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.slideView.delegate = self;
    self.slideView.backgroundColor = UIColorFromRGB(0x232323);
    [self.view addSubview:self.slideView];
    DLLRUCache *cache = [[DLLRUCache alloc] initWithCount:6];
    DLScrollTabbarView *tabbar = [[DLScrollTabbarView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 35)];
    tabbar.tabItemNormalColor = kBSColorSubTitle;
    tabbar.tabItemSelectedColor = kBSColorAppTheme;
    tabbar.tabItemNormalFontSize = 14.0f;
    tabbar.trackColor = kBSColorAppTheme;
    tabbar.backgroundColor = kBSColorNavBar;
    NSArray *arrayTitle = [NSArray arrayWithObjects:@"推荐",@"热门",@"分类",@"榜单",@"主播", nil];
    for (int i=0; i<5; i++) {
        DLScrollTabbarItem *iitem = [DLScrollTabbarItem itemWithTitle:[NSString stringWithFormat:@"%@", arrayTitle[i]] width:SCREEN_WIDTH/5];
        [itemArray_ addObject:iitem];
    }
    tabbar.tabbarItems = itemArray_;
    self.slideView.tabbar = tabbar;
    self.slideView.cache = cache;
    self.slideView.tabbarBottomSpacing = 0;
    self.slideView.baseViewController = self;
    [self.slideView setup];
    self.slideView.selectedIndex = 1;
}
- (NSInteger)numberOfTabsInDLCustomSlideView:(DLCustomSlideView *)sender{
    
    return itemArray_.count;
}

- (UIViewController *)DLCustomSlideView:(DLCustomSlideView *)sender controllerAt:(NSInteger)index{
    
    if (index == 1) {
        WXHotVideoViewController *ctrl = [[WXHotVideoViewController alloc] init];
        return ctrl;
    }
    if (index == 0) {
        WXRecommendViewController*ctrl = [[WXRecommendViewController alloc] init];
        return ctrl;

    }
    else{
        UIViewController *ctrl = [[UIViewController alloc] init];
        int32_t rgbValue = rand();
        ctrl.view.backgroundColor = [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
        return ctrl;
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)registTitleScroll{
    NSURL * url=[[NSBundle mainBundle] URLForResource:@"WXTitleScroll" withExtension:@"geojson"];
    NSData *data=[NSData dataWithContentsOfURL:url];
    if (data)
    {
        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    }
    else
    {
        NSLog(@"err");
    }
}
- (void)singleRecognizerTap{
    NSLog(@"sasasasasasa");
}
- (void)historyTap{
    NSLog(@"sasasasasasa");

}
- (void)downTap{
    NSLog(@"sasasasasasa");

}
@end
